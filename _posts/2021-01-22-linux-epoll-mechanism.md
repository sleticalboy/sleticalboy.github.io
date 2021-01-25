---
layout: post
title: linux epoll 机制
author: sleticalboy
date: 2021-01-22 22:06:30 +0800
category: linux
tags: [technology]
---

一次监听多个 fd 的可读/可写状态

## 基本概念

epoll：是一种 I/O 时间通信机制，是 Linux 内核实现 IO 多路复用的一种方式。

IO 多路复用：在一个操作里同时监听多个输入输出源，在其中一个或多个输入输出源可用的时候
返回，然后对其进行读写操作。

输入输出源：可以是文件（file）、网络（socket）、进程间的管道（pipe），因在 Linux 中
“一切皆文件”，所以都是用文件描述符（fd）来表示

可读事件：当 fd 关联的内核缓冲区非空有数据可读时，则触发可读事件；
可写事件：当 fd 关联的内核缓冲区不满有空闲空间可写时，则触发可写事件；


通知机制：当事件发生时，主动通知；
轮询机制：循环检查是否有事件发生，是通知机制的反面；

再来解读 epoll 机制：当 fd 关联的内核缓冲区非空时，发出可读信号；当缓冲区不满时，发出
可写信号。

## epoll API

epoll 的核心是 3 个 API，其核心数据结构（eventpoll）是 1 个红黑树（rb tree）和 1 个
链表；该结构体在内核源码中位于 `fs/eventpoll.c` 文件中，如下：

```cpp
/* 存储在文件结构的“ private_data”成员内部的数据结构，用于表示eventpoll接口的主要数据结构。*/
struct eventpoll {
    /* 调用 epoll_create 时会在内核中创建一个特殊的 file 节点 */
    struct file *file;
    /* 红黑树，用于存储监听的 fd，即 epoll_ctl 传过来的 fd*/
    struct rb_root_cached rbr;
    /* 双向链表，用于存储将要通过 epoll_wait 返回给用户的满足条件的事件 */
    struct list_head rdllist;
    /* 就绪链表，用于存储将从内核空间转移到用户空间的已就绪的 epitem */
    struct epitem *ovflist;
};
```

1、`epoll_create(int size)`

参数 size 表示最多可以监听多少个 fd，但是通过 Linux 开发手册来看，新版本中已经弃用了
该参数，但是注意不要传 0；返回值 >= 0 表示成功，< 0 表示失败

调用该 API 后操作系统内核会产生一个 eventpoll 实例的数据结构并返回一个 fd，这个 fd
就是 epoll 实例的句柄，下面的两个 API 都以它为中心。


2、`epoll_ctl(int epfd, int op, int fd, struct epoll_event *event)`

管理注册事件，向 epoll 添加、删除或修改要监听的 fd
这里的控制指令有: EPOLL_CTL_ADD/EPOLL_CTL_DEL/EPOLL_CTL_MOD
epfd 表示 epoll_create() 的返回值, op 表示控制指令, fd 表示要监听的 fd
event 表示 epoll_event 结构体
```cpp
typedef union epoll_data {
   void        *ptr;
   int          fd;
   uint32_t     u32;
   uint64_t     u64;
} epoll_data_t;

struct epoll_event {
   uint32_t     events;  // 表示监听的事件类型(EPOLLIN/EPOLLHUP/EPOLLOUT...)
   epoll_data_t data; // 用户自定义数据，当事件发生时将会原样返回给用户
};
```
该结构体声明在 `/usr/include/linux/eventpoll.h` 中，如下：

```cpp
/* Valid opcodes to issue to sys_epoll_ctl() */
/* epoll_ctl() op 参数可用的值*/
#define EPOLL_CTL_ADD 1 // 添加
#define EPOLL_CTL_DEL 2 // 删除
#define EPOLL_CTL_MOD 3 // 修改

/* Epoll event masks */
/* epoll_event->events 可用的值，表示感兴趣的 epoll 事件*/
#define EPOLLIN     0x00000001
#define EPOLLOUT    0x00000004
#define EPOLLERR    0x00000008
#define EPOLLHUP    0x00000010

struct epoll_event {
    __u32 events;
    __u64 data;
} EPOLL_PACKED;
```

3、`epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout)`

等待监听的事件到来，返回值表示到来事件的个数，返回的事件存储在 events 数组中

当此方法调用时，观察 eventpoll->rdllist 链表中是否有数据即可，有数据就返回无数据则陷
入等待状态，等 timeout 事件到后即使链表没数据也返回，因此 epoll_wait 是高效的


## 触发机制

1、水平触发：level trigger（LT）

读：只要缓冲区不为空就返回读就绪
写：只要缓冲区不满就返回写就绪

即：只要有数据就会触发，缓冲区剩余未读尽的数据会导致 epoll_wait() 返回

2、边缘触发：edge trigger（ET）

读：缓冲区由不可读变为可读（空->非空）、有新数据到达时、缓冲区有数据可读且使用 
EPOLL_CTL_MODE 修改 EPOLLIN 事件时
写：缓冲区由不可写变为可写（满->非满）、旧数据被送走时、缓冲区有空间可写且使用 
EPOLL_CTL_MODE 修改 EPOLLOUT 事件时

即：只有数据到来才触发，不管缓冲区中是否有数据，缓冲区剩余未读尽的数据不会导致 
epoll_wait() 返回

通过上面的对比，ET 模式的效率是高于 LT 模式的，但不知为何 epoll 默认的工作模式是 LT 
模式

## epoll 与 select 和 poll 对比

1、用户态将 fd 传入内核的方式

select：从户态创建拷贝到内核态
poll：从用户态拷贝到内核态
epoll：直接在内核态创建，红黑树、链表

2、内核态检测 fd 读写状态的方式

select：轮询机制遍历所有的 fd
poll：轮询机制遍历所有的 fd
epoll：回调机制，调用 cpoll_ctl 时会在内核态注册回调函数

3、找到就绪 fd 并传递给用户态的方式

select：将 fd 集合从内核态拷贝到用户态，然后遍历查找就绪 fd
poll：同 select 
epoll：epoll_wait 只观察已就绪的 fd（通过 mmap 实现），直接遍历并依次处理即可

4、重复监听的处理方式

select：将新的需监听的 fd 集合拷贝到内核态，重复以上步骤
poll：同 select
epoll：无需构建新的红黑树，直接沿用即可

## epoll 更高效的原因

1、select 和 poll 的动作基本一致，知识 poll 采用链表的方式来尽心 fd 的存储，而 select
采用 fd 标注位来存放，所以 select 会收到最大连接说的限制而 poll 不会

2、select、poll、epoll 虽然都会返回就绪的 fd 数量，但是 select 和 poll 并不会明确指
出是哪些 fd 就绪，而 epoll 会。造成的区别就是：系统调用返回后，调用 select 和 poll
的程序需要遍历监听的整个文件描述符找到是谁处于就绪，而 epoll 则可以直接处理

3、select 和 poll 都需要将有关 fd 的数据机构拷贝进内核空间，最后再拷贝出来。而 epoll
创建的有关 fd 的数据结构本就存于内核态，系统调用时利用 mmap 加速内核空间的消息传递：
即 epoll 使用 mmap 来减少复制开销

4、 select 和 poll 采用轮询的方式来检查 fd 是否处于就绪态而 epoll 采用回调机制，这就
会：随着 fd 数量的增加，select 和 poll 的效率会越来越低，而 epoll 则不会受到太大影响

5、epoll 的 ET 模式效率高，系统不会充斥大量不关心的就绪 fd 


## 参考资料

[彻底搞懂epoll高效运行的原理](https://baijiahao.baidu.com/s?id=1641172494287388070&wfr=spider&for=pc)

[epoll原理详解及epoll反应堆模型](https://blog.csdn.net/daaikuaichuan/article/details/83862311)
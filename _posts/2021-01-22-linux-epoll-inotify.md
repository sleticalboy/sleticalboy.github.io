---
layout: post
title: linux epoll & inotify 机制
author: sleticalboy
date: 2021-01-22 22:06:30 +0800
category: linux
tags: [technology]
---

## epoll 机制

### 一、基本概念

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

### epoll API

epoll 的核心是 3 个 API，其核心数据结构（eventpoll）是 1 个红黑树（rb tree）和 1 个
链表；该结构体在 Android 内核中位于 `fs/eventpoll.c` 中，如下：

```cpp
/*
 * This structure is stored inside the "private_data" member of the file
 * structure and represents the main data structure for the eventpoll
 * interface.
 */
struct eventpoll {

    /* Wait queue used by sys_epoll_wait() */
    wait_queue_head_t wq;

    /* Wait queue used by file->poll() */
    wait_queue_head_t poll_wait;

    /* 红黑树
     * RB tree root used to store monitored fd structs
     */
    struct rb_root_cached rbr;

    /* 链表
     * This is a single linked list that chains all the "struct epitem" that
     * happened while transferring ready events to userspace w/out
     * holding ->lock.
     */
    struct epitem *ovflist;

    /* wakeup_source used when ep_scan_ready_list is running */
    struct wakeup_source *ws;

    /* The user that created the eventpoll descriptor */
    struct user_struct *user;

    struct file *file;
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
#define EPOLLPRI    0x00000002
#define EPOLLOUT    0x00000004
#define EPOLLERR    0x00000008
#define EPOLLHUP    0x00000010
#define EPOLLRDNORM 0x00000040
#define EPOLLRDBAND 0x00000080
#define EPOLLWRNORM 0x00000100
#define EPOLLWRBAND 0x00000200
#define EPOLLMSG    0x00000400
#define EPOLLRDHUP  0x00002000

struct epoll_event {
    __u32 events;
    __u64 data;
} EPOLL_PACKED;
```


1, `epoll_create(int size)`

调用该 API 后操作系统内核会产生一个 epoll 实例的数据结构并返回一个 fd，这个 fd 就是
epoll 实例的句柄，下面的两个 API 都以它为中心。

参数 size 表示最多可以监听多少个 fd，但是通过 Linux 开发手册来看，新版本中已经弃用了
该参数，但是注意不要传 0；返回值 >= 0 表示成功，< 0 表示失败


2, `epoll_ctl(int epfd, int op, int fd, struct epoll_event *event)`

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

3, `epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout)`

等待事件到来，返回值表示有多少个事件到来，返回的事件都在 events 数组中


---
## inotify 机制
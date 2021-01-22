---
layout: post
title: linux epoll & inotify 机制
author: sleticalboy
date: 2021-01-22 22:06:30 +0800
category: linux
tags: [technology]
---

## epoll

```cpp
// 创建 epoll 句柄，size 表示最多可监听几个 fd
// 返回值 >= 0 表示成功，< 0 表示失败
int epoll_create(int size);
// 管理注册事件，向 epoll 添加、删除或修改要监听的 fd
// 这里的控制指令有: EPOLL_CTL_ADD/EPOLL_CTL_DEL/EPOLL_CTL_MOD
// epfd 表示 epoll_create() 的返回值, op 表示控制指令, fd 表示要监听的 fd
// event 表示 epoll_event 结构体
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
int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event)
// 等待事件到来，返回值表示有多少个事件到来，返回的事件都在 events 数组中
int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout)
```

## inotify
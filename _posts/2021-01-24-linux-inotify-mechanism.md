---
layout: post
title: linux inotify 机制
author: sleticalboy
date: 2021-01-24 21:08:41 +0800
category: articale
tags: [technology]
---

## 基本描述

inotify 是 Linux 内核提供的文件系统变化的通知机制，可以用来监控文件系统的变化，如文
件的新建、删除、读写等。

## 使用

1、`int inotify_init(void)`

调用该方法创建一个 inotify 对象，返回一个与新的 inotify 事件队列关联的 fd，返
回 -1 表示失败

2、`int inotify_add_watch(int fd, const char *pathname, uint32_t mask)`

调用该方法将一个或多个监听添加到 inotify 对象中，或者修改已存在的监听对象；返
回 -1 表示失败，返回非负数表示成功

`fd` 参数表示 inotify_init() 方法的返回值;
`pathname` 参数表示要监控的文件或目录;
`mask` 参数表示要监控的事件，合法的且已实现的事件如下：
```cpp
/* the following are legal, implemented events that user-space can watch for */
#define IN_ACCESS       0x00000001  /* File was accessed */
#define IN_MODIFY       0x00000002  /* File was modified */
#define IN_ATTRIB       0x00000004  /* Metadata changed */
#define IN_CLOSE_WRITE      0x00000008  /* Writtable file was closed */
#define IN_CLOSE_NOWRITE    0x00000010  /* Unwrittable file closed */
#define IN_OPEN         0x00000020  /* File was opened */
#define IN_MOVED_FROM       0x00000040  /* File was moved from X */
#define IN_MOVED_TO     0x00000080  /* File was moved to Y */
#define IN_CREATE       0x00000100  /* Subfile was created */
#define IN_DELETE       0x00000200  /* Subfile was deleted */
#define IN_DELETE_SELF      0x00000400  /* Self was deleted */
#define IN_MOVE_SELF        0x00000800  /* Self was moved */
```

3、`size_t read(int fd, void *buf, size_t count)`

当监听事件发生时，调用该方法从 inotify 对象中读取监听事件

buf 参数表示 inotify_event 数据结构的数组指针，能够读取的事件数量取决于数组的
长度，该结构定义如下：

```cpp
/*
 * struct inotify_event - structure read from the inotify device for each event
 *
 * When you are watching a directory, you will receive the filename for events
 * such as IN_CREATE, IN_DELETE, IN_OPEN, IN_CLOSE, ..., relative to the wd.
 */
struct inotify_event {
    __s32       wd;      /* 发生事件对应的 fd */
    __u32       mask;    /* 事件类型 */
    __u32       cookie;  /* cookie to synchronize two events */
    __u32       len;     /* name 字段的长度 */
    char        name[0]; /*可变长度，用于存产生事件的文件路径*/
};
```

## 参考资料

[notify机制监控文件系统事件原理及使用](https://www.cnblogs.com/samdyhc/p/9300270.html)

[深入理解Android卷3（张大伟）]()
[Linux 程序员开发手册]()

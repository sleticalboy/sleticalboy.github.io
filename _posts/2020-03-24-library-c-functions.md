---
layout: post
title: Linux C 库函数
author: sleticalboy
date: 2020-03-24 11:07:20
category: linux
tags: [linux]
---

## 字符串

1. `long int strtol(const char *str, char **endptr, int base)`
- string to long -> strtol
- 把参数 str 所指向的字符串根据给定的 base 转换为一个长整数（类型为 long int 型），base 必须介于 2 和 36（包含）之间，或者是特殊值 0

2. `unsigned long int strtoul(const char *str, char **endptr, int base)`
- string to unsigned long -> strtoul
- 把参数 str 所指向的字符串转换为一个无符号长整数（类型为 unsigned long int 型）。

3. `char *strcpy(char *dest, const char *src)`
- string copy -> strcpy
- 把 src 所指向的字符串复制到 dest。

4. `char *strcat(char *dest, const char *src)`
- string concat
- 把 src 所指向的字符串追加到 dest 所指向的字符串的结尾。

5. `size_t strlen(const char *str)`
- string length -> strlen
- 计算字符串 str 的长度，直到空结束字符，但不包括空结束字符'\0'。

## 文件
1. `int fcntl(int fd, int cmd, .../* arg*/)`
- file control
- 操作文件句柄，返回值小于 0 表示操作失败
- cmd
    - F_GETFL get file status flags
    - F_SETFL set file status flags
- arg
    - O_NONBLOCK 非阻塞

2. `select()` & `pselect()`
- `int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds,
 struct timeval *timeout)`
- `int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds,
 struct timeval *timeout, const sigset_t *sigmask)`
- select() 和 pselect() 可以用来监听多个文件描述符是否（ready）可以进行 IO 操作；

3. `int poll(struct poolfd *fds, nfds_t nfds, int timeout)`
- poll 和 ppoll 等待文件描述符上的某个事件

## 内存管理
1. `void *malloc(size_t size)`
- 分配所需的内存空间，并返回一个指向它的指针。

---
layout: post
title: Linux C 库函数
author: sleticalboy
date: 2020-03-24 11:07:20
category: linux
tags: [linux]
---

## 字符串操作

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

## 文件操作

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
- 输入参数
  - fds：可以传递多个结构体，即可检测多个驱动设备所产生的事件，只要有一个产生了请求事件，此方法就能立即返回
  - pollfd 结构体定义：
  ```cpp
  struct pollfd {
      int fd;        /* 文件描述符 */
      short events;  /* 请求的事件类型，监视驱动文件的事件掩码 */
      short revents; /* 驱动文件实际返回的事件 */
  };
  ``` 
  - nfds：检测启动文件的个数
  - timeout：超时时间，单位 ms
- follfd.events 类型
  - POLLIN：有数据可读
  - POLLRDNORM：有普通数据可读，等效 POLLIN
  - POLLPRI：有紧迫数据可读
  - POLLOUT：写数据不会导致阻塞
  - POLLRE：指定的文件描述符发生错误
  - POLLHUP：指定的文件描述符挂起事件
  - POLLNVAL：无效的请求，打不开指定的文件描述符
- 方法返回值
  - 超时：返回 0
  - 失败：返回 -1，并设置 errno 为错误类型
  - 有事件发生：返回 revents 域不为 0 的文件描述符的个数，即事件发生或错误报告
- 示例代码
```cpp
// a demo of poll function
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <poll.h>
int main(int argc, char const *argv[]) {
    int i;
    int ret;
    int fd;
    unsigned char keys_val;
    struct pollfd fds[1];
    fd = open("/dev/buttons", 0);
    if (fd < 0) {
        printf("can not open /dev/buttons\n");
        return -1;
    }
    fds[0].fd = fd;
    fds[0].events = POLLIN;
    while (1) {
        ret = poll(fds, 1, 5000);
        if (ret == 0) {
            printf("poll time out\n");
        } else {
            read(fd, &keys_val, sizeof(keys_val));
            printf("keys value: 0x%x\n");
        }
    }    
    close(fd);
    return 0;
}
```

## 内存管理
1. `void *malloc(size_t size)`
- 分配所需的内存空间，并返回一个指向它的指针。

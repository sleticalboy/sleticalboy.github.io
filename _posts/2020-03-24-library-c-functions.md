---
layout: post
title: library-c-functions
author: sleticalboy
date: 2020-03-24 11:07:20
category: linux
tags: [linux]
---

# C 库函数
- long int strtol(const char *str, char **endptr, int base) 
    - string to long -> strtol
    - 把参数 str 所指向的字符串根据给定的 base 转换为一个长整数（类型为 long int 型），base 必须介于 2 和 36（包含）之间，或者是特殊值 0
- unsigned long int strtoul(const char *str, char **endptr, int base)
    - string to unsigned long -> strtoul
    - 把参数 str 所指向的字符串转换为一个无符号长整数（类型为 unsigned long int 型）。
- char *strcpy(char *dest, const char *src) 
    - string copy -> strcpy
    - 把 src 所指向的字符串复制到 dest。
- char *strcat(char *dest, const char *src) 
    - string concat
    - 把 src 所指向的字符串追加到 dest 所指向的字符串的结尾。
- size_t strlen(const char *str) 
    - string length -> strlen
    - 计算字符串 str 的长度，直到空结束字符，但不包括空结束字符'\0'。
- void *malloc(size_t size)
    - 分配所需的内存空间，并返回一个指向它的指针。
---
layout: post
title: 应用崩溃
author: sleticalboy
date: 2019-01-20 15:50:20
category: book
tags: [android, book]
---

## 关于崩溃
- 崩溃类型
  - Java 崩溃就是在 Java 代码中，出现了未捕获异常，导致程序异常退出。
  - Native 崩溃一般是因为在 native 层访问了非法地址，又或者地址对齐出现了问题, 又或者发生了程序主动 abort, 从而产生 singal 信号，导致程序异常退出。
- 如何分析 app 崩溃

---
layout: post
title: linux inotify 机制
author: sleticalboy
date: 2021-01-24 21:08:41 +0800
category: articale
tags: [technology]
---

## 基本藐视
inotify 提供了一种监控系统事件的机制，可以用来监控单个的文件以及目录。
当目录被监控时 inotify 会返回该目录及目录下所有文件的事件。
当内核空间发生某种事件之后可以立即通知用户空间，让用户来决定怎么处理

## 

文件系统的通知机制


## 参考资料

[notify机制监控文件系统事件原理及使用](https://www.cnblogs.com/samdyhc/p/9300270.html)

[]()

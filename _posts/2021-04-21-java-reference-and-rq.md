---
layout: post
title: Java 强软弱虚引用及引用队列
author: sleticalboy
date: 2021-04-21 23:15:08 +0800
category: java
tags: [java]
---

## 四种引用类型

### 强引用

- new object/array
- GC 不回收、内存不足时会 OOM

### 软引用

- SoftReference
- 被软引用引用的对象，只有当内存不足时 GC 才会回收
- 内存敏感的高速缓存

### 弱引用

- WeakReference
- 被弱引用引用的对象，只要 GC 就会被回收

### 虚引用

- PhantomReference
- 虚引用不引用任何对象
- 当对象被回收时，可以接收到通知

## 引用队列

- ReferenceQueue
- 引用的对象被回收后，引用会添加到队列中
- 可通过检查队列中是否有该引用来判断对象是否被回收掉
---
layout: post
title: multi-thread-and-concurrence
author: sleticalboy
date: 2020-12-03 08:18:45
category: java
tags: [thread]
---

# 多线程与并发（Android）

## 线程的基本概念

### 进程
> 资源分配和调度的最基本单位；一个程序加载到内存中，OS 分配给这个程序一些资源（内存）和一个序列号（pid）；程序是指令、数据及其组织形式的描述，进程是程序的实体。

### 线程
> 是 OS 能够进行运算调度的基本单元；

#### 启动的方式
1. `new Thread().start()` 重写 run 方法；
2. `new Thread(Runnable).start()` 传入一个 Runnable 对象；
3. 使用线程池或者`FutureTask+Callable`

#### 方法
1. `Thread.sleep(time)`: 当前线程暂停一段时间让给其他线程去执行，睡眠到一定时间就自动复活；
2. `Thread.yield()`：当前线程正在执行的时候停止下来进入等待队列，让出 CPU 的使用权让其他线程去执行；
3. `Thread.join()`：当前线程加入调用 join 方法的线程且当前线程等待直到调用的线程执行完了自己再执行
4. ```java
   {
   Thread t1 = new Thread() {
       @Override
       public void run() {
           // do stuff
       }
   }.start();
   Thread t2 = new Thread() {
       @Override
       public void run() {
           // 调用 join 之后，t2 等待直到 t1 执行完毕
           t1.join();
           // do stuff
       }
   }.start();
   }
   ```
   
#### 线程的六种状态
- 6 种 状态
  1. NEW：Thread t = new Thread(); 尚未调用 start 方法
  2. RUNNABLE：t.start();
  3. BLOCKED：wait()/join()/LockSupport.part()
  4. WAITING：
  5. TIME_WAITING：
  6. TERMINATED：执行结束
- 以上 6 种状态，哪些是由 JVM 管理的？哪些是由 OS 管理的？
  - 都是由 JVM 管理的，因为 JVM 管理的时候也要通过 OS，所以这两者是分不开的，JVM 就是跑在 OS 上的一个普通程序
- 线程什么状态时会被挂起？挂起是否也是一个状态？
  - running 时，在一个 CPU 上会跑很多个线程，CPU 时间片轮转机制，一个线程执行时其他线程都是挂起状态，操作系统控制

## volatile 与 CAS

### volatile

### CAS：compare and swap/exchange

## Atomic 类和线程同步新机制

## LockSupport、淘宝面试题与源码阅读方法讨论

## AQS 源码阅读与强软弱虚四种引用以及 ThreadLocal 原理

### AQS：AbstractQueuedSynchronizer

### Java 中的四种引用类型

### ThreadLocal 原理与源码分析

## 并发容器

## 线程池及源码分析

### 线程池 worker 任务单元

### 核心线程执行逻辑

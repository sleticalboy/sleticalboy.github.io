---
layout: post
title: Java/Android 多线程与并发
author: sleticalboy
date: 2020-11-26 09:41:22
category: java
tags: [java]
---

## 基本概念

### 进程
资源分配和调度的最基本单位；一个程序加载到内存中，OS 分配给这个程序一些资源（内存）和一个序列号（pid）；程序是指令、数据及其组织形式的描述，进程是程序的实体。

### 线程
是 OS 能够进行运算调度的基本单元；

### JMM

JMM(Java Memory Model) 规定：
1、所有变量都存储在主内存中；
2、每个线程都有自己的工作内存，用来保存该线程用到的主内存中的变量的拷贝副本；
3、线程对变量的所有操作都必须在工作内存中进行，不能直接操作主内存；
4、不同的线程无法直接访问彼此的工作内存，线程间变量的传递需要自己的工作内存和主内存之间进行数据同步
总结：JMM 是一种规范，目的是解决由于多线程通过共享内存进行通信时，存在本地的内存数据不一致、编译器会对代码指令重排序、
处理器会对代码乱序执行等带来的问题

主内存：类比计算机内存模型的主存
JMM: 作用于工作内存和主内存之间数据同步过程
工作内存：类比计算机模型的缓存

计算机硬件内存架构：
CPU、高速缓存、缓存一致性协议、主内存

JVM: 栈、堆、方法区

### 原子操作

原子操作：不会被线程调度机制打断的操作（从操作开始到操作结束，不会被人打扰）[atomic operation]

### 多线程并发

多线程并发：各个线程轮流获得 CPU 使用权，分别执行各自的任务

### 线程调度

线程调度：指操作系统按照特定机制为多个线程分配 CPU 使用权
分时调度：让所有的线程轮流获得 CPU 的使用权，并且平均分配每个线程占用 CPU 的时间片
抢占式调度：优先让优先级高的线程使用 CPU，若优先级相同则随机分配（JVM 采用此调度模型）


### 原子性、可见性和有序性

原子性: synchronized
   1. monitorenter
   2. monitorexit
可见性: volatile
  1. 被其修饰的变量被修改后要立即同步到主内存中、每次使用都从主内存中刷新、保证多线程操作时变量的可见性;
有序性: synchronized & volatile
  1. volatile 禁止指令重排;
  2. synchronized 保证同一时刻只允许一条线程操作

### 锁

- 锁消除、锁粗化

```java
// 锁消除
private void lockWipe() {
  final Object lock = new Object();
  synchronized (lock) {
    doSomething(lock);
  }
  // 消除之后
  doSomething(lock);
}

// 锁粗化
private void lockCoarse() {
  for (int i = 0; i < 100; i++) {
    // 锁细化
    synchronized (this) {
      doSomething(i);
    }
  }
  // javac 编译后: 锁粗化（扩大锁的范围）
  synchronized (this) {
    for (int i = 0; i < 100; i++) {
      doSomething(i);
    }
  }
}

private void doSomething(Object obj) {
  // code block
}
```

- 偏向锁、轻量锁、重量锁

```java
public void foo() {
  // monitorenter
  synchronized (this) {
    // code block
    // 偏向锁 > 轻量锁 > 重量锁
  }
  // monitorexit
}
```

- 适应性自旋锁
- 可重入锁原理：一个线程访问会引起计数器 +1，释放时计数器会 -1，计数器为 0 时其他线程可访问

```java
// flags: ACC_PUBLIC, ACC_SYNCHRONIZED
public synchronized void sync() {
  // do stuff
}
```

- 乐观锁、悲观锁

乐观锁：认为读取的过程中大概率不会有写入操作（效率高于悲观锁）
悲观锁：认为读取的过程中拒绝写入，写入操作必须在读取操作之后

### 死锁

死锁产生的必要条件：
互斥：一个资源每次只能被一个线程使用（独木桥每次只能通过一人）
不可剥夺：线程已经获得资源，在未使用完之前不能强行剥夺（ben 正在过桥，其他人不能强制让 ben 返回）
请求与保持：一个线程因请求资源而阻塞时，对已获得的资源不释放（ben 和 tom 同时过桥且两人互不谦让）
循环等待：两个及以上的线程形成一种首尾相接的循环等待资源局面（tom 不返回则 ben 不能过桥；反之则 tom 无法过桥）

解决死锁问题：只要打破上面 4 个条件之一即可
按照一定的顺序获取锁
获取锁时，添加尝试超时机制
思死锁检测
避免嵌套锁



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

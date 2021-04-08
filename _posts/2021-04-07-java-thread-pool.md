---
layout: post
title: Java 线程池
author: sleticalboy
date: 2021-04-07 22:43:32 +0800
category: java
tags: [java]
---

## 核心参数解析

### 核心线程

### 非核心线程及存活时间

### 任务队列

### 线程工厂

### 拒绝策略

默认实现有四种:

- CallerRunsPolicy

- AbortPolicy

- DiscardPolicy

- DiscardOldestPolicy

## 任务提交

```java
@Override public void execute(Runnable command) {
    // 不可提交空任务
    if (command == null) throw new NullPointerException();
    int c = ctl.get();
    // 工作线程数目小于核心线程数，则初始化核心线程
    if (workerCountOf(c) < corePoolSize) {
        // 添加核心工作线程，Worker#thread
        if (addWorker(command/*firstTask*/, true/*core*/)) return;
        c = ctl.get();
    }
    // 工作线程大于核心线程，则尝试向队列中提交任务
    if (isRunning(c) && workQueue.offer(command)) {
        int recheck = ctl.get();
        if (!isRunning(recheck) && remove(command)) {
            reject(command);
        } else if (workerCountOf(recheck) == 0) {
            // 添加非核心工作线程
            addWorker(null, false);
        }
    }
    // 尝试添加非核心线程，若添加失败则执行拒绝策略
    else if (!addWorker(command, false)) {
        reject(command);
    }
}
```

## 任务执行

Worker#run() -> runWorker()

```java
final void runWorker(Worker w) {
    Thread wt = Thread.currentThread();
    Runnable task = w.firstTask;
    w.firstTask = null;
    w.unlock(); // allow interrupts
    boolean completedAbruptly = true;
    try {
        // getTask() 为阻塞方法，任务队列无任务时会阻塞，从而达到核心线程保活
        while (task != null || (task = getTask()) != null) {
            w.lock();
            // If pool is stopping, ensure thread is interrupted;
            // if not, ensure thread is not interrupted.  This
            // requires a recheck in second case to deal with
            // shutdownNow race while clearing interrupt
            if ((runStateAtLeast(ctl.get(), STOP) ||
                    (Thread.interrupted() && runStateAtLeast(ctl.get(), STOP))) &&
                    !wt.isInterrupted())
                wt.interrupt();
            try {
                beforeExecute(wt, task);
                Throwable thrown = null;
                try {
                    task.run(); // 任务执行
                } finally {
                    afterExecute(task, thrown);
                }
            } finally {
                task = null;
                w.completedTasks++;
                w.unlock();
            }
        }
        completedAbruptly = false;
    } finally {
        processWorkerExit(w, completedAbruptly);
    }
}
```

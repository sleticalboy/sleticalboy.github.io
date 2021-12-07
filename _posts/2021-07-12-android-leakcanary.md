---
layout: post
title: 内存泄露检测框架 Leakcanary
author: sleticalboy
date: 2021-07-12 12:51:33 +0800
category: android
tags: [technology]
---

## 使用

直接引入即可，会自动进行初始化

### 初始化原理: AppWatcherInstaller

```xml
< provider android:name="leakcanary.internal.AppWatcherInstaller$MainProcess"/>
```

利用 ContentProvider#onCreate() 方法会先于 Application#onCreate() 方法，具体原因
涉及 app 启动流程，此处不过多讨论。

## 原理分析

### `AppWatcher.manualInstall()`

默认安装 4 个 watcher：

1、ActivityWatcher

注册 ActivityLifecycleCallbacks 监听 onDestroy() 加入监听队列

2、FragmentAndViewModelWatcher

注册 FragmentLifecycleCallbacks 监听 onViewDestroyed() 加入监听队列

3、RootViewWatcher

注册 OnAttachStateChangeListener 监听 onViewDetachedFromWindow() 加入监听队列

通过反射 WindowManagerImpl/Global mViews 移除来加入监听队列

4、ServiceWatcher

hook ActivityThread#mH#mCallback 和 AMS#serviceDoneExecuting() 加入监听队列

反射注入、动态代理

### 核心接口 `ReachabilityWatcher`

即将被回收的类会被放入到引用队列中，可以监听队列中是否有被监听的对象判断对象是否被回收，
如果队列中存在该对象则说明被回收了，若不存在则说明未被回收，可能存在泄露；进而通过
haha 库找到泄露路径并通知到用户

1、实现子类：ObjectWatcher#expectWeaklyReachable(Object obj, String desc)

1.1、生成 uuid 作为 key，通过 obj/desc/key/time 生成 KeyedWeakReference 作为 value，
即被监听的对象；

1.2、将 key 和 value 放入 watchedObjects (LinkedHashMap<String, KeyedWeakReference>)

1.3、在主线程消息队列插入消息检查对象是否被回收

1.4、OnObjectRetainedListener#onObjectRetained()
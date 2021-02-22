---
layout: post
title: Service 源码分析
author: sleticalboy
date: 2020-12-01 02:31:07
category: android
tags: [android, framework]
---

## 开启服务

### startService()

```java
// Context.startService() -> ContextImpl.startServiceCommon() -[IPC 到 SystemServer 进程]-> 
// AMS.startService() -> ActiveServices.startServiceLocked() -> 
// [retreiveServiceLocked(): ServiceLookupResult ->] AMS.startServiceInnerLocked() -> 
// bringUpServiceLocked(): String
// case1已经启动： -> sendServiceArgsLocked() -> ActivityThread.ApplicationThread.shcheduleServiceArgs() ->
//      ActivityThread.handleServiceArgs() -> Service.onStartCommand()
// case2未启动： -> ActivityThread.ApplicationThread.scheduleCreateService() -> 
//      ActivityThread.handleCreateService() -> Service.onCreate()
```

### stopService()

```java
// Context.stopService() -> ContextImpl.stopServiceCommon() -[IPC 到 SystemServer 进程]-> 
// AMS.stopService() -> ActiveServices.stopServiceLocked() ->
// ActivityThread.ApplicationThread.scheduleStopService() -> ActivityThread.handleStopService() ->
// Service.onDestroy()
```

### 开启服务小结

- 生命周期
  - `onCreate() ` -> `onStartCommand()`-> `onDestroy()`

## 绑定服务

### bindService()

```java
// Context.bindService() ->
// LoadedApk.getServiceDispatcher(): IServiceConnection -> LoadedApk.ServiceDispatcher.getIServiceConnection()
// ServiceDispatcher.InnerConnection
// ContextImpl.bindServiceCommon() -[IPC 到 SystemServer]> AMS.bindService() ->
// ActiveServices.bindServiceLocked() -> retreiveServiceLocked() -> bringUpServiceLocked() -> 
// case1 Service 已经创建：sendServiceArgsLocked() -> ActivityThread.ApplicationThread.scheduleServiceArgs() -> 
// case2 Service 未创建：realStartServiceLocked() -> ActivityThread.ApplicationThread.scheduleCreateService() ->
//      ActivityThread.handleCreateService() -> Service.onCreate()
// requestServiceBindingLocked() -> ActivityThread.ApplicationThread.scheduleBindService() ->
// ActivityThread.handleBindService() -> Service.onBind()
```

### unbindService()

```java
// Context.unbindService() -> ContextImpl.unbindService() -[IPC 到 SystemServer]->
// AMS.unbindService() -> ActiveServices.unbindServiceLocked() -> removeConnectionLocked() ->
// ActivityThread.ApplicationThread.scheduleUnbindService() -> ActivityThread.handleUnbindService() -> 
// Service.onUnbind() ->
// ActiveServices.bringDownServiceIfNeededLocked() -> bringDownServiceLocked() -...-> scheduleStopService() -> 
// ActivityThread.handleStopService() -> Service.onDestroy()
```

### 绑定服务小结

- 主要提供 c/s 接口，允许组件与 Service 进行交互或者跨进程通讯
- bind 服务的 3 种方式
  - 扩展 Binder : 同一个进程内提供服务
  - 使用 Messenger : IPC，单线程
  - 使用 aidl : IPC，多线程

## service ANR

### 前台 service ANR

### 后台 service ANR

## 总结


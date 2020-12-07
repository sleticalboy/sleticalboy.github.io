---
layout: post
title: at-provider-lifecycle
author: sleticalboy
date: 2020-12-02 02:19:11
category: android
tags: [framework, components]
---

# ActivityThread 中 Provider 生命周期

## bindApplication()

- `bindApplication()` -> `mH.sendMessage(H.BIND_APPLICATION)` -> `handleBindApplication()`

## handleBindApplication()

### 设置 AsyncTask 执行任务的线程池

```java
// If the app is Honeycomb MR1 or earlier, switch its AsyncTask
// implementation to use the pool executor.  Normally, we use the
// serialized executor as the default. This has to happen in the
// main thread so the main looper is set right.
if (data.appInfo.targetSdkVersion <= android.os.Build.VERSION_CODES.HONEYCOMB_MR1) {
    // android 3.1 之前并行执行
    AsyncTask.setDefaultExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
}
// android 3.1 之后串行执行
```

### 检查 LoadedApk

- `data.info = getPackageInfoNoCheck();` -> `getPackageInfo()`
- `getPackageInfo`
  1. 安全性检查
  2. 从缓存中查找，如果找到并且资源是最新的则直接返回
  3. 否则构造一个新的 LoadedApk 放入缓存并返回

### 检测 debug 模式

### 设置 http 代理

### 检测 InstrumentationInfo ii

```java
// Instrumentation info affects the class loader, so load it before 
// setting up the app context.
final InstrumentationInfo ii;
```

### 检测 http 明文

```java
// Install the Network Security Config Provider. This must happen before the application
// code is loaded to prevent issues with instances of TLS objects being created before
// the provider is installed.
Trace.traceBegin(Trace.TRACE_TAG_ACTIVITY_MANAGER, "NetworkSecurityConfigProvider.install");
NetworkSecurityConfigProvider.install(appContext);
Trace.traceEnd(Trace.TRACE_TAG_ACTIVITY_MANAGER);
```

### 创建 Instrumentation

#### ii 不为空

#### ii 为空

### 创建 Application

### installContentProviders()

#### installProvider()

- `attachInfo()` -> `ContentProvider#onCreate()`

### callApplicationOnCreate()

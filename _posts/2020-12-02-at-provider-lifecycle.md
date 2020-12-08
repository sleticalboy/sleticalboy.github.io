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

1. 修改 dubug 端口：`Debug.changeDebugPort(8100);`

2. 显示 debug 弹窗：

   ```java
   // 等待 dubug
   if (data.debugMode == ApplicationThreadConstants.DEBUG_WAIT) {
       IActivityManager mgr = ActivityManager.getService();
       try {
           mgr.showWaitingForDebugger(mAppThread, true/*显示*/);
           // AMS#UiHandler.handleMessage() [WAIT_FOR_DEBUGGER_UI_MSG]
           // new AppWaitingForDebuggerDialog(ActivityManagerService.this, mUiContext, app).show()
       } catch (RemoteException ex) { }
       // 等待 1300ms
       Debug.waitForDebugger();
       try {
           mgr.showWaitingForDebugger(mAppThread, false/*隐藏*/);
       } catch (RemoteException ex) { }
   } else { }
   ```

### 设置 http 代理

```java
final IBinder b = ServiceManager.getService(Context.CONNECTIVITY_SERVICE);
if (b != null) {
    // In pre-boot mode (doing initial launch to collect password), not all system is up.
    // This includes the connectivity service, so don't crash if we can't get it.
    final IConnectivityManager service = IConnectivityManager.Stub.asInterface(b);
    try {
        final ProxyInfo proxyInfo = service.getProxyForNetwork(null);
        Proxy.setHttpProxySystemProperty(proxyInfo);
    } catch (RemoteException e) { }
}
```

### 检测 InstrumentationInfo ii

```java
// Instrumentation info affects the class loader, so load it before setting up the app context.
// ii 会影响 ClassLoader，因此要先加载然后设置 app context
final InstrumentationInfo ii;
if (data.instrumentationName != null) {
    // 一般测试时才会设置 instrumentation
    try {
        ii = new ApplicationPackageManager(null, getPackageManager())
            .getInstrumentationInfo(data.instrumentationName, 0);
    } catch (PackageManager.NameNotFoundException e) { }

    mInstrumentationPackageName = ii.packageName;
    mInstrumentationAppDir = ii.sourceDir;
    mInstrumentationSplitAppDirs = ii.splitSourceDirs;
    mInstrumentationLibDir = getInstrumentationLibrary(data.appInfo, ii);
    mInstrumentedAppDir = data.info.getAppDir();
    mInstrumentedSplitAppDirs = data.info.getSplitAppDirs();
    mInstrumentedLibDir = data.info.getLibDir();
} else {
    // 通常情况下，ii 都是 null
    ii = null;
}
```

### 检测网络安全策略配置

```java
// Install the Network Security Config Provider. This must happen before the application code is loaded 
// to prevent issues with instances of TLS objects being created before the provider is installed.
NetworkSecurityConfigProvider.install(appContext);
// 读取 AndroidManifest.xml 文件中配置的 networkSecurityConfig 文件
// 如果配置：source = new XmlConfigSource(mContext, configResource, mApplicationInfo);
// 如果未配置：source = new DefaultConfigSource(usesCleartextTraffic, mApplicationInfo);
```

### 创建 Instrumentation

#### ii 为空时直接用 new 关键字实例化

```java
mInstrumentation = new Instrumentation();
mInstrumentation.basicInit(this); // 只注入 ActivityThread 实例对象
```

#### ii 不为空时通过类加载器实例化

```java
try {
    final ClassLoader cl = instrContext.getClassLoader();
    mInstrumentation = (Instrumentation)cl.loadClass(data.instrumentationName.getClassName()).newInstance();
} catch (Exception e) { }

final ComponentName component = new ComponentName(ii.packageName, ii.name);
mInstrumentation.init(this, instrContext, appContext, component, data.instrumentationWatcher,
                      data.instrumentationUiAutomationConnection);
// 除了注入 ActivityThread 实例对象之后，还有余下的参数
```

### 创建 Application

```java
try {
    // If the app is being launched for full backup or restore, bring it up in
    // a restricted environment with the base application class.
    // 1. 实例化 application 对象
    app = data.info.makeApplication(data.restrictedBackupMode, null);
    mInitialApplication = app;
} finally { }
```

### installContentProviders()

```java
// don't bring up providers in restricted mode; they may depend on the
// app's custom Application class
if (!data.restrictedBackupMode) {
    if (!ArrayUtils.isEmpty(data.providers)) {
        // 2. 安装 ContentProvider，此时 Application#onCreate() 方法尚未调用
        installContentProviders(app, data.providers);
        // 2.1. installProvider()
        //   2.1.1. AppComponentFactory#instantiateProvider()
        //   2.1.2. provider.attachInfo() -> provider.onCreate()
        // 2.2 -> AMS#publishContentProviders()
    }
}
```

### callApplicationOnCreate()

```java
try {
    // 3. 调用 Application#onCreate() 方法
    mInstrumentation.callApplicationOnCreate(app);
    // app.onCreate()
} catch (Exception e) { }
```

## 总结

1. app 启动时会首先安装 ContentProvider，此时界面尚未显示，因此我们可以在 ContentProvider#onCreate() 方法中做一些初始化工作；
2. ContentProvider 是通过类加载器初始化的；
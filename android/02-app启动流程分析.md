# App 启动流程源码分析(二)
> 第二阶段： 从 ActivityThread 的 main() 方法执行到页面显示

## 开篇之前，我们不妨先思考以下几个问题
- Application 是如何创建的？
- Application 的 attachBaseContext() 为什么会在 onCreate() 方法之前调用？
- Activity 是如何被创建的？
- Activity 的声明周期方法是如何被调用的？
- PhoneWindow 是何时被创建的？
- ContextImpl 是何时被创建的？
- ViewRootImpl 是何时被创建的？

## 先来一张价值 5 千万的时序图
![uml](assets/app启动流程.svg)

## ActivityThread
- #main()
```java
public static void main(String[] args) {
    // ... 省略部分代码
    // 设置进程名
    Process.setArgV0("<pre-initialized>");
    // 准备主线程的 Looper, 也就是我们常说的 Looper.getMainLooper()
    Looper.prepareMainLooper();

    // 实例化主线程，在构造器里会初始化 ResourceManager
    ActivityThread thread = new ActivityThread();
    // 执行绑定操作
    thread.attach(false /*system*/);

    // 初始化主线程 handler
    if (sMainThreadHandler == null) {
        sMainThreadHandler = thread.getHandler();
    }
    if (false) {
        // 设置主线程 Looper 的 Printer 可以用来监控 Handler.dispatchMessage() 方法执行
        Looper.myLooper().setMessageLogging(new LogPrinter(Log.DEBUG, "ActivityThread"));
    }
    // 开启主线程消息循环
    Looper.loop();
    throw new RuntimeException("Main thread loop unexpectedly exited");
}
```
- #attach()
```java
private void attach(boolean system) {
    sCurrentActivityThread = this;
    mSystemThread = system;
    if (!system) {
        // 对 ViewRootImpl 进行一些配置
        ViewRootImpl.addFirstDrawHandler(new Runnable() {
            @Override
            public void run() {
                ensureJitEnabled();
            }
        });
        android.ddm.DdmHandleAppName.setAppName("<pre-initialized>", UserHandle.myUserId());
        RuntimeInit.setApplicationObject(mAppThread.asBinder());
        final IActivityManager mgr = ActivityManager.getService();
        try {
            // AMS 绑定当前 thread，用于进程间通信，mAppThread 是 ApplicationThread 的一个实例
            // 具体实现里面有对 Activity 的各种操作： create//start/resume...
            mgr.attachApplication(mAppThread);
        } catch (RemoteException ex) {
            throw ex.rethrowFromSystemServer();
        }
        // Watch for getting close to heap limit.
        BinderInternal.addGcWatcher(new Runnable() {
            @Override public void run() {
                if (!mSomeActivitiesChanged) {
                    return;
                }
                Runtime runtime = Runtime.getRuntime();
                long dalvikMax = runtime.maxMemory();
                long dalvikUsed = runtime.totalMemory() - runtime.freeMemory();
                // 当前 app 的使用内存如果超出分配内存的 75% 会对部分 Activity 进行释放操作
                if (dalvikUsed > ((3*dalvikMax)/4)) {
                    mSomeActivitiesChanged = false;
                    try {
                        // 当内存过低时会释放一部分 activity
                        mgr.releaseSomeActivities(mAppThread);
                    } catch (RemoteException e) {
                        throw e.rethrowFromSystemServer();
                    }
                }
            }
        });
    } else {
        // ... 目前我们只关系 system = false 的 case
    }
    // 当全局配置发生改变时会先回调到这里来，再由 handler 发消息通知 Activity
    // 比如系统语言、时区改变，横竖屏切换等
    ViewRootImpl.ConfigChangedCallback configChangedCallback
            = (Configuration globalConfig) -> {
        synchronized (mResourcesManager) {
            // We need to apply this change to the resources immediately, because upon returning
            // the view hierarchy will be informed about it.
            if (mResourcesManager.applyConfigurationToResourcesLocked(globalConfig, null /* compat */)) {
                updateLocaleListFromAppContext(mInitialApplication.getApplicationContext(),
                        mResourcesManager.getConfiguration().getLocales());
                // This actually changed the resources! Tell everyone about it.
                if (mPendingConfiguration == null || mPendingConfiguration.isOtherSeqNewer(globalConfig)) {
                    mPendingConfiguration = globalConfig;
                    // 发消息通知 activity 配置发生变化了，activity 收到消息后会再通过 FragmentManager 
                    // 通知 Fragment, 再由 Fragment 向子 Fragment 传递
                    sendMessage(H.CONFIGURATION_CHANGED, globalConfig);
                }
            }
        }
    };
    ViewRootImpl.addConfigCallback(configChangedCallback);
}
```
- #getPackageInfoNoCheck()

## AMS
- #attachApplication(IApplicationThread thread) -> #attachApplicationLocked(IApplicationThread thread, int pid)
- thread.bindApplication()
- mStackSupervisor.attachApplicationLocked(app)

## ActivityThread.ApplicationThread
- #bindApplication() -> mH.sendMessage(H.BIND_APPLICATION, data)
- #scheduleLaunchActivity() -> mH.sendMessage(H.LAUNCH_ACTIVITY, r)
- #handleLaunchActivity()
  - #performLaunchActivity()
    - createBaseContextForActivity(ActivityClientRecord r)
    - mInstrumentation.newActivity(cl, component.getClassName(), r.intent)
    - activity.attach()
      - mFragments.attachHost()
      - mWindow = new PhoneWindow()
    - mInstrumentation.callActivityOnCreate(activity) -> activity.onCreate()
    - activity.performStart() -> mInstrumentation.callActivityOnStart(this) -> activity.onStart()
  - #handleResumeActivity()
    - performResumeActivity()
    - activity.getWindowManager().addView(decorView, lp)
      - WindowManagerImpl.addView() -> WindowManagerGlobal.addView() -> 初始化 ViewRootImpl
  - #performResumeActivity()
    - activity.onStateNotSaved()
    - activity.mFragments.noteStateNotSaved()
    - activity.performResume() -> mInstrumentation.callActivityOnResume(this) -> activity.onResume()

## ActivityThread.H `/*extends Handler {}*/`
- #BIND_APPLICATION
  - ActivityThread#handleBindApplication(AppBindData data)
    - ActivityThread#getPackageInfoNoCheck(data.appInfo, data.compatInfo) 返回 LoadedApk 对象
    - ContextImpl.createAppContext() 创建 ContextImpl 对象，getService() 等操作就是托管给这个类处理
    - mInstrumentation = new Instrumentation()
    - data.info.makeApplication(data.restrictedBackupMode, null /\*instrumentation\*/); 实例化 Application
    - mInstrumentation.callApplicationOnCreate(app) -> app.onCreate: 在 app.attachBaseContext() 之后执行
    - 预加载一些字体等资源文件
- #LAUNCH_ACTIVITY
  - ActivityThread#handleLaunchActivity(ActivityClientRecord r, Intent customIntent, String reason)
  - ActivityThread#performLaunchActivity()
  - ActivityThread#handleResumeActivity()

## LoadedApk
- #makeApplication()
  - mActivityThread.mInstrumentation.newApplication(cl, appClass, appContext);

## ContextImpl
- #createAppContext()

## Instrumentation
- #newApplication() 通过反射生成 application
- app.attach() -> app.attachBaseContext()
- newActivity(ClassLoader cl, String className, Intent intent) 通过反射生成 activity
- callActivityOnCreate(Activity activity, ...)
  - activity.performCreate() -> activity.onCreate()
- callActivityOnResume(Activity activity)
  - activity.onResume()


> 至此，前两个问题已经解决了

## ActivityStackSupervisor
- #attachApplicationLocked(ProcessRecord app)
- #realStartActivityLocked() -> app.thread.scheduleLaunchActivity()

## PhoneWindow

## Activity

## 总结

## 结语

## 参考资料
- [Android 7.0 startActivity()源码解析以及对几个问题的思考][2]
- [画图工具][4]
- [ViewRootImpl的独白，我不是一个View(布局篇)][3]
- [starUML 破解][1]

[1]: https://www.52pojie.cn/thread-796355-1-1.html
[2]: https://dev-xu.cn/posts/b3e682b8.html
[3]: https://blog.csdn.net/stven_king/article/details/78775166
[4]: https://github.com/echoma/text_sequence_diagram
# ActivityThread 中 Activity 生命周期
> handleLaunchActivity() -> handleStartActivity() -> handleResumeActivity() -></br>
  handlePauseActivity() -> handleStopActivity() -> handleDestroyActivity()</br>
  performRestartActivity()

## handleLaunchActivity
> (ActivityClientRecord r, PendingTransactionActions pendingActions, Intent customIntent)

### 初始化 WindowManager : WindowManagerGlobal.initialize();
- 单例模式： `WindowManagerGlobal#getWindowManagerService()`
- `sWindowManagerService = IWindowManager.Stub.asInterface(ServiceManager.getService("window"));`

### 执行 performLaunchActivity() 返回 Activity 对象
> (ActivityClientRecord r, Intent customIntent)

#### 通过 getPackageInfo() 方法检查 r.packageInfo (LoadedApk)
1. 安全性检查
2. 从缓存中查找，如果找到并且资源是最新的则直接返回
3. 否则构造一个新的 LoadedApk 放入缓存并返回

#### 实例化 Activity 对象（反射）
1. 通过调用 `Instrumentation#newActivity()` 构造 Activity
```java
public Activity newActivity(ClassLoader cl, String className, Intent intent)
  throws InstantiationException, IllegalAccessException, ClassNotFoundException {
  return (Activity)cl.loadClass(className).newInstance();
}
```

#### 检查并实例化 Application
- `r.packageInfo.makeApplication(false, mInstrumentation)`
  1. 检查是否已实例化；
  2. 检查是否是自定义 application；
  3. `mInstrumentation.newApplication()`;
  4. 添加到缓存： `mActivityThread.mAllApplications.add(app)`;
  5. 调用 `onCreate()` 方法：`mInstrumentation.callApplicationOnCreate(app)`；
  6. Rewrite the R 'constants' for all library apks

#### 执行 Activity#attach()
1. `attachBaseContext()`;
2. 实例化 Activity 的 Window：`mWindow = new PhoneWindow()`；
3. 设置 WindowCallback：`mWindow.setCallback(this/*Activity*/)`；
4. 设置 LayoutFactory：`mWindow.getLayoutInflater().setPriviateFactory(this/*Activity*/)`；
5. 定义 `mUiThread = Thread.currentThread()` 即主线程；

#### 给 Activity 设置主题
```java
int theme = r.activityInfo.getThemeResource();
if (theme != 0) {
  activity.setTheme();
}
```

#### 执行 Activity#onCreate()
- 通过 `mInstrumentation.callActivityOnCreate()` 调用 `Activity#performCreate()`，最终调用 `Activity.onCreate()`
- onCreate()
  1. android O 横屏操作检测；
  2. Fragment 恢复状态；
  3. Fragment 分发 create 方法：`mFragments.dispatchCreate()`；
  4. 执行生命周期回调方法：`getApplication().dispatchActivityCreated()`；


#### 将 Activity 放入 mActivities 缓存
```java
mActivities.put(r.token, r);
```

## handleStartActivity
> (ActivityClientRecord r, PendingTransactionActions pendingActions)

### 执行 Activity#onStart()
### 恢复 Activity 状态
### 调用 postOnCreate()

## handleResumeActivity
> (IBinder token, boolean finalStateRequest, boolean isForward, String reason)

### 执行 performResumeActivity() 返回 ActivityClientRecord 对象
> (IBinder token, boolean finalStateRequest, String reason)

#### 从缓存 mActivityes 获取 Activity
#### 检查是否已经是 ON_RESUME 状态
#### 检查 onNewIntent()
#### 检查 onActivityResule()
#### 执行 Activity#onResume()

### 显示 Activity 窗口

## handlePauseActivity
> (IBinder token, boolean finished, boolean userLeaving, int configChanges,</br>
  PendingTransactionActions pendingActions, String reason)

### performUserLeaving()

### performPauseActivity()
> (ActivityClientRecord r, boolean finished, String reason, PendingTransactionActions pendingActions)

#### 保存 Activity 状态
#### performPauseActivityIfNeeded()
> (ActivityClientRecord r, String reason)

##### 执行 Activity#onPause()

## handleStopActivity
> (IBinder token, boolean show, int configChanges,</br>
  PendingTransactionActions pendingActions, boolean finalStateRequest, String reason)

### 从缓存 mActivityes 获取 Activity
### performStopActivityInner
> (ActivityClientRecord r, StopInfo info, boolean keepShown,</br>
  boolean saveState, boolean finalStateRequest, String reason)

### 检查是否需要执行 stop
### performPauseActivityIfNeeded
> (ActivityClientRecord r, String reason)

#### 检查是否已调用 onPause 

### callActivityOnStop
> (ActivityClientRecord r, boolean saveState, String reason)

#### 保存 Activity 状态
#### 执行 Activity#performStop()

## handleDestroyActivity
> (IBinder token, boolean finishing, int configChanges,</br>
  boolean getNonConfigInstance, String reason)

### performDestroyActivity
> (IBinder token, boolean finishing, int configChanges,</br>
  boolean getNonConfigInstance, String reason)

#### performPauseActivityIfNeeded
- 检查是否已执行 onPause 方法

#### 检查是否已执行 onStop 方法
#### 执行 Activity#onDestroy()
#### 从缓存 mActivities 中移除

### 从 WindowManager 中移除当前 Activity 的 Window
### 最终的清理工作
### 清除任务栈

## performRestartActivity
> (IBinder token, boolean start)

### 执行 Activity#onRestart()
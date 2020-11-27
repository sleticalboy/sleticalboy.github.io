# ActivityThread 中 Activity 生命周期
> handleLaunchActivity() -> handleStartActivity() -> handleResumeActivity() -></br>
  handlePauseActivity() -> handleStopActivity() -> handleDestroyActivity()</br>
  performRestartActivity()

## handleLaunchActivity
> (ActivityClientRecord r, PendingTransactionActions pendingActions, Intent customIntent)

### 初始化 WindowManager : WindowManagerGlobal.initialize();
### 执行 performLaunchActivity() 返回 Activity 对象
> (ActivityClientRecord r, Intent customIntent)

#### 通过 getPackageInfo() 方法检查 r.packageInfo (LoadedApk)
#### 实例化 Activity 对象（反射）
#### 检查并实例化 Application
#### 执行 Activity#attach()
#### 执行 Activity#onCreate()
#### 将 Activity 放入 mActivities 缓存

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


## handleStopActivity

## handleDestroyActivity

## performRestartActivity
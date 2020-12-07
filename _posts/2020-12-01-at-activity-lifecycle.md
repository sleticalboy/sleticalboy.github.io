---
layout: post
title: at-activity-lifecycle
author: sleticalboy
date: 2020-12-01 02:31:07
category: android
tags: [framework, components]
---

# ActivityThread 中 Activity 生命周期
> handleLaunchActivity() -> handleStartActivity() -> handleResumeActivity() -></br>
  handlePauseActivity() -> handleStopActivity() -> handleDestroyActivity()</br>
  performRestartActivity()

## handleLaunchActivity
> (ActivityClientRecord r, PendingTransactionActions pendingActions, Intent customIntent)

### 初始化 WindowManager
- 通过单例模式来进行初始化： ` WindowManagerGlobal.initialize()`
```java
// frameworks/base/core/java/android/app/ActivityThread.java
WindowManagerGlobal.initialize();
// frameworks/base/core/java/android/view/WindowManagerGlobal.java
public static void initialize() {
    getWindowManagerService();
}
public static IWindowManager getWindowManagerService() {
    synchronized (WindowManagerGlobal.class) {
        if (sWindowManagerService == null) {
            // 获取系统服务
            sWindowManagerService = IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
            try {
                if (sWindowManagerService != null) {
                    ValueAnimator.setDurationScale(sWindowManagerService.getCurrentAnimatorScale());
                }
            } catch (RemoteException e) {
                throw e.rethrowFromSystemServer();
            }
        }
        return sWindowManagerService;
    }
}
```

### 执行 performLaunchActivity() 返回 Activity 对象
> (ActivityClientRecord r, Intent customIntent)

#### 通过 getPackageInfo() 方法检查 r.packageInfo (LoadedApk)
1. 安全性检查
2. 从缓存中查找，如果找到并且资源是最新的则直接返回
3. 否则构造一个新的 LoadedApk 放入缓存并返回

#### 实例化 Activity 对象（反射）
1. 通过调用 `Instrumentation#newActivity()` 构造 Activity
```java
// frameworks/base/core/java/android/app/Instrumentation.java
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
// frameworks/base/core/java/android/app/ActivityThread.java
int theme = r.activityInfo.getThemeResource();
if (theme != 0) {
  activity.setTheme();
}
```

#### 执行 Activity#onCreate()
- 通过 `mInstrumentation.callActivityOnCreate()` 调用 `Activity#performCreate()`，最终调用 onCreate 方法
- `Activity.performCreate()`
  - `onCreate();`
  - 修改 TransitionState 状态：`mActivityTransitionState.readState(icicle);`
  - `mFragments.dispatchActivityCreated();`
  - 修改 TransitionState 状态：`mActivityTransitionState.setEnterActivityOptions(this, getActivityOptions());`
- `Activity.onCreate()`
  1. Fragment 恢复状态：`mFragments.restoreAllState()`；
  3. Fragment 分发 create 方法：`mFragments.dispatchCreate()`；
  4. 执行生命周期回调方法：`getApplication().dispatchActivityCreated()`；


#### 将 Activity 放入 mActivities 缓存
```java
// frameworks/base/core/java/android/app/ActivityThread.java
mActivities.put(r.token, r);
```

## handleStartActivity
> (ActivityClientRecord r, PendingTransactionActions pendingActions)

### 执行 Activity#performStart()
1. 修改 TransitionState 状态：`mActivityTransitionState.setEnterActivityOptions(this, getActivityOptions());`
2. `mFragments.execPendingActions()`
3. `mInstrumentation.callActivityOnStart(this)` -> `activity.onStart()`
   1. 执行异步加载任务：`mFragments.doLoaderStart();`
   2. 执行生命周期回调方法：`getApplication().dispatchActivityStarted(this);`
4. `mFragments.dispatchStart()`
5. 修改 TransitionState 状态：`mActivityTransitionState.enterReady(this);`

### 恢复 Activity 状态

- 判断是否需要恢复状态，如果需要的话还需要区分是否是持久化的 Activity
- 持久化：`mInstrumentation.callActivityOnRestoreInstanceState(activity, r.state, r.persistentState);`
- 非持久化：`mInstrumentation.callActivityOnRestoreInstanceState(activity, r.state);`

### 调用 postOnCreate()

## handleResumeActivity

> (IBinder token, boolean finalStateRequest, boolean isForward, String reason)

### 执行 performResumeActivity() 返回 ActivityClientRecord 对象
> (IBinder token, boolean finalStateRequest, String reason)

#### 从缓存 mActivityes 获取 Activity

- `final ActivityClientRecord r = mActivities.get(token);`

#### 检查是否已经是 ON_RESUME 状态

- 如果是 `ON_RESUME` 状态，则直接返回

#### 检查 onNewIntent()

```java
if (r.pendingIntents != null) {
    deliverNewIntents(r, r.pendingIntents);
    r.pendingIntents = null;
}
```

#### 检查 onActivityResule()
```java
if (r.pendingResults != null) {
    deliverResults(r, r.pendingResults, reason);
    r.pendingResults = null;
}
```

#### 执行 Activity.performResume()

1. `mFragments.execPendingActions()`
2. `mInstrumentation.callActivityOnResume(this)` -> `activity.onResume()`
   1. 执行生命周期回调方法：`getApplication().dispatchActivityResumed(this);`
   2. 修改 TransitionState 状态：`mActivityTransitionState.onResume(this, isTopOfTask());`
3. `mFragments.dispatchResume();`
4. `mFragments.execPendingActions();`

### 显示 Activity 窗口

- 首次显示

  ```java
  // If the window hasn't yet been added to the window manager,
  // and this guy didn't finish itself or start another activity,
  // then go ahead and add the window.
  boolean willBeVisible = !a.mStartedActivity;
  if (!willBeVisible) {
      try {
          willBeVisible = ActivityManager.getService().willActivityBeVisible(a.getActivityToken());
      } catch (RemoteException e) {
          throw e.rethrowFromSystemServer();
      }
  }
  if (r.window == null && !a.mFinished && willBeVisible) {
      r.window = r.activity.getWindow();
      // 如果 Activity#mDecor 为空，会执行 Activity#installDecor() 方法实例化 mDecor
      View decor = r.window.getDecorView();
      // 此时 Activity 对用户仍不可见
      decor.setVisibility(View.INVISIBLE);
      ViewManager wm = a.getWindowManager();
      WindowManager.LayoutParams l = r.window.getAttributes();
      a.mDecor = decor;
      l.type = WindowManager.LayoutParams.TYPE_BASE_APPLICATION;
      l.softInputMode |= forwardBit;
      if (r.mPreserveWindow) {
          a.mWindowAdded = true;
          r.mPreserveWindow = false;
          // Normally the ViewRoot sets up callbacks with the Activity
          // in addView->ViewRootImpl#setView. If we are instead reusing
          // the decor view we have to notify the view root that the
          // callbacks may have changed.
          ViewRootImpl impl = decor.getViewRootImpl();
          if (impl != null) {
              impl.notifyChildRebuilt();
          }
      }
      if (a.mVisibleFromClient) {
          // 此时 Activity 对用户可见
          if (!a.mWindowAdded) {
              a.mWindowAdded = true;
              // 将 mDecor 添加到 WindowManager 中，调用链如下：
              // WindowManagerImpl.addView() -> WindowManagerGlobal.addView()
              wm.addView(decor, l);
              // 在 WindowManagerGlobal#addView() 中实例化 ViewRootImpl：
              // 定义 UI Thread ViewRootImplement#mThread，之后每次对 View 的更新操作都会检测操作线程与 mThread 是否相同
              // 实例化 ViewRootImpl#mAttachInfo
              // 实例化 ViewRootImpl#mChoreographer
              // 执行 requestLayout() 开启 View 的三个流程 -> layout -> measure -> draw
          } else {
              // The activity will get a callback for this {@link LayoutParams} change
              // earlier. However, at that time the decor will not be set (this is set
              // in this method), so no action will be taken. This call ensures the
              // callback occurs with the decor set.
              a.onWindowAttributesChanged(l);
          }
      }
  
      // If the window has already been added, but during resume
      // we started another activity, then don't yet make the
      // window visible.
  }
  ```

- 非首次显示

  ```java
  // The window is now visible if it has been added, we are not
  // simply finishing, and we are not starting another activity.
  if (!r.activity.mFinished && willBeVisible && r.activity.mDecor != null && !r.hideForNow) {
      if (r.newConfig != null) {
          performConfigurationChangedForActivity(r, r.newConfig);
          if (DEBUG_CONFIGURATION) {
              Slog.v(TAG, "Resuming activity " + r.activityInfo.name + " with newConfig "
                     + r.activity.mCurrentConfig);
          }
          r.newConfig = null;
      }
      if (localLOGV) Slog.v(TAG, "Resuming " + r + " with isForward=" + isForward);
      WindowManager.LayoutParams l = r.window.getAttributes();
      if ((l.softInputMode & WindowManager.LayoutParams.SOFT_INPUT_IS_FORWARD_NAVIGATION) != forwardBit) {
          l.softInputMode = (l.softInputMode & (~WindowManager.LayoutParams.SOFT_INPUT_IS_FORWARD_NAVIGATION)) | forwardBit;
          if (r.activity.mVisibleFromClient) {
              ViewManager wm = a.getWindowManager();
              View decor = r.window.getDecorView();
              // 更新 mDecor 布局，调用链如下：
              // WindowManagerImpl.updateViewLayout() -> WindowManagerGlobal.updateViewLayout()
              wm.updateViewLayout(decor, l);
              // 通过 view.setLayoutParams() -> requestLayout() 来更新 View
          }
      }
  
      r.activity.mVisibleFromServer = true;
      mNumVisibleActivities++;
      if (r.activity.mVisibleFromClient) {
          // 如果 mDecor 还未添加到 WindowManager 中，则执行 wm.addView(mDecor, param) 并且 
          // mDecor.setVisibility(View.VISIBLE);
          r.activity.makeVisible();
      }
  }
  ```

## handlePauseActivity
> (IBinder token, boolean finished, boolean userLeaving, int configChanges,</br>
  PendingTransactionActions pendingActions, String reason)

### performUserLeaving()

```java
if (userLeaving) {
    performUserLeavingActivity(r);
}
```

### performPauseActivity()

> (ActivityClientRecord r, boolean finished, String reason, PendingTransactionActions pendingActions)

#### 保存 Activity 状态
```java
// Pre-Honeycomb apps always save their state before pausing
final boolean shouldSaveState = !r.activity.mFinished && r.isPreHoneycomb();
if (shouldSaveState) {
    callActivityOnSaveInstanceState(r);
}
```

#### performPauseActivityIfNeeded()

> (ActivityClientRecord r, String reason)

##### 执行 Activity#onPause()

-  `mInstrumentation.callActivityOnPause()` -> `activity.performPause()` ->  `Activity.onPause()`方法
- `Activity#performPause()`
  1.  `mFragments.dispatchPause();`
  2. `onPause();`
- `Activity#onPause()`
  - 执行生命周期回调方法：`getApplication().dispatchActivityPaused(this);`

## handleStopActivity

> (IBinder token, boolean show, int configChanges,</br>
  PendingTransactionActions pendingActions, boolean finalStateRequest, String reason)

### 从缓存 mActivityes 获取 Activity
```java
final ActivityClientRecord r = mActivities.get(token);
```

### performStopActivityInner

> (ActivityClientRecord r, StopInfo info, boolean keepShown,</br>
  boolean saveState, boolean finalStateRequest, String reason)

#### 检查是否已执行过 onStop

#### performPauseActivityIfNeeded

> (ActivityClientRecord r, String reason)

#### 检查是否已调用 onPause 

```java
// One must first be paused before stopped...
performPauseActivityIfNeeded(r, reason);
// 如果已执行过 pause 方法则返回，否则执行 onPause
```

#### callActivityOnStop

> (ActivityClientRecord r, boolean saveState, String reason)

1. 保存 Activity 状态

   ```java
   // Before P onSaveInstanceState was called before onStop, starting with P it's
   // called after. Before Honeycomb state was always saved before onPause.
   final boolean shouldSaveState = saveState && !r.activity.mFinished 
       && r.state == null && !r.isPreHoneycomb();
   final boolean isPreP = r.isPreP();
   if (shouldSaveState && isPreP) {
       callActivityOnSaveInstanceState(r);
   }
   ```

2. 执行 Activity#performStop()：`r.activity.performStop(r.mPreserveWindow, reason);`

   1. 停止任务加载：`mFragments.doLoaderStop(mChangingConfigurations /*retain*/);`

   2. 分发 stop：`mFragments.dispatchStop();`

   3. `mInstrumentation.callActivityOnStop(this)` -> `activity.onStop()`

   4. 清理 cursour：

      ```java
      synchronized (mManagedCursors) {
          final int N = mManagedCursors.size();
          for (int i=0; i<N; i++) {
              ManagedCursor mc = mManagedCursors.get(i);
              if (!mc.mReleased) {
                  mc.mCursor.deactivate();
                  mc.mReleased = true;
              }
          }
      }
      ```

3. `Activity#onStop()`

   1. 修改 TransitionState 状态：`mActivityTransitionState.onStop();`
   2. 执行生命周期回调方法：`getApplication().dispatchActivityStopped(this);`

### 更新 Activity 可见性

- `updateVisibility()`

  ```java
  private void updateVisibility(ActivityClientRecord r, boolean show) {
      // Activity#mDecor
      View v = r.activity.mDecor;
      if (v != null) {
          if (show) {
              if (!r.activity.mVisibleFromServer) {
                  r.activity.mVisibleFromServer = true;
                  mNumVisibleActivities++;
                  if (r.activity.mVisibleFromClient) {
                      // 更新窗口可见性
                      r.activity.makeVisible();
                  }
              }
              if (r.newConfig != null) {
                  // 触发 Activity#onConfiturationChaned() 方法
                  performConfigurationChangedForActivity(r, r.newConfig);
                  r.newConfig = null;
              }
          } else {
              if (r.activity.mVisibleFromServer) {
                  r.activity.mVisibleFromServer = false;
                  mNumVisibleActivities--;
                  // 更新窗口可见性
                  v.setVisibility(View.INVISIBLE);
              }
          }
      }
  }
  ```

## handleDestroyActivity
> (IBinder token, boolean finishing, int configChanges,</br>
  boolean getNonConfigInstance, String reason)

### performDestroyActivity
> (IBinder token, boolean finishing, int configChanges,</br>
  boolean getNonConfigInstance, String reason)

#### 从缓存 mActivities 获取 Activity

- `ActivityClientRecord r = mActivities.get(token);`

#### 检查是否已执行 `onPause` 方法

- `performPauseActivityIfNeeded()`

#### 检查是否已执行 onStop 方法

```java
if (!r.stopped) {
    callActivityOnStop(r, false /* saveState */, "destroy");
}
```

#### 执行 Activity#onDestroy()

1. `mInstrumentation.callActivityOnDestroy(r.activity);` -> `activity.performDestroy();`

2. `Activity#performDestroy()`

   1. 标记 window 已销毁：`mWindow.destroy();`
   2. 分发 destroy：`mFragments.dispatchDestroy();`
   3. 执行 `onDestroy()` 方法
   4. 销毁任务加载器：`mFragments.doLoaderDestroy()`

3. `Activity#onDestroy()`

   1. 关闭 dialog

      ```java
      // dismiss any dialogs we are managing.
      if (mManagedDialogs != null) {
          final int numDialogs = mManagedDialogs.size();
          for (int i = 0; i < numDialogs; i++) {
              final ManagedDialog md = mManagedDialogs.valueAt(i);
              if (md.mDialog.isShowing()) {
                  md.mDialog.dismiss();
              }
          }
          mManagedDialogs = null;
      }
      ```

   2. 关闭 cursor

      ```java
      // close any cursors we are managing.
      synchronized (mManagedCursors) {
          int numCursors = mManagedCursors.size();
          for (int i = 0; i < numCursors; i++) {
              ManagedCursor c = mManagedCursors.get(i);
              if (c != null) {
                  c.mCursor.close();
              }
          }
          mManagedCursors.clear();
      }
      ```

   3. 执行生命周期回调方法：`getApplication().dispatchActivityDestroyed(this);`

#### 从缓存 mActivities 中移除

- `mActivities.remove(token);`

### 从 WindowManager 中移除当前 Activity 的 Window

```java
WindowManager wm = r.activity.getWindowManager();
View v = r.activity.mDecor;
if (v != null) {
    if (r.activity.mVisibleFromServer) {
        mNumVisibleActivities--;
    }
    IBinder wtoken = v.getWindowToken();
    if (r.activity.mWindowAdded) {
        if (r.mPreserveWindow) { // ...}
        else {
            wm.removeViewImmediate(v);
            // 从 WindowManager 中移除 DecorView，调用链如下：
            // WindowManagerImpl.removeViewImmediate() -> 
            // WindowManagerGlobal.removeView() -> removeViewLocked() ->
            // ViewRootImpl.die() -> doDie():
            //   1. dispatchDetachedFromWindow();
            //   2. destroyHardwareRenderer();
            //   3. mSurface.release();
            //   4. WindowManagerGlobal.getInstance().doRemoveView(this);
        }
    }
}
```

### 最终的清理工作

```java
// Mocked out contexts won't be participating in the normal process lifecycle, but if we're 
// running with a proper ApplicationContext we need to have it tear down things cleanly.
Context c = r.activity.getBaseContext();
if (c instanceof ContextImpl) {
    ((ContextImpl) c).scheduleFinalCleanup(r.activity.getClass().getName(), "Activity");
    // 移除潜在的 context 泄露，调用链如下：
    // ContextImpl.scheduleFinalCleanup() ->
    // ActivityThread.scheduleContextCleanup() -> mH.sendMessage(H.CLEAN_UP_CONTEXT) -> 
    // ContextImpl.performFinalCleanup() ->
    // LoadedApk.removeContextRegistrations()
    //   1. 清理未 unregister 的 Receiver;
    //   2. 清理未 unbind 的 Service
}
```

### 清除任务栈

```java
ActivityManager.getService().activityDestroyed(token);
// 从任务栈中移除 Activity，调用链如下：
// ActivityManagerService.activityDestroyed() -> 
// ActivityRecord.activityDestroyedLocked()
//   1. mHandler.removeMessages(DESTROY_TIMEOUT_MSG, record);
//   2. cleanUpActivityLocked(record, true, false);
//   3. removeActivityFromHistoryLocked(record, reason);
```



## performRestartActivity
> (IBinder token, boolean start)

### 从缓存 mActivities 中获取 Activity

- `ActivityClientRecord r = mActivities.get(token);`

### activity#performRestart()

1. `mFragments.noteStateNotSaved();`
2. `mInstrumentation.callActivityOnRestart(this)` -> `activity.onRestart()`
3. 如果 start ，则执行 `performStart()` 方法，流程与 `handleStartActivity`一致

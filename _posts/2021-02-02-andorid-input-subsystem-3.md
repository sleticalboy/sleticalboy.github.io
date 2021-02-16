---
layout: post
title: Android 输入子系统3：InputDispatcher 对事件分发
author: sleticalboy
date: 2021-02-02 10:57:35 +0800
category: android
tags: [android, framework]
---

涉及到的源代码及路径：<br>
`frameworks/base/core/java/android/view/WindowManagerImpl.java`<br>
`frameworks/base/core/java/android/view/WindowManagerGlobal.java`<br>
`frameworks/base/core/java/android/view/ViewRootImpl.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/Session.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/WindowManagerService.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/WindowState.java`<br>
`frameworks/base/core/java/android/view/InputChannel.java`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputWindowHandle.cpp`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputApplicationHandle.cpp`<br>
`frameworks/native/libs/input/InputTransport.cpp`<br>

我们知道，应用层的事件是从 Activity 开始分发给 View 树的，那么事件产生的源头又是
哪里呢？这次我们就来分析一下事件的起源。

事件分发采用责任链模式，其处理基类为 `ViewRootImpl#InputStage`：
```java
abstract class InputStage {
    // 指向下一个处理对象
    private final InputStage mNext;
    public InputStage(InputStage next) { mNext = next;}
    // 将事件传递给下一个处理对象
    public final void deliver(QueuedInputEvent q) { }
    protected void finish(QueuedInputEvent q, boolean handled) { }
    protected void forward(QueuedInputEvent q) { }
    protected void apply(QueuedInputEvent q, int result) { }
    protected int onProcess(QueuedInputEvent q) { }
    protected void onDeliverToNext(QueuedInputEvent q) { }
    protected boolean shouldDropInputEvent(QueuedInputEvent q) { }
}
```
事件处理优先级自上而下依次是：
SyntheticInputStage：负责处理未经处理的新输入事件
ViewPostImeInputStage：负责将 post-ime 类型输入事件传递到 view 层级中
NativePostImeInputStage：负责将 post-ime 类型输入事件传递到 native Activity
EarlyPostImeInputStage：负责对 post-ime 类型输入事件进行早期处理
ImeInputStage：负责将输入事件传递给 IME（不支持 pointer 事件）
ViewPreImeInputStage：负责将 pre-ime 类型输入事件传递到 view 层级中（不支持 pointer 事件）
NativePreImeInputStage：负责将 pre-ime 类型输入事件传递到 native Activity（不支持 pointer 事件）

SystemService#main() -> run() -> startOtherServices() 方法中启动 InputManagerService
（简称为 IMS）和 WindowManagerService（简称为 WMS），首先先实例化 IMS，然后将 IMS
对象作为参数传递给 WMS，最后将依次启动 WMS 和 IMS


## WindowManagerService

WMS 初始化：
```java
InputChannel inputChannel = mInputManager.monitorInput(TAG_WM);
mPointerEventDispatcher = new PointerEventDispatcher(inputChannel);
```
打开输入 channel，并使用此 channel 实例化 PointerEventDispatcher 用于接收输入事件

InputEventReceiver#dispatchInputEvent() 此方法由 native 层调用，事件由 native 层
传递到 Java 层

WMS#addWindow() 方法

```java
public void addWindow() {
    boolean openInputChannels = outInputChannel != null
        && (attrs.inputFeatures & INPUT_FEATURE_NO_INPUT_CHANNEL) == 0;
    if  (openInputChannels) {
        // 打开输入管道
        win.openInputChannel(outInputChannel);
    }
}
```

WMS#openInputChannel() 方法

```java
void openInputChannel() {
    // 打开一对管道
    InputChannel[] inputChannels = InputChannel.openInputChannelPair(getName());
    // 输入管道
    mInputChannel = inputChannels[0];
    mClientChannel = inputChannels[1];
    mInputWindowHandle.inputChannel = inputChannels[0];
    if (outInputChannel != null) {
        mClientChannel.transferTo(outInputChannel);
        mClientChannel.dispose();
        mClientChannel = null;
    } else {
        // If the window died visible, we setup a dummy input channel, so that taps
        // can still detected by input monitor channel, and we can relaunch the app.
        // Create dummy event receiver that simply reports all events as handled.
        mDeadWindowEventReceiver = new DeadWindowEventReceiver(mClientChannel);
    }
    // 向 IMS 注册管道
    mService.mInputManager.registerInputChannel(mInputChannel, mInputWindowHandle);
}
```

## ViewRootImpl

setView() 方法中会初始化 InputChannel

```java
public void setView() {
    if ((mWindowAttributes.inputFeatures & WindowManager.LayoutParams
            .INPUT_FEATURE_NO_INPUT_CHANNEL) == 0) {
        mInputChannel = new InputChannel();
    }
    // 下面的方法实际上是调用了 WMS#addWindow() 方法
    res = mWindowSession.addToDisplay(mWindow, mSeq, mWindowAttributes,
        getHostVisibility(), mDisplay.getDisplayId(), mWinFrame,
        mAttachInfo.mContentInsets, mAttachInfo.mStableInsets,
        mAttachInfo.mOutsets, mAttachInfo.mDisplayCutout, mInputChannel
    );
}
```
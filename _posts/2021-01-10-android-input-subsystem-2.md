---
layout: post
title: Android 输入子系统2：native 事件分发
author: sleticalboy
date: 2021-01-10 20:40:13 +0800
category: android
tags: [android, framework]
---

涉及到的源代码及路径：
`frameworks/base/core/java/android/view/WindowManagerImpl.java`<br>
`frameworks/base/core/java/android/view/WindowManagerGlobal.java`<br>
`frameworks/base/core/java/android/view/ViewRootImpl.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/Session.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/WindowManagerService.java`<br>
`frameworks/base/services/core/java/com/android/server/wm/WindowState.java`<br>
`frameworks/base/core/java/android/view/InputChannel.java`<br>
`frameworks/base/core/jni/android_view_InputChannel.cpp`<br>
`frameworks/native/libs/input/InputTransport.cpp`<br>
`frameworks/base/core/jni/android_view_InputEventReceiver.cpp`<br>

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

## InputManagerService

IMS 初始化

## EventHub

事件中心

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

## InputReader

2、`InputReader::processEventsLocked`
```cpp
void InputReader::processEventsLocked(const RawEvent* rawEvents, size_t count) {
    // 循环判断事件类型并处理之
    for (const RawEvent* rawEvent = rawEvents; count;) {
        int32_t type = rawEvent->type;
        size_t batchSize = 1;
        // 1、type < EventHubInterface::FIRST_SYNTHETIC_EVENT
        // 处理事件，最终会调用到 InputDevice::process()
        processEventsForDeviceLocked(deviceId, rawEvent, batchSize);
        // 2、type == EventHubInterface::DEVICE_ADDED
        // 添加输入设备
        addDeviceLocked(rawEvent->when, rawEvent->deviceId);
        // 3、type == EventHubInterface::DEVICE_REMOVED
        // 移除输入设备
        removeDeviceLocked(rawEvent->when, rawEvent->deviceId);
        // 4、type == EventHubInterface::FINISHED_DEVICE_SCAN
        // 配置改变
        handleConfigurationChangedLocked(rawEvent->when);
    }
}
```

3、`InputDevice::process`
```cpp
void InputDevice::process(const RawEvent* rawEvents, size_t count) {
    // 根据 event 的 class 不同，有不一样的 Mapper，大致有以下12种不同的输入设备：
    // External devices：外接设备，比如鼠标、键盘等
    // Devices with mics：具有 mic 的设备
    // Switch-like devices：类开关设备，对应 SwitchInputMapper
    // Scroll wheel-like devices：带滚轮的设备，对应  RotaryEncoderInputMapper
    // Vibrator-like devices：类震动设备，对应 VibratorInputMapper
    // Keyboard-like devices：类键盘设备，对应 KeyboardInputMapper
    // Cursor-like devices：光标设备，比如轨迹球或鼠标，对应 CursorInputMapper
    // Mouser-like devices：带有鼠标的输入设备，对应 KeyMouseInputMapper
    // Touchscreens and touchpad devices：触摸屏和触摸板设备，分为多点触控和单点触控
    //   分别对应 MultiTouchInputMapper 和 SingleTouchInputMapper
    // Joystick-like devices：类似操纵杆的设备，对应 JoystickInputMapper
    // External stylus-like devices：外部笔式设备，对应 ExternalStylusInputMapper
    size_t numMappers = mMappers.size();
    for (const RawEvent* rawEvent = rawEvents; count != 0; rawEvent++) {
        if (mDropUntilNextSync) {
            if (rawEvent->type == EV_SYN && rawEvent->code == SYN_REPORT) {
                mDropUntilNextSync = false;
            }
        } else if (rawEvent->type == EV_SYN && rawEvent->code == SYN_DROPPED) {
            mDropUntilNextSync = true;
            reset(rawEvent->when);
        } else {
            for (size_t i = 0; i < numMappers; i++) {
                InputMapper* mapper = mMappers[i];
                // 调用不同的 Mapper 进行处理
                mapper->process(rawEvent);
            }
        }
        --count;
    }
}
```

`void QueuedInputListener::flush()`

```cpp
void QueuedInputListener::flush() {
    // NotifyArgs 有 5 个实现子类：
    // NotifyConfigurationChangedArgs：配置更改事件
    // NotifyDeviceResetArgs：设备重置事件，比如添加、移除或重新配置
    // NotifyKeyArgs：按键事件，多用于电视机
    // NotifyMotionArgs：手势事件，多用于只能手机或平板、车载等手持设备
    // NotifySwitchArgs：切换事件
    // 这里以 NotityMotionArgs 为例
    size_t count = mArgsQueue.size();
    for (size_t i = 0; i < count; i++) {
        NotifyArgs* args = mArgsQueue[i];
        // NotifyMotionArgs::notify() -> InputDispatcher::notifyMotion()
        args->notify(mInnerListener);
        delete args;
    }
    mArgsQueue.clear();
}
```

`InputDispatcher::notifyMotion()`
```cpp
void InputDispatcher::notifyMotion(const NotifyMotionArgs* args) {
    if (!validateMotionEvent(args->action, args->actionButton,
            args->pointerCount, args->pointerProperties)) {
        return;
    }
    uint32_t policyFlags = args->policyFlags;
    policyFlags |= POLICY_FLAG_TRUSTED;

    android::base::Timer t;
    // 这里 interceptMotionBeforeQueueing() 最终会通过 jni 回调到 Java 层 IMS 中
    mPolicy->interceptMotionBeforeQueueing(args->eventTime, /*byref*/ policyFlags);

    bool needWake;
    { // acquire lock
        mLock.lock();
        if (shouldSendMotionToInputFilterLocked(args)) {
            mLock.unlock();
            MotionEvent event;
            event.initialize(args->deviceId, args->source, args->action,
                args->actionButton, args->flags, args->edgeFlags,
                args->metaState, args->buttonState, 0, 0, args->xPrecision,
                args->yPrecision, args->downTime, args->eventTime,
                args->pointerCount, args->pointerProperties, args->pointerCoords);
            policyFlags |= POLICY_FLAG_FILTERED;
            // 同样 filterInputEvent() 会通过 jni 回调到 Java 层 IMS 中
            if (!mPolicy->filterInputEvent(&event, policyFlags)) {
                return; // event was consumed by the filter
            }
            mLock.lock();
        }
        // Just enqueue a new motion event.
        MotionEntry* newEntry = new MotionEntry(args->eventTime, args->deviceId,
            args->source, policyFlags, args->action, args->actionButton,
            args->flags, args->metaState, args->buttonState, args->edgeFlags,
            args->xPrecision, args->yPrecision, args->downTime, args->displayId,
            args->pointerCount, args->pointerProperties, args->pointerCoords, 0, 0);
        // 将一个新的 MotionEvent 加入队列等待处理
        needWake = enqueueInboundEventLocked(newEntry);
        mLock.unlock();
    } // release lock
    if (needWake) {
        // 需要唤醒时唤醒对端
        mLooper->wake();
    }
}
```

## InputDispatcher


### native 事件分发

---> native 层
InputDispatcherThread::threadLoop() ->
InputDispatcher::dispatchOnce() -> dispatchOnceInnerLocked() ->
dispatchMotionLocked() -> findTouchedWindowTargetsLocked() ->
dispatchEventLocked() -> prepareDispatchCycleLocked() ->
startDispatchCycleLocked() ->
InputPublisher::publishMotionEvent() ->
InputChannel::sendMessage(InputMessage msg) -> 通过 socket 将 msg 发送给接收端

所以要弄清接收端是谁？

---> Java 层，Activity 启动时：
ActivityThread#handleResumeActivity() ->
WindowManagerImpl#addView() ->
WindowManagerGlobal#addView() ->
ViewRootImpl#setView() ->
Session#addToDisplay() ->
WMS#addWindow() ->
WindowState#openInputChannel() ->
InputChannel#openInputChannelPair() -> nativeOpenInputChannelPair() ->
---> jni 层
android_view_InputChannel.cpp::android_view_InputChannel_nativeOpenInputChannelPair() ->
InputTransport.cpp::InputChannel::openInputChannelPair() -> [0] server [1]client

最终被保存到 ViewRootImpl#mInputChannel 中，而 ViewRootImpl$WindowInputEventReceiver
是用 ViewRootImpl#mInputChannel 来初始化的，所以：
--> 接收端：ViewRootImpl$WindowInputEventReceiver

---> java 层
WindowInputEventReceiver#<init> -> 
InputEventReceiver#<init> -> nativeInit(inputChannel) ->
---> jni 层
NativeInputEventReceiver(inputChannel) 根据 channel 创建 InputConsumer，同时：
initialize() -> mMessageQueue->getLooper()->addFd(channel->getFd(), events = ALOOPER_EVENT_INPUT)，
而其本身又实现了 LooperCallback，所以当监听的 channel->getFd() 有变化时，会回
调 handleEvent()，即：
NativeInputEventReceiver::handleEvent() -> consumeEvents() ->
--> Java 层
InputEventReceiver#dispatchBatchedInputEventPending() 或者
InputEventReceiver#dispatchInputEvent()

-> ViewRootImpl#doProcessInputEvents() -> deliverInputEvent()
在 ViewRootImpl 中使用 InputStage 责任链的方式对 native 层中发送过来的事件进行分发
最终是通过 ViewPostImeInputStage 将事件传递到 View 层级中的

ViewPostImeInputStage#onProcess() -> 在这里会对输入事件进行分类处理：
-> KeyEvent：processKeyEvent()
-> InputDevice.SOURCE_CLASS_POINTER：processPointerEvent()
-> InputDevice.SOURCE_CLASS_TRACKBALL：processTrackballEvent()
-> 其他：processGenericMotionEvent() -> 这里我们先看其他事件
mView.dispatchGenericMotionEvent(event)（这里的 mView 就是 DecorView，View 树的根）->
Window.Callback#dispatchGenericMotionEvent()，Callback 的实际实现是 Activity 或者 Dialog

最终当事件处理完毕后：ViewRootImpl#finishInputEvent() -> 分为以下 case：
①-> ViewRootImpl 自己产生的事件：Java 层回收（KeyEvent 和 MotionEvent）
②-> 来自 InputEventReceiver 的事件：InputEventReceiver#finishInputEvent() -> 
---> native 层
android_view_InputEventReceiver.cpp::nativeFinishInputEvent() ->
NativeInputEventReceiver::finishInputEvent() ->
InputTransport.cpp::InputConsumer::sendFinishedSignal() -> 
sendUnchainedFinishedSignal() -> 
InputChannel::sendMessage(InputMessage/**InputMessage::TYPE_FINISHED**/) ->
通过 socket::send(fd, msg) 的形式反馈给 InputDispatcher
---
layout: post
title: Android 输入子系统1：IMS 初始化与启动
author: sleticalboy
date: 2021-01-22 15:25:35 +0800
category: android
tags: [android, framework]
---

Android 输入子系统将分为以下 5 个小节完成：

1、IMS 与 WMS 初始化与启动：关联、InputMethodService；<br>
2、EventHub 工作原理：InputReader；<br>
3、InputDispatcher 对事件分发： InputTransport；<br>
4、接收输入事件并分发：ViewRootImpl#InputEventReceiver；<br>
5、ViewRootImpl 把输入事件传递到 View 层级中

本文分析 IMS 的实例化与启动，涉及到的源代码及路径：<br>
`frameworks/base/services/java/com/android/server/SystemServer.java`<br>
`frameworks/base/services/core/java/com/android/server/input/InputManagerService.java`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputManagerService.cpp`<br>
`frameworks/native/services/inputflinger/InputManager.cpp`<br>
`frameworks/native/services/inputflinger/EventHub.cpp`<br>
`frameworks/native/services/inputflinger/InputReader.cpp`<br>
`frameworks/native/services/inputflinger/InputDispatcher.cpp`<br>

下文中 InputManagerService 简称 IMS，WindowManagerService 简称 WMS

## IMS 实例化

### Java 层 IMS 实例化

SystemService#main() -> run() -> startOtherServices() 方法中启动 IMS 和 WMS，首先
先实例化 IMS，然后将 IMS 对象作为参数传递给 WMS，最后将依次启动 WMS 和 IMS

```java
// SystemServer#startOtherServices()
private void startOtherServices() {
    // 实例化 IMS
    InputManagerService inputManager = new InputManagerService(context);
    // 实例化 WMS 时传入了 PhoneWindowManager 对象，作为 WindowManagerPolicy 的实现，
    // 包括其所有的策略接口：在输入事件分发之前都要经过这里决断之后才会进行下一步动作
    // 另外还将 IMS 作为参数传给 WMS
    WindowManagerService wm = WindowManagerService.main(context, inputManager,
            mFactoryTestMode != FactoryTest.FACTORY_TEST_LOW_LEVEL,
            !mFirstBoot, mOnlyCore, new PhoneWindowManager());
    // 将 WMS 和 IMS 都注册到 ServiceManager 中
    ServiceManager.addService(Context.WINDOW_SERVICE, wm, /* allowIsolated= */ false,
            DUMP_FLAG_PRIORITY_CRITICAL | DUMP_FLAG_PROTO);
    ServiceManager.addService(Context.INPUT_SERVICE, inputManager,
            /* allowIsolated= */ false, DUMP_FLAG_PRIORITY_CRITICAL);
}
```

1、先来看 Java 层 IMS 的实例化

```java
public InputManagerService(Context context) {
    // 实例化一个处理事件的 Handler
    mHandler = new InputManagerHandler(DisplayThread.get().getLooper());
    // 初始化 native 层 InputManager，包括 EventHub、InputReaderThread、InputDispatcherThread
    // 下节进行分析
    mPtr = nativeInit(this, mContext, mHandler.getLooper().getQueue());
}
```

Java 层 IMS 的实例化主要做了两件事：
- 实例化一个处理事件的 Handler 用于处理 native 层传的一些回调；
- 初始化 native 层 InputManager，包括输入事件生产中心 EventHub、事件读取线程 InputReaderThread
和事件分发线程 InputDispatcherThread

其实 Java 层 IMS 实际就是 native 层 InputManager 的包装，native 的一些重要方法都是通过 jni
回调到 Java 层来处理的。

2、接下来再来看 IMS 实例化过程，入口是 `WindownManagerService.main()` 函数，在
该函数中会实例化 WMS 对象并返回。

```java
private WindowManagerService(Context context, InputManagerService inputManager,
    boolean haveInputMethods, boolean showBootMsgs, boolean onlyCore,
    WindowManagerPolicy policy) {
    // 保存 IMS 实例
    mInputManager = inputManager; // Must be before createDisplayContentLocked.
    // 保存 WindowManagerPolicy 实例
    mPolicy = policy;
    // 用于 Context#getSystemService() 方法
    LocalServices.addService(WindowManagerPolicy.class, mPolicy);
    if(mInputManager != null) {
        // 创建一个 InputChannel 用于接收 native 层的输入事件
        final InputChannel inputChannel = mInputManager.monitorInput(TAG_WM);
        // PointerEventDispatcher 继承自 InputEventReceiver，用于接收输入事件
        // 并进行分发
        mPointerEventDispatcher = inputChannel != null
                ? new PointerEventDispatcher(inputChannel) : null;
    } else {
        mPointerEventDispatcher = null;
    }
    // ... 省略
}
```

Java 层 WMS 实例化：
- 保存 IMS 和 WindowManagerPolicy 实例以作后用；
- 创建 PointerEventDispatcher 实例，用于接收事件并通过 PointerEventListener 分
发出去。这里有一个例子就是开发者模式中的**显示指针位置**，PointerLocationView
就是通过实现 PointerEventListener 接口来实现的。

### native 层 IMS 实例化

Java 层 IMS 构造时会调用 `nativeInit()` 函数来触发 native 层 IMS 的初始化，大致
流程如下：

```
com_android_server_input_InputManagerService.cpp::nativeInit() ->
new NativeInputManager::NativeInputManager() ->
  sp<EventHub> eventHub = new EventHub();
  new InputManager(eventHub, this/*InputReaderPolicyInterface*/, this/*InputDispatcherPolicyInterface*/);
    mDispatcher = new InputDispatcher(dispatcherPolicy);
    mReader = new InputReader(eventHub, readerPolicy, mDispatcher);
    -> initialize() ->
      mReaderThread = new InputReaderThread(mReader);
      mDispatcherThread = new InputDispatcherThread(mDispatcher);

NativeInputManager 类继承结构
class NativeInputManager : public virtual RefBase,
    public virtual InputReaderPolicyInterface,
    public virtual InputDispatcherPolicyInterface,
    public virtual PointerControllerPolicyInterface {}
```

1、`com_android_server_input_InputManagerService.cpp::nativeInit()`

```cpp
static jlong nativeInit(JNIEnv* env, jclass /* clazz */, jobject serviceObj,
    jobject contextObj, jobject messageQueueObj) {
    // 构造一个 native 层的 MessageQueue
    sp<MessageQueue> messageQueue = android_os_MessageQueue_getMessageQueue(env, messageQueueObj);
    // 构造 NativeInputManager
    NativeInputManager* im = new NativeInputManager(contextObj, serviceObj,
            messageQueue->getLooper());
    im->incStrong(0);
    return reinterpret_cast<jlong>(im);
}
```
该函数做了两件事：
- 通过 Java MessageQueue 对象实例化一个 native 层 MessageQueue 对象；
- 通过 Java Context 对象、IMS 对象以及 native 层 MessageQueue 对象构造 NativeInputManager 对象

2、构造 `NativeInputManager`

```cpp
// NativeInputManager 类结构
class NativeInputManager : public virtual RefBase,
    public virtual InputReaderPolicyInterface,
    public virtual InputDispatcherPolicyInterface,
    public virtual PointerControllerPolicyInterface {}

// 构造函数
NativeInputManager::NativeInputManager(jobject contextObj, jobject serviceObj,
    const sp<Looper>& looper) : mLooper(looper), mInteractive(true) {
    JNIEnv* env = jniEnv();
    // 全局引用
    mContextObj = env->NewGlobalRef(contextObj);
    mServiceObj = env->NewGlobalRef(serviceObj);
    mInteractive = true;
    // 构造 EventHub 实例并通过该实例构造 InputManager 实例
    sp<EventHub> eventHub = new EventHub();
    mInputManager = new InputManager(eventHub, this/*InputReaderPolicyInterface*/,
        this/*InputDispatcherPolicyInterface*/);
}
```

NativeInputManager 构造函数中：
- 构造 EventHub 实例；
- 通过 EventHub 实例构造 InputManager 实例；


3、构造 `EventHub`

EventHub 类继承自 EventHubInterface 接口，EventHub 聚集在系统上所有已知输入设备
（包括可能由模拟器环境仿真的设备）上接收到的输入事件。此外 EventHub 还生成合成
输入事件以指示何时添加或移除设备。EventHub 通过 getEvents() 函数提供输入事件流。
它还支持查询输入设备的当前实际状态，例如识别当前按下的键。最后，EventHub 还会
跟踪各个输入设备的功能，例如它们的类别和它们支持的键控代码集。

```cpp
EventHub::EventHub(void) :
        mBuiltInKeyboardId(NO_BUILT_IN_KEYBOARD), mNextDeviceId(1),
        mIRDeviceId(NO_IR_KEYBOARD), mControllerNumbers(),
        mOpeningDevices(0), mClosingDevices(0),
        mNeedToSendFinishedDeviceScan(false),
        mNeedToReopenDevices(false), mNeedToScanDevices(true),
        mPendingEventCount(0), mPendingEventIndex(0), mPendingINotify(false) {
    acquire_wake_lock(PARTIAL_WAKE_LOCK, WAKE_LOCK_ID);
    // 创建 epoll 对象
    mEpollFd = epoll_create(EPOLL_SIZE_HINT);
    // 创建 inotify 对象
    mINotifyFd = inotify_init();
    // 监听 /dev/path/ 目录的删除和创建事件，即输入设备的增删事件
    // 当目录下的设备节点发生增删事件时，可已通过 read(fd) 获取事件的详细信息
    int result = inotify_add_watch(mINotifyFd, "/dev/path", IN_DELETE | IN_CREATE);

    struct epoll_event eventItem;
    memset(&eventItem, 0, sizeof(eventItem));
    eventItem.events = EPOLLIN; // 监听 write 事件
    eventItem.data.u32 = EPOLL_ID_INOTIFY; // 自定义值
    // 把 inotify 添加到 epoll 监听队列中，当 inotify 事件到来时，epoll_wait() 会
    // 立即返回，EventHub 可以从 fd 中读取设备节点的增删信息并进行处理
    result = epoll_ctl(mEpollFd, EPOLL_CTL_ADD, mINotifyFd, &eventItem);

    int wakeFds[2];
    // 创建管道，fds[0] 表示管道的读端，fds[1] 表示管道的写端
    result = pipe(wakeFds);
    mWakeReadPipeFd = wakeFds[0];
    mWakeWritePipeFd = wakeFds[1];
    
    // 设置唤醒读端为非阻塞式
    result = fcntl(mWakeReadPipeFd, F_SETFL, O_NONBLOCK);
    // 设置唤醒写端为非阻塞式
    result = fcntl(mWakeWritePipeFd, F_SETFL, O_NONBLOCK);

    eventItem.data.u32 = EPOLL_ID_WAKE;
    // 把唤醒读端的 fd 添加到 epoll 监听队列中，目的是在必要时唤醒 reader 线程
    result = epoll_ctl(mEpollFd, EPOLL_CTL_ADD, mWakeReadPipeFd, &eventItem);
}
```

EventHub 构造函数中：

- 利用 [inotify 机制]()去监听 /dev/input/ 目录下输入设备的移除或添加；
- 当监听到设备增删时通过 [epoll 机制]()通知EventHub::getEvents() 去读取 
/dev/input/ 目录下所有设备，并产生原始事件

4、`InputManager` 构造与初始化

InputManager 类继承自 InputManagerInterface 接口，是系统处理输入事件的核心。
InputManager 包含两个线程：
- InputReaderThread（称为“ InputReader”）读取并预处理原始输入事件，应用策略，
并将消息发布到由DispatcherThread管理的队列中。
- InputDispatcherThread（称为“ InputDispatcher”）线程在队列上等待新事件，然
后异步将其分配给应用程序。

根据设计，InputReaderThread 类和 InputDispatcherThread 类不共享任何内部状态。
而且，所有通信都是从 InputReaderThread 到 InputDispatcherThread 一种方式，绝不
会相反。但是，这两个类都可以与 InputDispatchPolicy 交互。InputManager 类从不
对 Java 本身进行任何调用。相反，InputDispatchPolicy 负责执行与系统的所有外部交
互，包括调用DVM服务。

```cpp
InputManager::InputManager(const sp<EventHubInterface>& eventHub,
        const sp<InputReaderPolicyInterface>& readerPolicy,
        const sp<InputDispatcherPolicyInterface>& dispatcherPolicy) {
    // 构造出 InputDispatcher 和 InputRader，分别用于事件分发和事件读取
    mDispatcher = new InputDispatcher(dispatcherPolicy);
    mReader = new InputReader(eventHub, readerPolicy, mDispatcher);
    initialize();
}

void InputManager::initialize() {
    // 构造出 InputRaderThread 和 InputDispatcherThread，事件读取和事件分发的
    // 实际执行者
    mReaderThread = new InputReaderThread(mReader);
    mDispatcherThread = new InputDispatcherThread(mDispatcher);
}
```

### 小结

- Android 输入系统的分为 Java 层和 native 层两部分；
- Java 层 IMS、native 层 InputFlinger 和 input；
- 其初始化过程由 Java 层递进到 native 层；

## IMS 启动

### Java 层 IMS 启动

1、在 SystemServer 中调用 IMS 启动函数
```java
// SystemServer#startOtherServices()
private void startOtherServices() {
    // ... 省略初始化代码
    // 将 WMS 注入到 AMS 中
    mActivityManagerService.setWindowManager(wm);
    // 通知 IMS 初始化完成，在 WMS#onInitReady() 函数中将会初始化
    // PhoneWindowManagerPolicy 并将 WMS 加入 Watchdog 用于检测 WMS 内部是否死锁
    wm.onInitReady();
    // 将函数调用从 IMS 转发到 WMS
    inputManager.setWindowManagerCallbacks(wm.getInputMonitor());
    // 启动 IMS 
    inputManager.start();
}
```

2、调用 `IMS#start()` 进而启动 native 层

```java
public void start() {
    // 启动 native 层 InputManager
    nativeStart(mPtr);
    // 注册一系列设置改变的监听
    registerPointerSpeedSettingObserver();
    registerShowTouchesSettingObserver();
    registerAccessibilityLargePointerSettingObserver();

    Runnable updateTask = () -> {
        updatePointerSpeedFromSettings();
        updateShowTouchesFromSettings();
        updateAccessibilityLargePointerFromSettings();
    };
    mContext.registerReceiver(new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            updateTask.run();
        }
    }, new IntentFilter(Intent.ACTION_USER_SWITCHED), null, mHandler);
    updateTask.run();
}
```

小结：
- 与 WMS 进行关联，为后期交互打下基础；
- 调用 `nativeStart()` 函数初始化 native 层 InputManager

### native 层 InputManager 启动

native 层 InputManager 的启动过程大致如下：

<pre>
com_android_server_input_InputManagerService.cpp::nativeStart() ->
  im->getInputManager()->start() -> InputManager::start() ->
    mDispatcherThread->run("InputDispatcher", PRIORITY_URGENT_DISPLAY) ->
      InputDispatcherThread::threadLoop() -> mDispatcher->dispatchOnce() 开始干活：分发事件
    mReaderThread->run("InputReader", PRIORITY_URGENT_DISPLAY) ->
      开始干活：从 EventHub 中读取事件并进行预处理后放入队列，通知 dispatcher 分发
      InputReaderThread::threadLoop() -> mReader->loopOnce() 
</pre>

1、`com_android_server_input_InputManagerService.cpp::nativeStart()`

```cpp
static void nativeStart(JNIEnv* env, jclass /* clazz */, jlong ptr) {
    // nativeInit() 时返回的 NativeInputManager 指针
    NativeInputManager* im = reinterpret_cast<NativeInputManager*>(ptr);
    // 调用 NativeInputManager 的 start() 函数
    status_t result = im->getInputManager()->start();
}
```

2、`InputManager::start()`

```cpp
status_t InputManager::start() {
    // 启动 Dispatcher 线程，run() 方法内部会调用 threadLoop() 方法
    status_t result = mDispatcherThread->run("InputDispatcher", PRIORITY_URGENT_DISPLAY);
    if (result) { // 启动失败，直接返回
        return result;
    }
    // 启动 Rader 线程，同样 run() 方法内部也会调用 threadLoop() 方法
    result = mReaderThread->run("InputReader", PRIORITY_URGENT_DISPLAY);
    if (result) { // 如果启动失败，则退出 Dispatcher 线程
        mDispatcherThread->requestExit();
        return result;
    }
    return OK;
}
```

查看 InputManager 源码可知，其主要作用就是初始化和控制 InputReader 和 InputDispatcher 
两个线程开始工作与停止工作，职责非常明确。随后就把工作转交给两个线程来处理。

3、两个工作线程开始干活

3.1、InputRader 开始循环

```cpp
bool InputReaderThread::threadLoop() {
    // loopOnce() 会从 EventHub 中取出原始的输入事件并进行加工，随后发布给
    // Dispatcher 进行分发
    mReader->loopOnce();
    // 返回 true 表示会一直循环知道发生错误或线程退出
    return true;
}
```

3.2、InputDispatcher 开始循环

```cpp
bool InputDispatcherThread::threadLoop() {
    // dispatchOnce() 会对从 EventHub 中取出的事件进行分发
    mDispatcher->dispatchOnce();
    // 返回 true 表示会一直循环知道发生错误或线程退出
    return true;
}
```

### 小结

- IMS 启动分为 Java 层和 native 层；
- Java 层启动之前要与 WMS 建立关联，为后面两者交互做铺垫；
- native 层启动主要是启动了 InputReaderThread 和 InputDispatcherThread 两大工作线程，
其主要职责是从 EventHub 读取事件与分发事件。

下节将要分析 EventHub 的工作原理以及 InputReader 读取原始输入事件的工作过程

## 参考资料

[《深入理解Android卷3（张大伟）第5章：深入理解 Android 输入系统》]()
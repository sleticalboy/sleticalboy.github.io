---
layout: post
title: Android 输入子系统1：IMS 初始化与启动
author: sleticalboy
date: 2021-01-22 15:25:35 +0800
category: android
tags: [android, framework]
---

Android 输入子系统：
1、IMS 与 WMS 初始化；
  关联、InputMethodService、
2、EventHub 工作原理；
  InputReader
3、InputDispatcher 对事件分发；
  InputTransport
4、Java 层接收输入事件并通过 ViewRootImpl 传递到 View 层级中去；
  ViewRootImpl

涉及到的源代码及路径：
`frameworks/base/services/java/com/android/server/SystemServer.java`<br>
`frameworks/base/services/core/java/com/android/server/input/InputManagerService.java`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputManagerService.cpp`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputWindowHandle.cpp`<br>
`frameworks/base/services/core/jni/com_android_server_input_InputApplicationHandle.cpp`<br>
`frameworks/native/services/inputflinger/InputManager.cpp`<br>
`frameworks/native/services/inputflinger/EventHub.cpp`<br>
`frameworks/native/services/inputflinger/InputReader.cpp`<br>
`frameworks/native/services/inputflinger/InputDispatcher.cpp`<br>
`frameworks/native/libs/input/InputTransport.cpp`<br>

下文中 InputManagerService 简称 IMS，WindowManagerService 简称 WMS

## Java 层 IMS 实例化与启动

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

先来看 IMS 的实例化：

```java
public InputManagerService(Context context) {
    // 实例化一个处理事件的 Handler
    mHandler = new InputManagerHandler(DisplayThread.get().getLooper());
    // 初始化 native 层 InputManager，包括 EventHub、InputReaderThread、InputDispatcherThread
    mPtr = nativeInit(this, mContext, mHandler.getLooper().getQueue());
}
```
Java 层 IMS 的实例化主要做了两件事：
- 实例化一个处理事件的 Handler 用于处理 native 层传的一些回调；
- 初始化 native 层 InputManager，包括输入事件生产中心 EventHub、事件读取线程 InputReaderThread
和事件分发线程 InputDispatcherThread

其实 Java 层 IMS 实际就是 native 层 InputManager 的包装，native 的一些重要方法都是通过 jni
回调到 Java 层来处理的。接下来再来看 IMS 实例化过程，入口是 `WindownManagerService.main()`
函数，在该函数中会实例化 WMS 对象并返回。

```java
private WindowManagerService(Context context, InputManagerService inputManager,
    boolean haveInputMethods, boolean showBootMsgs, boolean onlyCore,
    WindowManagerPolicy policy) {
    // 锁机制
    installLock(this, INDEX_WINDOW);
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
        mPointerEventDispatcher = inputChannel != null
                ? new PointerEventDispatcher(inputChannel) : null;
    } else {
        mPointerEventDispatcher = null;
    }
    // ... 省略
}
```

将调用从 IMS 转发到 WMS
IMS#setWindownManagerCallback(wm.getInputMonitor())

IMS#start() -> nativeStart()

## native 层 IMS 实例化与启动

### init
com_android_server_input_InputManagerService.cpp::nativeInit() ->

class NativeInputManager : public virtual RefBase,
    public virtual InputReaderPolicyInterface,
    public virtual InputDispatcherPolicyInterface,
    public virtual PointerControllerPolicyInterface {}

new NativeInputManager::NativeInputManager() ->
  sp<EventHub> eventHub = new EventHub();
  new InputManager(eventHub, this/*InputReaderPolicyInterface*/, this/*InputDispatcherPolicyInterface*/);
    mDispatcher = new InputDispatcher(dispatcherPolicy);
    mReader = new InputReader(eventHub, readerPolicy, mDispatcher);
    -> initialize() ->
      mReaderThread = new InputReaderThread(mReader);
      mDispatcherThread = new InputDispatcherThread(mDispatcher);

### start
com_android_server_input_InputManagerService.cpp::nativeStart() ->
  im->getInputManager()->start() -> InputManager::start() ->
    mDispatcherThread->run("InputDispatcher", PRIORITY_URGENT_DISPLAY) ->
      InputDispatcherThread::threadLoop() -> mDispatcher->dispatchOnce() 开始干活：分发事件
    mReaderThread->run("InputReader", PRIORITY_URGENT_DISPLAY) ->
      InputReaderThread::threadLoop() -> mReader->loopOnce() 开始干活：从 EventHub 中读取事件并进行预处理后放入队列，通知 dispatcher 分发

## inputflinger

### EventHub 初始化 `EventHub::EventHub()`

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

以上代码：
1、利用 inotify 机制去监听 /dev/input/ 目录下输入设备的移除或添加；
2、当监听到设备增删时通过 epoll 通知EventHub::getEvents() 去读取 /dev/input/ 目录下
所有设备，并产生原始事件

### InputReader 一次执行 `InputReader::loopOnce()`

EventHub、InputReader、InputReaderThread、InputMapper
从 EventHub 读取事件
预处理事件
通知 dispatcher 进行分发

```cpp
void InputReader::loopOnce() {
    // 1、从EventHub 获取事件，返回事件个数
    size_t count = mEventHub->getEvents(timeout, mEventBuffer, EVENT_BUFFER_SIZE/*256*/);
    // 2、预处理事件
    if (count) processEventsLocked(mEventBuffer, count);
    // 3、通知 dispatcher 进行分发
    mQueuedListener->flush();
}
```

InputReaderThread 执行一次一共做了三件事：

- 通过 getEvents() 从 EventHub 获取未处理的事件，这些事件分为两类：一类是原始输入事
件即从设备节点中读取出的原始事件；一类是设备事件即输入设备可用性变化事件
- 通过 processEventsLocked() 对事件进行预处理
- 预处理之后通过 flush() 将事件交给 InputDispatcher 进行分发

1、从 EventHub 获取事件并返回事件个数 `EventHub::getEvents()`

```cpp
size_t EventHub::getEvents(int timeoutMillis, RawEvent* buffer,
    size_t bufferSize) {
    AutoMutex _l(mLock);
    struct input_event readBuffer[bufferSize]; // 数组长度为 256
    // event 指针指向在 buffer 中下一个可用于存储事件的 RawEvent 结构体，每存储一个
    // 事件，指针后移一个元素
    RawEvent* event = buffer; // buffer 长度为 256
    size_t capacity = bufferSize; // 数组剩余可以装入多少个元素
    bool awoken = false; // 是否需要唤醒 dispatcher 端
    // 先将可用事件放入 buffer 中并返回，如没有可用事件则调用 epoll_wait() 等待事件
    // 到来；事件到来后会重新执行循环
    for (;;) {
        nsecs_t now = systemTime(SYSTEM_TIME_MONOTONIC);
        // ① 处理与设备相关的工作，包括：
        // a、重新打开设备
        // b、移除设备
        // c、扫描设备
        // d、新增设备
        // e、扫描完成
        if (mNeedToReopenDevices) { // a、如果需要重新打开设备则先关闭再打开
            mNeedToReopenDevices = false;
            closeAllDevicesLocked();
            mNeedToScanDevices = true;
            break; // return to the caller before we actually rescan
        }
        while (mClosingDevices) { // b、移除设备时会产生 DEVICE_REMOCED 事件
            Device* device = mClosingDevices;
            mClosingDevices = device->next;
            event->when = now;
            event->deviceId = device->id == mBuiltInKeyboardId ? BUILT_IN_KEYBOARD_ID : device->id;
            event->type = DEVICE_REMOVED;
            event += 1; // 指向数组下一个可用位置
            delete device;
            mNeedToSendFinishedDeviceScan = true;
            if (--capacity == 0) break; // 如果缓冲区已满，则退出循环
        }
        if (mNeedToScanDevices) { // c、需要扫描设备并读取全部事件
            mNeedToScanDevices = false;
            scanDevicesLocked();
            mNeedToSendFinishedDeviceScan = true;
        }
        while (mOpeningDevices != NULL) { // d、添加设备会产生 DEVICE_ADD 事件
            Device* device = mOpeningDevices;
            mOpeningDevices = device->next;
            event->when = now;
            event->deviceId = device->id == mBuiltInKeyboardId ? 0 : device->id;
            event->type = DEVICE_ADDED;
            event += 1;
            mNeedToSendFinishedDeviceScan = true;
            if (--capacity == 0) break; // 如果缓冲区已满，则退出循环
        }
         // e、扫描完成会产生 FINISHED_DEVICE_SCAN 事件
        if (mNeedToSendFinishedDeviceScan) {
            mNeedToSendFinishedDeviceScan = false;
            event->when = now;
            event->type = FINISHED_DEVICE_SCAN;
            event += 1;
            if (--capacity == 0) break; // 如果缓冲区已满，则退出循环
        }
        // ② 处理未被 InputReader 取走的输入事件与设备事件
        bool deviceChanged = false;
        while (mPendingEventIndex < mPendingEventCount) {
            // 取出 epoll 事件并根据事件类型做出相应处理
            const struct epoll_event& eventItem = mPendingEventItems[mPendingEventIndex++];
            // inotify 事件，设置 mPendingINotify 为 true，后面根据此标记位读取
            // notify fd 中的事件，执行加载或卸载设备的操作
            if (eventItem.data.u32 == EPOLL_ID_INOTIFY) {
                if (eventItem.events & EPOLLIN) {
                    mPendingINotify = true;
                }
                continue;
            }
            // 管道读端有数据可读事件，则设置 awoken 为 true，后面会根据此标记跳出外
            // 层循环，即无论 getEvents() 是否读到事件，都不调用 epoll_wait() 等待
            if (eventItem.data.u32 == EPOLL_ID_WAKE) {
                if (eventItem.events & EPOLLIN) {
                    awoken = true;
                    char buffer[16];
                    ssize_t nRead;
                    do {
                        nRead = read(mWakeReadPipeFd, buffer, sizeof(buffer));
                    } while ((nRead == -1 && errno == EINTR) || nRead == sizeof(buffer));
                }
                continue;
            }
            // eventItem.data.u32 字段存储的是设备 id
            ssize_t deviceIndex = mDevices.indexOfKey(eventItem.data.u32);
            // 未知设备，跳过继续循环
            if (deviceIndex < 0) continue;
            Device* device = mDevices.valueAt(deviceIndex);
            if (eventItem.events & EPOLLIN) {
                // 从设备 fd 中读取原始事件
                int32_t readSize = read(device->fd, readBuffer,
                        sizeof(struct input_event) * capacity);
                // 返回 0 表示无事件，负数表示出错了
                if (readSize == 0 || (readSize < 0 && errno == ENODEV)) {
                    // Device was removed before INotify noticed.
                    deviceChanged = true;
                    closeDeviceLocked(device);
                } else if (readSize < 0) {
                    // 出错了
                } else if ((readSize % sizeof(struct input_event)) != 0) {
                    // 事件不完整？
                } else {
                    int32_t deviceId = device->id == mBuiltInKeyboardId ? 0 : device->id;
                    // 准备遍历获取原始事件 input_event 并加工成 RawEvent
                    size_t count = size_t(readSize) / sizeof(struct input_event);
                    for (size_t i = 0; i < count; i++) {
                        struct input_event& iev = readBuffer[i];
                        if (event->when >= now + 10 * 1000000000LL) {
                            // Double-check.  Time may have moved on.
                            nsecs_t time = systemTime(SYSTEM_TIME_MONOTONIC);
                            if (event->when > time) {
                                event->when = time;
                            }
                        }
                        event->deviceId = deviceId;
                        event->type = iev.type;
                        event->code = iev.code;
                        event->value = iev.value;
                        event += 1;
                        capacity -= 1;
                    }
                    if (capacity == 0) {
                        // 数组填充满了，跳出此次循环；下面会重置 mPendingEventIndex
                        // 等下次循环再读取事件
                        mPendingEventIndex -= 1;
                        break;
                    }
                }
            } else if (eventItem.events & EPOLLHUP) {
                deviceChanged = true;
                closeDeviceLocked(device);
            }
        }
        // ③ 设备节点发生增删事件，将 deviceChanged 设为 true 并重新执行循环体
        if (mPendingINotify && mPendingEventIndex >= mPendingEventCount) {
            mPendingINotify = false;
            readNotifyLocked();
            deviceChanged = true;
        }
        // 立即上报设备增删事件，从这里看增删事件的优先级是高于其他事件的
        if (deviceChanged) continue;

        // 如果此次 getEvents() 成功获取了一些事件或者要求唤醒 InputReader，则退出
        // 循环并结束此次调用，使 InputReader 可以立即处理事件
        if (event != buffer || awoken) break;

        // ④ 若此次循环没有取到事件，则执行 epoll_wait() 等待事件到来，并将事件存储
        // 到 mPendingEventItems 中且重置 mPendingEventIndex 为 0
        mPendingEventIndex = 0;
        mLock.unlock(); // release lock before poll, must be before release_wake_lock
        // 释放电源锁
        release_wake_lock(WAKE_LOCK_ID/*KeyEvents*/);
        
        // 调用 epoll_wait() 等待事件到来
        int pollResult = epoll_wait(mEpollFd, mPendingEventItems, EPOLL_MAX_EVENTS, timeoutMillis);
        // 获取电源锁，PARTIAL_WAKE_LOCK: 屏幕熄灭但 CPU 保持工作
        acquire_wake_lock(PARTIAL_WAKE_LOCK, WAKE_LOCK_ID/*KeyEvents*/);
        mLock.lock(); // reacquire lock after poll, must be after acquire_wake_lock
        if (pollResult == 0) { // 没有取到事件，跳出循环
            mPendingEventCount = 0;
            break;
        }
        if (pollResult < 0) { // 出错了
            mPendingEventCount = 0;
            if (errno != EINTR) usleep(100000);
        } else { // 取到事件了，进入下次循环
            mPendingEventCount = size_t(pollResult);
        }
    }
    // 返回读取事件的个数
    return event - buffer;
}
```

通过 getEvents() 方法可以提取到以下关键信息：

- mPendingEventItems 数组是一个 epoll 事件池，getEvents() 会优先从这个事件池中获取 
epoll 事件处理，并将读取到的事件返回给调用者；
- 当事件池无事件时，调用 epoll_wait() 等待事件到来并将事件存放到事件池中；
- getEvents() 的过程其实可以看做是消费事件池中事件的过程；
- 可将从 epoll_wait() 调用开始到将事件消费完毕的过程理解为 EventHub 的一个监听周期

当有 inotify 事件可以从 ifd 中读取时会产生一个 epoll 事件，EventHub 就知道设备节点
发生了增删操作。等事件池中的事件处理完毕之后，就会从 ifd 中读取 inotify 事件，进行设
备的加载/卸载操作，然后生成对应的 RawEvent 机构提返回给调用者。

getEvents() 包含原始事件读取、输入设备加载/卸载等操作

2、预处理事件 `InputReader::processEventsLocked`

InputReader::processEventsLocked() -> processEventsForDeviceLocked() -> 
InputDevice::process() -> InputMapper::process()

Device 结构体中：
EV_KEY：按键类型事件
EV_ABS：绝对坐标事件
EV_REL：相对坐标事件
EV_SW：开关类型事件

```cpp
void InputReader::processEventsLocked(const RawEvent* rawEvents, size_t count) {
    // 遍历所有事件
    for (const RawEvent* rawEvent = rawEvents; count;) {
        int32_t type = rawEvent->type;
        size_t batchSize = 1;
        // 根据事件类型区分是增删事件还是原始输入事件
        if (type < EventHubInterface::FIRST_SYNTHETIC_EVENT) {
            int32_t deviceId = rawEvent->deviceId;
            while (batchSize < count) {
                if (rawEvent[batchSize].type >= EventHubInterface::FIRST_SYNTHETIC_EVENT
                        || rawEvent[batchSize].deviceId != deviceId) {
                    break;
                }
                batchSize += 1;
            }
            // 批处理某一设备的一批事件
            processEventsForDeviceLocked(deviceId, rawEvent, batchSize);
        } else { // 设备的增删事件
            switch (rawEvent->type) {
            case EventHubInterface::DEVICE_ADDED:
                addDeviceLocked(rawEvent->when, rawEvent->deviceId);
                break;
            case EventHubInterface::DEVICE_REMOVED:
                removeDeviceLocked(rawEvent->when, rawEvent->deviceId);
                break;
            case EventHubInterface::FINISHED_DEVICE_SCAN:
                handleConfigurationChangedLocked(rawEvent->when);
                break;
            default:
                ALOG_ASSERT(false); // can't happen
                break;
            }
        }
        count -= batchSize;
        rawEvent += batchSize;
    }
}
```

```cpp
void InputReader::processEventsForDeviceLocked(int32_t deviceId,
    const RawEvent* rawEvents, size_t count) {
    // 根据 deviceId 找到 index
    ssize_t deviceIndex = mDevices.indexOfKey(deviceId);
    if (deviceIndex < 0) return;
    // 根据 index 获取 Device 对象
    InputDevice* device = mDevices.valueAt(deviceIndex);
    if (device->isIgnored()) return;
    // 调用 Device::process() 处理事件
    device->process(rawEvents, count);
}
```

```cpp
void InputDevice::process(const RawEvent* rawEvents, size_t count) {
    size_t numMappers = mMappers.size();
    for (const RawEvent* rawEvent = rawEvents; count != 0; rawEvent++) {
        // ... 其他处理
        for (size_t i = 0; i < numMappers; i++) {
            // mMappers 是 InputDevice 中的一个 list
            InputMapper* mapper = mMappers[i];
            // 调用 InputMapper 处理 事件
            mapper->process(rawEvent);
        }
        --count;
    }
}
```

通过 InputMapper 处理后的事件就可以提交给 InputDispatcher 来进行分发了

3、通知 dispatcher 进行分发

执行完 `mQueuedListener->flush()` 后，工作重心将从 InputReader 转移到 InputDispatcher

这是为什么呢？看下面：
```cpp
// InputManager 实例化时
mDispatcher = new InputDispatcher(dispatcherPolicy);
mReader = new InputReader(eventHub, readerPolicy, mDispatcher/*listener*/);
// InputReader 实例化时
mQueuedListener = new QueuedInputListener(listener/*mDispatcher*/);
// QueuedInputListener 实例化时
mInnerListener = innerListener/*mDispatcher*/;

// 所以 mQueuedLister->flush() ->
void QueuedInputListener::flush() {
    size_t count = mArgsQueue.size();
    for (size_t i = 0; i < count; i++) {
        NotifyArgs* args = mArgsQueue[i];
        // mInnerListeren 即 mDispatcher
        args->notify(mInnerListener);
        delete args;
    }
    mArgsQueue.clear();
}
```

NotifyArgs 有多个子类，会注意尝试让子类就行处理，如果不满足子类约定的事件类型则会立即
尝试下一个子类来处理：notifyConfigurationChanged、notifyKey、notifyMotion、notifySwitch、notifyDeviceReset


## InputDispatcher

InputDispatcher、InputDispatcherThread、InputChannel

### `InputDispatcher::notifyMotion()`

```cpp
void InputDispatcher::notifyMotion(const NotifyMotionArgs* args) {
    // 校验事件是否合法，若果非法则直接返回
    if (!validateMotionEvent(args->action, args->actionButton,
            args->pointerCount, args->pointerProperties)) return;

    uint32_t policyFlags = args->policyFlags;
    policyFlags |= POLICY_FLAG_TRUSTED;

    android::base::Timer t;
    // mPolicy 的实际执行者是 Java 层的 PhoneWindowManager，其实现了WindowManagerPolicy 接口
    mPolicy->interceptMotionBeforeQueueing(args->eventTime, /*byref*/ policyFlags);
    if (t.duration() > SLOW_INTERCEPTION_THRESHOLD) {
        // 方法执行时长超过 50ms 则打印一条 W 级别的警告日志
    }

    bool needWake;
    { // acquire lock
        mLock.lock();

        if (shouldSendMotionToInputFilterLocked(args)) {
            mLock.unlock();

            MotionEvent event;
            // 将 MotionEntry 转化成一个 MotionEvent 对象
            event.initialize(...);

            policyFlags |= POLICY_FLAG_FILTERED;
            // 转发给 Java 层去执行，返回 true 表示事件未被修改需要继续向下传递
            // 返回 false 表示事件被消费了，不需要向下传递
            if (!mPolicy->filterInputEvent(&event, policyFlags)) {
                return; // event was consumed by the filter
            }

            mLock.lock();
        }

        // 使用 NotifyMotionArgs 创建一个新的 MotionEntry 对象并放入派发队列中
        MotionEntry* newEntry = new MotionEntry(...);
        needWake = enqueueInboundEventLocked(newEntry);
        mLock.unlock();
    } // release lock
    // 唤醒 dispatcher 线程
    if (needWake) mLooper->wake();
}
```

事件入队 `enqueueInboundEventLocked()`

```cpp
bool InputDispatcher::enqueueInboundEventLocked(EventEntry* entry) {
    // 队列为空，表示 dispatcher 线程处于休眠状态，需要唤醒
    bool needWake = mInboundQueue.isEmpty();
    // 将事件放到队尾
    mInboundQueue.enqueueAtTail(entry);
    // ...
    return needWake;
}
```

mInboundQueue 为空时，dispatcher 线程将进入休眠状态

### InputDispatcher dispatch 线程循环

```cpp
void InputDispatcher::dispatchOnce() {
    nsecs_t nextWakeupTime = LONG_LONG_MAX;
    { // acquire lock
        AutoMutex _l(mLock);
        mDispatcherIsAliveCondition.broadcast();
        // 通过 dispatchOnceInnerLocked 进行事件分发，nextWakeupTime 表示下次分发
        // 执行的时间
        if (!haveCommandsLocked()) {
            dispatchOnceInnerLocked(&nextWakeupTime);
        }
        // 执行队列中的命令
        if (runCommandsLockedInterruptible()) {
            // 当把 nextWakeupTime 设置为 LONG_LONG_MIN 时将立即开始下次分发
            nextWakeupTime = LONG_LONG_MIN;
        }
    } // release lock

    // 如果有必要，让分发线程陷入休眠状态，由 nextWakeupTime 来指定休眠时间
    nsecs_t currentTime = now();
    int timeoutMillis = toMillisecondTimeoutDelay(currentTime, nextWakeupTime);
    // pollOnce() 的本质就是 epoll_wait()
    mLooper->pollOnce(timeoutMillis);
}
```

```cpp
void InputDispatcher::dispatchOnceInnerLocked(nsecs_t* nextWakeupTime) {
    nsecs_t currentTime = now();

    // Reset the key repeat timer whenever normal dispatch is suspended while the
    // device is in a non-interactive state.  This is to ensure that we abort a key
    // repeat if the device is just coming out of sleep.
    if (!mDispatchEnabled) {
        resetKeyRepeatLocked();
    }

    // If dispatching is frozen, do not process timeouts or try to deliver any new events.
    if (mDispatchFrozen) {
        return;
    }

    // Optimize latency of app switches.
    // Essentially we start a short timeout when an app switch key (HOME / ENDCALL) has
    // been pressed.  When it expires, we preempt dispatch and drop all other pending events.
    bool isAppSwitchDue = mAppSwitchDueTime <= currentTime;
    if (mAppSwitchDueTime < *nextWakeupTime) {
        *nextWakeupTime = mAppSwitchDueTime;
    }

    // Ready to start a new event.
    // If we don't already have a pending event, go grab one.
    if (!mPendingEvent) {
        if (mInboundQueue.isEmpty()) {
            if (isAppSwitchDue) {
                // The inbound queue is empty so the app switch key we were waiting
                // for will never arrive.  Stop waiting for it.
                resetPendingAppSwitchLocked(false);
                isAppSwitchDue = false;
            }

            // Synthesize a key repeat if appropriate.
            if (mKeyRepeatState.lastKeyEntry) {
                if (currentTime >= mKeyRepeatState.nextRepeatTime) {
                    mPendingEvent = synthesizeKeyRepeatLocked(currentTime);
                } else {
                    if (mKeyRepeatState.nextRepeatTime < *nextWakeupTime) {
                        *nextWakeupTime = mKeyRepeatState.nextRepeatTime;
                    }
                }
            }

            // 队列为空
            if (!mPendingEvent) {
                return;
            }
        } else {
            // 取出队列头
            mPendingEvent = mInboundQueue.dequeueAtHead();
        }

        // Poke user activity for this event.
        if (mPendingEvent->policyFlags & POLICY_FLAG_PASS_TO_USER) {
            pokeUserActivityLocked(mPendingEvent);
        }

        // Get ready to dispatch the event.
        resetANRTimeoutsLocked();
    }

    // Now we have an event to dispatch.
    // All events are eventually dequeued and processed this way, even if we intend to drop them.
    bool done = false;
    DropReason dropReason = DROP_REASON_NOT_DROPPED;
    if (!(mPendingEvent->policyFlags & POLICY_FLAG_PASS_TO_USER)) {
        dropReason = DROP_REASON_POLICY;
    } else if (!mDispatchEnabled) {
        dropReason = DROP_REASON_DISABLED;
    }

    if (mNextUnblockedEvent == mPendingEvent) {
        mNextUnblockedEvent = NULL;
    }
    if (mPendingEvent->type == EventEntry::TYPE_MOTION) {
        MotionEntry* typedEntry = static_cast<MotionEntry*>(mPendingEvent);
            if (dropReason == DROP_REASON_NOT_DROPPED && isAppSwitchDue) {
                dropReason = DROP_REASON_APP_SWITCH;
            }
            if (dropReason == DROP_REASON_NOT_DROPPED
                    && isStaleEventLocked(currentTime, typedEntry)) {
                dropReason = DROP_REASON_STALE;
            }
            if (dropReason == DROP_REASON_NOT_DROPPED && mNextUnblockedEvent) {
                dropReason = DROP_REASON_BLOCKED;
            }
            done = dispatchMotionLocked(currentTime, typedEntry,
                    &dropReason, nextWakeupTime);
    }// ...
    if (done) { // 分发完成，准备分发下一个事件
        if (dropReason != DROP_REASON_NOT_DROPPED) {
            dropInboundEventLocked(mPendingEvent, dropReason);
        }
        mLastDropReason = dropReason;
        releasePendingEventLocked();
        // 立即唤醒分发线程
        *nextWakeupTime = LONG_LONG_MIN;  // force next poll to wake up immediately
    }
}
```


## 参考资料

[《深入理解Android卷3（张大伟）第5章：深入理解 Android 输入系统》]()
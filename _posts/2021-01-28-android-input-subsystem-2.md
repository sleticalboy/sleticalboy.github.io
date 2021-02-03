---
layout: post
title: Android 输入子系统2：EventHub 工作原理
author: sleticalboy
date: 2021-01-28 10:56:13 +0800
category: android
tags: [android, framework]
---

涉及到的源代码及路径：<br>
`frameworks/native/services/inputflinger/EventHub.cpp`<br>
`frameworks/native/services/inputflinger/InputReader.cpp`<br>
`frameworks/native/services/inputflinger/InputDispatcher.cpp`<br>
`frameworks/native/libs/input/InputTransport.cpp`<br>
`frameworks/base/core/jni/android_view_InputChannel.cpp`<br>
`frameworks/base/core/jni/android_view_InputEventReceiver.cpp`<br>

承接上节，本文以 `InputReader::loopOnce()` 函数开始，从 InputReader 如何从 EventHub 
获取输入事件开始来揭示 EventHub 的工作原理。另外：InputReader、InputDispatcher、
EventHub 都属于 `inputflinger` 模块

## `InputReader::loopOnce()` 函数

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

整体来看 `loopOnce()` 函数主要处理以下三件事：
- 通过 getEvents() 从 EventHub 获取未处理的事件，这些事件分为两类：一类是原始输入事
件即从设备节点中读取出的原始事件；一类是设备事件即输入设备可用性变化事件
- 通过 processEventsLocked() 对事件进行预处理
- 预处理之后通过 flush() 将事件交给 InputDispatcher 进行分发

下面来依次进行分析

### 从 EventHub 获取原始输入事件

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

### 对事件进行预处理

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

### 将事件发布到 InputDispatcher

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

## `InputDispatcher::loopOnce()` 函数

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

## InputManagerService

IMS 初始化

## EventHub

事件中心

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

```
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
```
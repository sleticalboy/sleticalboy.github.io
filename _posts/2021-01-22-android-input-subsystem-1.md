---
layout: post
title: Android 输入子系统1：IMS 初始化与启动
author: sleticalboy
date: 2021-01-22 15:25:35 +0800
category: android
tags: [android, framework]
---

ServiceMananger.java
InputManagerService.java
com_android_server_input_InputManagerService.cpp
com_android_server_input_InputWindowHandle.cpp
com_android_server_input_InputApplicationHandle.cpp


InputManagerService 简称 IMS，WindowManagerService 简称 WMS

## Java 层 IMS 实例化与启动

SystemService#main() -> run() -> startOtherServices() 方法中启动 IMS 和 WMS，首先
先实例化 IMS，然后将 IMS 对象作为参数传递给 WMS，最后将依次启动 WMS 和 IMS

<init> -> nativeInit()

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

### `InputReader::loopOnce()`

EventHub、InputReader、InputReaderThread
从 EventHub 读取事件
预处理事件
通知 dispatcher 进行分发

```cpp
void InputReader::loopOnce() {
    // 1、从EventHub 获取事件，返回事件个数
    size_t count = mEventHub->getEvents(timeout, mEventBuffer, EVENT_BUFFER_SIZE/*256*/);
    // 2、预处理事件
    if (count) processEventsLocked(mEventBuffer, count);
    // 通知 dispatcher 进行分发
    mQueuedListener->flush();
}
```

1、从EventHub 获取事件，返回事件个数

```cpp
size_t EventHub::getEvents(int timeoutMillis, RawEvent* buffer,
    size_t bufferSize) {
    // 获取锁，防止其他线程进入
    AutoMutex _l(mLock);
    struct input_event readBuffer[bufferSize]; // 数组长度为 256
    RawEvent* event = buffer; // buffer 长度为 256
    size_t capacity = bufferSize; // 数组剩余可以装入多少个元素
    bool awoken = false; // 是否需要唤醒 dispatcher 端
    for (;;) {
        nsecs_t now = systemTime(SYSTEM_TIME_MONOTONIC);
        if (mNeedToReopenDevices) { // 如果需要重新打开设备则先关闭再打开
            mNeedToReopenDevices = false;
            closeAllDevicesLocked();
            mNeedToScanDevices = true;
            break; // return to the caller before we actually rescan
        }
        while (mClosingDevices) { // 移除设备时会产生 DEVICE_REMOCED 事件
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
        if (mNeedToScanDevices) { // 需要扫描设备并读取全部事件
            mNeedToScanDevices = false;
            scanDevicesLocked();
            mNeedToSendFinishedDeviceScan = true;
        }
        while (mOpeningDevices != NULL) { // 添加设备会产生 DEVICE_ADD 事件
            Device* device = mOpeningDevices;
            mOpeningDevices = device->next;
            event->when = now;
            event->deviceId = device->id == mBuiltInKeyboardId ? 0 : device->id;
            event->type = DEVICE_ADDED;
            event += 1;
            mNeedToSendFinishedDeviceScan = true;
            if (--capacity == 0) break; // 如果缓冲区已满，则退出循环
        }
        if (mNeedToSendFinishedDeviceScan) {
            mNeedToSendFinishedDeviceScan = false;
            event->when = now;
            event->type = FINISHED_DEVICE_SCAN;
            event += 1;
            if (--capacity == 0) break; // 如果缓冲区已满，则退出循环
        }
        // Grab the next input event.
        bool deviceChanged = false;
        while (mPendingEventIndex < mPendingEventCount) {
            const struct epoll_event& eventItem = mPendingEventItems[mPendingEventIndex++];
            if (eventItem.data.u32 == EPOLL_ID_INOTIFY) {
                if (eventItem.events & EPOLLIN) {
                    mPendingINotify = true;
                } else {
                    ALOGW("Received unexpected epoll event 0x%08x for INotify.", eventItem.events);
                }
                continue;
            }

            if (eventItem.data.u32 == EPOLL_ID_WAKE) {
                if (eventItem.events & EPOLLIN) {
                    ALOGV("awoken after wake()");
                    awoken = true;
                    char buffer[16];
                    ssize_t nRead;
                    do {
                        nRead = read(mWakeReadPipeFd, buffer, sizeof(buffer));
                    } while ((nRead == -1 && errno == EINTR) || nRead == sizeof(buffer));
                } else {
                    ALOGW("Received unexpected epoll event 0x%08x for wake read pipe.",
                            eventItem.events);
                }
                continue;
            }

            ssize_t deviceIndex = mDevices.indexOfKey(eventItem.data.u32);
            if (deviceIndex < 0) {
                ALOGW("Received unexpected epoll event 0x%08x for unknown device id %d.",
                        eventItem.events, eventItem.data.u32);
                continue;
            }

            Device* device = mDevices.valueAt(deviceIndex);
            if (eventItem.events & EPOLLIN) {
                int32_t readSize = read(device->fd, readBuffer,
                        sizeof(struct input_event) * capacity);
                if (readSize == 0 || (readSize < 0 && errno == ENODEV)) {
                    // Device was removed before INotify noticed.
                    deviceChanged = true;
                    closeDeviceLocked(device);
                } else if (readSize < 0) {
                } else if ((readSize % sizeof(struct input_event)) != 0) {
                } else {
                    int32_t deviceId = device->id == mBuiltInKeyboardId ? 0 : device->id;
                    size_t count = size_t(readSize) / sizeof(struct input_event);
                    for (size_t i = 0; i < count; i++) {
                        struct input_event& iev = readBuffer[i];
                        // Some input devices may have a better concept of the time
                        // when an input event was actually generated than the kernel
                        // which simply timestamps all events on entry to evdev.
                        // This is a custom Android extension of the input protocol
                        // mainly intended for use with uinput based device drivers.
                        if (iev.type == EV_MSC) {
                            if (iev.code == MSC_ANDROID_TIME_SEC) {
                                device->timestampOverrideSec = iev.value;
                                continue;
                            } else if (iev.code == MSC_ANDROID_TIME_USEC) {
                                device->timestampOverrideUsec = iev.value;
                                continue;
                            }
                        }
                        if (device->timestampOverrideSec || device->timestampOverrideUsec) {
                            iev.time.tv_sec = device->timestampOverrideSec;
                            iev.time.tv_usec = device->timestampOverrideUsec;
                            if (iev.type == EV_SYN && iev.code == SYN_REPORT) {
                                device->timestampOverrideSec = 0;
                                device->timestampOverrideUsec = 0;
                            }
                        }

                        // Use the time specified in the event instead of the current time
                        // so that downstream code can get more accurate estimates of
                        // event dispatch latency from the time the event is enqueued onto
                        // the evdev client buffer.
                        //
                        // The event's timestamp fortuitously uses the same monotonic clock
                        // time base as the rest of Android.  The kernel event device driver
                        // (drivers/input/evdev.c) obtains timestamps using ktime_get_ts().
                        // The systemTime(SYSTEM_TIME_MONOTONIC) function we use everywhere
                        // calls clock_gettime(CLOCK_MONOTONIC) which is implemented as a
                        // system call that also queries ktime_get_ts().
                        event->when = nsecs_t(iev.time.tv_sec) * 1000000000LL
                                + nsecs_t(iev.time.tv_usec) * 1000LL;

                        // Bug 7291243: Add a guard in case the kernel generates timestamps
                        // that appear to be far into the future because they were generated
                        // using the wrong clock source.
                        //
                        // This can happen because when the input device is initially opened
                        // it has a default clock source of CLOCK_REALTIME.  Any input events
                        // enqueued right after the device is opened will have timestamps
                        // generated using CLOCK_REALTIME.  We later set the clock source
                        // to CLOCK_MONOTONIC but it is already too late.
                        //
                        // Invalid input event timestamps can result in ANRs, crashes and
                        // and other issues that are hard to track down.  We must not let them
                        // propagate through the system.
                        //
                        // Log a warning so that we notice the problem and recover gracefully.
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
                        // The result buffer is full.  Reset the pending event index
                        // so we will try to read the device again on the next iteration.
                        mPendingEventIndex -= 1;
                        break;
                    }
                }
            } else if (eventItem.events & EPOLLHUP) {
                ALOGI("Removing device %s due to epoll hang-up event.",
                        device->identifier.name.string());
                deviceChanged = true;
                closeDeviceLocked(device);
            } else {
                ALOGW("Received unexpected epoll event 0x%08x for device %s.",
                        eventItem.events, device->identifier.name.string());
            }
        }

        // readNotify() will modify the list of devices so this must be done after
        // processing all other events to ensure that we read all remaining events
        // before closing the devices.
        if (mPendingINotify && mPendingEventIndex >= mPendingEventCount) {
            mPendingINotify = false;
            readNotifyLocked();
            deviceChanged = true;
        }

        // Report added or removed devices immediately.
        if (deviceChanged) {
            continue;
        }

        // Return now if we have collected any events or if we were explicitly awoken.
        if (event != buffer || awoken) {
            break;
        }

        // Poll for events.  Mind the wake lock dance!
        // We hold a wake lock at all times except during epoll_wait().  This works due to some
        // subtle choreography.  When a device driver has pending (unread) events, it acquires
        // a kernel wake lock.  However, once the last pending event has been read, the device
        // driver will release the kernel wake lock.  To prevent the system from going to sleep
        // when this happens, the EventHub holds onto its own user wake lock while the client
        // is processing events.  Thus the system can only sleep if there are no events
        // pending or currently being processed.
        //
        // The timeout is advisory only.  If the device is asleep, it will not wake just to
        // service the timeout.
        mPendingEventIndex = 0;
        mLock.unlock(); // release lock before poll, must be before release_wake_lock
        release_wake_lock(WAKE_LOCK_ID);
        int pollResult = epoll_wait(mEpollFd, mPendingEventItems, EPOLL_MAX_EVENTS, timeoutMillis);
        acquire_wake_lock(PARTIAL_WAKE_LOCK, WAKE_LOCK_ID);
        mLock.lock(); // reacquire lock after poll, must be after acquire_wake_lock
        if (pollResult == 0) {
            // Timed out.
            mPendingEventCount = 0;
            break;
        }
        if (pollResult < 0) {
            // An error occurred.
            mPendingEventCount = 0;
            // Sleep after errors to avoid locking up the system.
            // Hopefully the error is transient.
            if (errno != EINTR) {
                usleep(100000);
            }
        } else {
            // Some events occurred.
            mPendingEventCount = size_t(pollResult);
        }
    }
    // 返回读取事件的个数
    return event - buffer;
}
```

2、预处理事件

3、通知 dispatcher 进行分发

### ### `InputDispatcher::dispatchOnce()`
InputDispatcher、InputDispatcherThread、InputChannel
InputMapper
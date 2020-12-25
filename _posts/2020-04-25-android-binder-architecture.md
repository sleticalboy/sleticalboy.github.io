---
layout: post
title: Android binder 架构
author: sleticalboy
date: 2020-04-25 23:54:30
category: android
tags: [android, framework]
---

源码路径：

`frameworks/av/media/mediaserver/main_mediaserver.cpp`
`frameworks/native/libs/binder/ProcessState.cpp`
`frameworks/native/libs/binder/IServiceManager.cpp`
`frameworks/native/libs/binder/include/binder/IInterface.h`
---

## binder 概述

binder 是 Android 系统提供的一种 IPC 机制，Android 系统基本上可以看做是一个基于 binder 的
C/S 架构，binder 像网络一样把系统的各个部分紧密地连接在一起

![](/assets/android/binder-client-server-servicimanager.png)

## 从 mediaserver 看 binder

mediaserver 是一个由 c++ 实现的可执行程序，包括：
- AudioFlinger：音频中的核心服务
- AudioPolicyService：音频系统中关于音频策略的重要服务
- MediaPlayerService：多媒体系统中的重要服务
- CameraService：有关相机的重要服务

mediaserver main 函数源码
```cpp
int main(int argc __unused, char **argv __unused) {
    // ...
    // 1、获取一个 ProcessState 实例
    sp<ProcessState> proc(ProcessState::self());
    // 2、获取 ServiceMananger 实例
    sp<IServiceManager> sm(defaultServiceManager());
    // 3、初始化 MediaPlayer 服务
    MediaPlayerService::instantiate();
    // ....
    // 4、创建
    ProcessState::self()->startThreadPool();
    // 5、加入
    IPCThreadState::self()->joinThreadPool();
}
```

### ProcessState （1）

1、`ProcessState::self()`

```cpp
sp<ProcessState> ProcessState::self() {
    // 单例模式，即每个进程只有一个该对象
    Mutex::Autolock _l(gProcessMutex);
    if (gProcess != NULL) {
        return gProcess;
    }
    // 创建 ProcessState 对象，在构造器中打开 binder
    gProcess = new ProcessState("/dev/binder");
    return gProcess;
}
```

2、ProcessState 构造器

```cpp
ProcessState::ProcessState(const char *driver)
    : mDriverName(String8(driver))
    // 悄咪咪地打开 /dev/binder 设备，Android 内核为 IPC 专门设置的一个虚拟设备
    , mDriverFD(open_driver(driver))
    // 映射的是内存的起始地址
    , mVMStart(MAP_FAILED)
    , mThreadCountLock(PTHREAD_MUTEX_INITIALIZER)
    , mThreadCountDecrement(PTHREAD_COND_INITIALIZER)
    , mExecutingThreadsCount(0)
    , mMaxThreads(DEFAULT_MAX_BINDER_THREADS)
    , mStarvationStartTimeMs(0)
    , mManagesContexts(false)
    , mBinderContextCheckFunc(NULL)
    , mBinderContextUserData(NULL)
    , mThreadPoolStarted(false)
    , mThreadPoolSeq(1) {
    if (mDriverFD >= 0) {
        // BINDER_VM_SIZE 定义为 1*2014*1024 - 4096*2 = 1M - 8k
        // 执行完 mmap 之后，binder 驱动会分配一块内存来接收数据
        mVMStart = mmap(0, BINDER_VM_SIZE, PROT_READ, MAP_PRIVATE 
            | MAP_NORESERVE, mDriverFD, 0);
        // ...
    }
}
```

3、打开 binder 设备

```cpp
static int open_driver(const char *driver) {
    // 打开 /dev/binder 设备
    int fd = open(driver, O_RDWR | O_CLOEXEC);
    if (fd >= 0) {
        // 通过 ioctl 校验版本号
        int vers = 0;
        status_t result = ioctl(fd, BINDER_VERSION, &vers);
        // ...
        // 通过 ioctl 告诉 binder 驱动，fd 最多支持 15 个线程
        size_t maxThreads = DEFAULT_MAX_BINDER_THREADS/*15*/;
        result = ioctl(fd, BINDER_SET_MAX_THREADS, &maxThreads);
    }
    return fd;
}
```

**总结一下 ProcessState::self() 所做的事**：
- 打开 `/dev/binder` 设备，及打开与内核的 binder 驱动的通道；
- 对打开的文件句柄使用 `mmap`，让 binder 驱动分配一块内存来接收数据；
- 由于 ProcessState 是单例，因此每个进程只会打开设备一次

### defaultServiceManager() 函数 （2）

1、`IServiceManager.cpp::defaultServiceManager()`

```cpp
sp<IServiceManager> defaultServiceManager() {
    // 单例模式，若已初始化则直接返回
    if (gDefaultServiceManager != NULL) return gDefaultServiceManager;
    {
        // 自动锁，在程序返回时会自动释放
        AutoMutex _l(gDefaultServiceManagerLock);
        // 若对象未创建，则等待直到创建完成
        while (gDefaultServiceManager == NULL) {
            // interface_cast 这个宏是什么作用呢？见 4.2
            gDefaultServiceManager = interface_cast<IServiceManager>(
                // 此处传入的 NULL 参数非常关键，下面来分析一下
                ProcessState::self()->getContextObject(NULL));
            // 睡一会儿，休息休息
            if (gDefaultServiceManager == NULL) sleep(1);
        }
    }
    return gDefaultServiceManager;
}
```

2、`ProcessState::self()->getContextObject(NULL)`

```cpp
sp<IBinder> ProcessState::getContextObject(const sp<IBinder>& /*caller*/) {
    // 函数返回值是 IBinder
    return getStrongProxyForHandle(0/*NULL*/);
}
```

3、`ProcessState::self()->getStrongProxyForHandle()`

```cpp
sp<IBinder> ProcessState::getStrongProxyForHandle(int32_t handle) {
    sp<IBinder> result;
    AutoMutex _l(mLock);
    // 根据索引查询对应的句柄，若未找到则创建一个新的并返回
    handle_entry* e = lookupHandleLocked(handle);
    if (e != NULL) {
        // 初始状态下，e->binder 是 NULL
        IBinder* b = e->binder;
        if (b == NULL || !e->refs->attemptIncWeak(this)) {
            // 此时传入的 handle 为 0，对应的就是 ServiceManager
            if (handle == 0) {
                // ping 下，看看是不是挂掉了
                Parcel data;
                // IPCThreadState 稍后再分析
                status_t status = IPCThreadState::self()->transact(
                        0, IBinder::PING_TRANSACTION, data, NULL, 0);
                if (status == DEAD_OBJECT) return NULL;
            }
            // 创建 BpBinder（静态工厂），即 new BpBinder(handle)
            // 接下来分析 BpBinder 与 BBinder 
            b = BpBinder::create(handle);
            // 填充内容
            e->binder = b;
            if (b) e->refs = b->getWeakRefs();
            result = b;
        }
    }
    return result; // new BpBinder(0)
}
```

4、BpBinder 与 BBinder 是什么？

BpBinder 与 BBinder 都是 Android 中与 Binder 通信相关的代表，他们都由 IBinder 派生，如下
是他们的族谱：
![](这里欠一张图)

- BpBinder 是客户端用来与 Server 交互的代理类（p 可理解为 proxy）；
- BBinder 则是与 proxy 相对的一端，即 pxory 交互的目标（服务端代理）
- BpBinder 与 BBinder 一一对应，即 BpBinderA 只能与 BBinderA 对应

① 为什么在 `defaultServiceManager()` 中创建了 BpBinder 而不是 BBinder？
- 目前，我们还是 ServiceManager 的客户端，所以用 BpBinder 来进行交互

② BpBinder 如何与 BBinder 一一对应？
- 还记得上述代码中的 `handle` 么，binder 系统是用 `handle` 来进行标识的

③ `handle = 0` 时，表示什么？
- 0 在 binder 系统中有重要的含义，即 0 代表的就是 ServiceManager 所对应的 BBinder。可以理
解为 0 号服务就是 ServiceManager，0 号服务管理其他服务

4.1、`BpBinder` 构造

```cpp
BpBinder::BpBinder(int32_t handle, int32_t trackedUid)
    : mHandle(handle)
    , mAlive(1)
    , mObitsSent(0)
    , mObituaries(NULL)
    , mTrackedUid(trackedUid) {
    // 怎么感觉这里什么也没做呢？回想代码是从 defaultServiceManager() 中开始的，回头看下我
    // 们是不是有什么细节遗漏了？哦！原来是 interface_cast 这个宏
    extendObjectLifetime(OBJECT_LIFETIME_WEAK);
    IPCThreadState::self()->incWeakHandle(handle, this);
    // 最终返回到 defaultServiceManager() 中
}
```

5、被遗忘的宏 `interface_cast` 从 `IInterface.h` 中来

```cpp
template<typename INTERFACE>
inline sp<INTERFACE> interface_cast(const sp<IBinder>& obj) {
    return INTERFACE::asInterface(obj);
}

// 对 defaultServiceManager() 中的 interface_cast<IServiceManager>(obj) 展开如下：
inline sp<IServiceManager> interface_cast(const sp<IBinder>& obj) {
    // 兜兜转转现在又回到 IServiceManager 中了
    return IServiceManager::asInterface(obj);
}
```

6、千呼万唤始出来 `IServiceManager.cpp::asInterface`

- IServiceManager 定义了 ServiceManager 所需的一系列业务接口

```cpp
class IServiceManager : public IInterface {
public:
    // 重要的宏，稍后分析
    DECLARE_META_INTERFACE(ServiceManager)

    /* 以下是 ServiceManager 中所需的一系列业务接口 */
    // 从 ServiceManager 中查询服务
    virtual sp<IBinder> getService( const String16& name) const = 0;
    virtual sp<IBinder> checkService( const String16& name) const = 0;
    // 向 ServiceManager 添加/注册一个服务
    virtual status_t addService(const String16& name, const sp<IBinder>& service,
                                bool allowIsolated = false,
                                int dumpsysFlags = DUMP_FLAG_PRIORITY_DEFAULT) = 0;
    // 列出已注册的所有服务
    virtual Vector<String16> listServices(int dumpsysFlags = DUMP_FLAG_PRIORITY_ALL) = 0;
}

// 重要的宏，稍后分析
IMPLEMENT_META_INTERFACE(ServiceManager, "android.os.IServiceManager");
```

- 通过宏 `DECLARE_META_INTERFACE` 和宏 `IMPLEMENT_META_INTERFACE` 将业务与通信结合

```cpp
// 宏定义：声明
#define DECLARE_META_INTERFACE(INTERFACE)                               \
    static const ::android::String16 descriptor;                        \
    static ::android::sp<I##INTERFACE> asInterface(                     \
            const ::android::sp<::android::IBinder>& obj);              \
    virtual const ::android::String16& getInterfaceDescriptor() const;  \
    I##INTERFACE();                                                     \
    virtual ~I##INTERFACE();                                            \

// 宏定义：实现
#define IMPLEMENT_META_INTERFACE(INTERFACE, NAME)                       \
    const ::android::String16 I##INTERFACE::descriptor(NAME);           \
    const ::android::String16&                                          \
            I##INTERFACE::getInterfaceDescriptor() const {              \
        return I##INTERFACE::descriptor;                                \
    }                                                                   \
    ::android::sp<I##INTERFACE> I##INTERFACE::asInterface(              \
            const ::android::sp<::android::IBinder>& obj)               \
    {                                                                   \
        ::android::sp<I##INTERFACE> intr;                               \
        if (obj != NULL) {                                              \
            intr = static_cast<I##INTERFACE*>(                          \
                obj->queryLocalInterface(                               \
                        I##INTERFACE::descriptor).get());               \
            if (intr == NULL) {                                         \
                intr = new Bp##INTERFACE(obj);                          \
            }                                                           \
        }                                                               \
        return intr;                                                    \
    }                                                                   \
    I##INTERFACE::I##INTERFACE() { }                                    \
    I##INTERFACE::~I##INTERFACE() { }                                   \
```

- 将以上两个宏代入 ServiceManager 后展开如下：

```cpp
/////////////////////// 声明一些函数和变量
static const ::android::String16 descriptor;
static ::android::sp<IServiceManager> asInterface(
    const ::android::sp<::android::IBinder>& obj);
virtual const ::android::String16& getInterfaceDescriptor() const;
// 定义构造函数和析构函数
IServiceManager();
virtual ~IServiceManager();

/////////////////////// 实现上述声明的函数和变量
const ::android::String16 IServiceManager::descriptor("android.os.IServiceManager")
const ::android::String16& IServiceManager::getInterfaceDescriptor() const {
    // 即 android.os.IServiceManager
    return IServiceManager::descriptor
}
::android::sp<IServiceManager> IServiceManager::asInterface(
    const ::android::sp<::android::IBinder>& obj) {
    ::android::sp<IServiceManager> intr;
    if (obj != NULL) {
        intr = static_cast<IServiceManager*>(
            obj->queryLocalInterface(IServiceManager::descriptor).get());
        // 第一次肯定会进入以下分支
        if (intr == NULL) {
            // 创建 BpServiceManager（IServiceManager 的内嵌类）
            // 这里的 obj 是在 #3 中创建的 BpBinder(0)
            intr = new BpServiceManager(obj);
        }
    }
    return intr;
}
// 实现构造函数和析构函数
IServiceManager::IServiceManager() {}
IServiceManager::~IServiceManager() {}
```

7、IServiceManager 家族族谱如下：
![](欠图一张)

可知：

- IServiceManager、BpServiceManager 和 BnServiceManager 都与业务逻辑相关
- BnServiceManager 同时从 IServiceManager BBinder 派生，表示它可直接参与 Binder 通信
- BpServiceManager 虽然从 BpInterface 中派生，但是这条分支似乎与 BpBinder 没有关系
- BnServiceManager 是一个虚类，它的业务函数最终需要子类来实现


### 注册 MediaPlayerService （3）
### startThreadPool() 和 joinThreadPool() （4/5）

## service manager
### ServiceManager 原理
### service 注册
### ServiceManager 存在的意义

## service 以及 client

## 拓展思考
### binder 与线程的关系
### DeathRecipient
### 匿名 service


## 实现一个 native service
### native 层
### java 层

## 总结
### 除了 binder 之外，Android 中的其他 IPC 手段
pipe、socket

### binder 相较于其他 IPC 手段的优点

## 从一个 anr 实例看 binder 整体调用流程

```log
native: #02 pc 000000000005a844  /system/lib64/libbinder.so (android::IPCThreadState::talkWithDriver(bool)+260)
native: #03 pc 000000000005b718  /system/lib64/libbinder.so (android::IPCThreadState::waitForResponse(android::Parcel*, int*)+360)
native: #04 pc 000000000005b438  /system/lib64/libbinder.so (android::IPCThreadState::transact(int, unsigned int, android::Parcel const&, android::Parcel*, unsigned int)+176)
native: #05 pc 00000000000513e8  /system/lib64/libbinder.so (android::BpBinder::transact(unsigned int, android::Parcel const&, android::Parcel*, unsigned int)+72)
native: #06 pc 0000000000131558  /system/lib64/libandroid_runtime.so (android_os_BinderProxy_transact(_JNIEnv*, _jobject*, int, _jobject*, _jobject*, int)+152)
at android.os.BinderProxy.transactNative(Native method)
at android.os.BinderProxy.transact(Binder.java:1127)
at com.android.internal.app.IBatteryStats$Stub$Proxy.getStatisticsStream(IBatteryStats.java:1364)
at com.android.internal.os.BatteryStatsHelper.getStats(BatteryStatsHelper.java:1032)
at com.android.internal.os.BatteryStatsHelper.load(BatteryStatsHelper.java:1023)
at com.android.internal.os.BatteryStatsHelper.getStats(BatteryStatsHelper.java:258)
at com.android.settings.fuelgauge.BatteryInfo.getBatteryInfo(BatteryInfo.java:151)
at com.android.settings.fuelgauge.BatteryInfo.getBatteryInfo(BatteryInfo.java:145)
```

梳理下整体调用流程

```
客户端 -> 代理服务端 (Proxy)-> 服务端(Binder) -> native 层 Binder -> Binder 驱动
【java 层 Client 发起请求】BatteryStatsHelper#getStats() ->
【java 层服务 Proxy】IBatteryStats.Stub.Proxy#getStatisticsStream() ->
【java 层 Binder】BinderProxy#transact() -> BinderProxy#transactNative() ->
【native 层 BinderProxy】android_util_Binder.cpp::android_os_BinderProxy_transact() -> BpBinder.cpp::transact() -> 
【native 层 IPCThreadState】IPCThreadState.cpp::transact() -> IPCThreadState.cpp::waitForResponse() -> IPCThreadState.cpp::talkWithDriver() -> 
【native 层 Binde r驱动】通过 ioctl() 与 binder 驱动交互
```

## 参考资料
- 《深入理解Android卷1》（邓凡平）第六章：深入理解 Binder
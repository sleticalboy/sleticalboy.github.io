---
layout: post
title: Android binder 架构
author: sleticalboy
date: 2020-04-25 23:54:30
category: android
tags: [android, framework]
---

本文涉及到的源码路径：

`frameworks/av/media/mediaserver/main_mediaserver.cpp`
`frameworks/native/libs/binder/ProcessState.cpp`
`frameworks/native/libs/binder/IServiceManager.cpp`
`frameworks/native/libs/binder/include/binder/IInterface.h`
`frameworks/native/libs/binder/Binder.cpp`
`frameworks/native/libs/binder/include/binder/IBinder.h`
`frameworks/native/libs/binder/include/binder/BpBinder.h`
`frameworks/native/libs/binder/include/binder/Binder.h`
`android/bionic/libc/kernel/uapi/linux/android/binder.h`
`frameworks/native/cmds/servicemanager/service_manager.c`
`frameworks/native/cmds/servicemanager/binder.c`
`frameworks/av/media/libmedia/IMediaDeathNotifier.cpp`
`frameworks/av/media/libmediaplayerservice/MediaPlayerService.cpp`

## binder 概述

binder 是 Android 系统提供的一种 IPC 机制，Android 系统基本上可以看做是一个基于 binder 的
C/S 架构，binder 像网络一样把系统的各个部分紧密地连接在一起

![binder-c-s-sm](/assets/android/binder-client-server-servicimanager.png)

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
![ibinder-family](/assets/android/bind-ibinder-family.png)

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
![iservicemanager-family](/assets/android/binder-iservicemanager-family.png)

可知：

- IServiceManager、BpServiceManager 和 BnServiceManager 都与业务逻辑相关
- BnServiceManager 同时从 IServiceManager BBinder 派生，表示它可直接参与 Binder 通信
- BpServiceManager 虽然从 BpInterface 中派生，但是这条分支似乎与 BpBinder 没有关系
- BnServiceManager 是一个虚类，它的业务函数最终需要子类来实现

7.1、`IServiceManager.cpp::BpServiceManager` 类

```cpp
class BpServiceManager : public BpInterface<IServiceManager> {
public:
    explicit BpServiceManager(const sp<IBinder>& impl)
        // 这里调用父类构造，impl 是 IBinder 类型与 Binder 相关，实际是 BpBinder 对象
        : BpInterface<IServiceManager>(impl) { }
        // 省略具体的业务函数: 
        // checkService(), addService(), getService(), listService()
}
```

7.2、`IInterface.h::BpInterface` 类

```cpp
template<typename INTERFACE>
inline BpInterface<INTERFACE>::BpInterface(const sp<IBinder>& remote)
    // 继续调用父类构造，其具体实现在 Binder.cpp 中
    : BpRefBase(remote) {
}
```

7.3、`Binder.cpp::BpRefBase` 类

```cpp
BpRefBase::BpRefBase(const sp<IBinder>& o)
    // 此处的 mRemote 即上面创建的 BpBinder(0)
    : mRemote(o.get()), mRefs(NULL), mState(0) {
    extendObjectLifetime(OBJECT_LIFETIME_WEAK);
    if (mRemote) {
        mRemote->incStrong(this);           // Removed on first IncStrong().
        mRefs = mRemote->createWeak(this);  // Held for our entire lifetime.
    }
    // 最终：BpServiceManager::mRemote 指向 BpBinder()
}
```

8、总结一下 `defaultServiceManager()` 函数

- 创建 BpBinder 对象，其 handle 值为 0
- 创建 BpServiceManager 对象，其 mRemote 指向 BpBinder(0)
- BpServiceManager 内部实现了 IServiceManager 中定义的业务接口

### 注册 MediaPlayerService （3）

1、`MediaPlayService.cpp::instantiate()`

```cpp
void MediaPlayerService::instantiate() {
    defaultServiceManager()->addService(
        String16("media.player"), new MediaPlayerService());
    // 即 BpServiceManager::addService()
}
```

1.1、中转站一 `IServiceManager.cpp::BpServiceManager::addService()` 函数

```cpp
virtual status_t addService(const String16& name, const sp<IBinder>& service,
                            bool allowIsolated, int dumpsysPriority) {
    // data 是要打包发送的数据，reply 是要接收的数据
    Parcel data, reply;
    data.writeInterfaceToken(IServiceManager::getInterfaceDescriptor());
    data.writeString16(name);
    data.writeStrongBinder(service);
    data.writeInt32(allowIsolated ? 1 : 0);
    data.writeInt32(dumpsysPriority);
    // 打包发送并接收数据
    status_t err = remote()->transact(ADD_SERVICE_TRANSACTION, data, &reply);
    // remote() 方法返回 mRemote 即 BpBinder 对象
    return err == NO_ERROR ? reply.readExceptionCode() : err;
}
```

1.2、中转站二 `BpBinder.cpp::transact()`

```cpp
status_t BpBinder::transact(uint32_t code, const Parcel& data, Parcel* reply,
    uint32_t flags) {
    if (mAlive) {
        // 把实际的苦活交给 IPCThreadState 来干，下面着重分析
        status_t status = IPCThreadState::self()->transact(
            mHandle, code, data, reply, flags);
        if (status == DEAD_OBJECT) mAlive = 0;
        return status;
    }
    return DEAD_OBJECT;
}

```

2、真正脚踏实地干活的 `IPCThreadState` 类

2.1、线程中单例 `IPCThreadState::self()`

```cpp
IPCThreadState* IPCThreadState::self() {
    // 每个线程只会有一个实例
    if (gHaveTLS) {
restart:
        // 如果已经 set，则根据 key 获取相关内容
        const pthread_key_t k = gTLS;
        // TLS 全称为 Thread Local Storage，线程本地存储，顾名思义这是线程内部的私有空间，
        // 并不会与其他线程共享
        // linux 内核提供了 pthread_set/getspecific() 函数来设置/获取线程私有空间的内容
        // 所以有 get 的地方肯定有 set
        IPCThreadState* st = (IPCThreadState*)pthread_getspecific(k);
        if (st) return st;
        // 构造函数中会调用 set 方法
        return new IPCThreadState;
    }

    pthread_mutex_lock(&gTLSMutex);
    if (!gHaveTLS) {
        // 如果没有设置过，则先创建 key 再进行设置
        int key_create_value = pthread_key_create(&gTLS, threadDestructor);
        if (key_create_value != 0) {
            // 创建 key 失败，释放锁并返回 NULL
            pthread_mutex_unlock(&gTLSMutex);
            return NULL;
        }
        gHaveTLS = true;
    }
    pthread_mutex_unlock(&gTLSMutex);
    // 跳转到 set 的地方去，这个地方用的妙啊！
    goto restart;
}
```

2.2、`IPCThreadState` 构造函数

```cpp
IPCThreadState::IPCThreadState()
    : mProcess(ProcessState::self()),
      mStrictModePolicy(0),
      mLastTransactionBinderFlags(0) {
    // 有 get 必有 set，Android 诚不我欺
    pthread_setspecific(gTLS, this);
    clearCaller();
    // mIn 和 mOut 是两个 Parcel 类型的对象
    // mIn 可以看做接收来自 Binder 数据的缓冲区
    // mOut 可以看做发送数据到 Binder 的缓冲区
    mIn.setDataCapacity(256);
    mOut.setDataCapacity(256);
}
```

2.3、马不停蹄的 `transact()` 函数

```cpp
status_t IPCThreadState::transact(int32_t handle, uint32_t code,
    const Parcel& data, Parcel* reply, uint32_t flags) {
    status_t err;

    flags |= TF_ACCEPT_FDS;

    // BR_ 开头的是回复消息，定义在 binder_driver_return_protocol 枚举中
    // BC_ 开头的是发送消息，定义在 binder_driver_command_protocol 枚举中
    // 向 binder 发送数据
    err = writeTransactionData(BC_TRANSACTION, flags, handle, code, data, NULL);

    if (err != NO_ERROR) {
        if (reply) reply->setError(err);
        return (mLastError = err);
    }

    // TF_ONE_WAY 这个是什么东东？
    if ((flags & TF_ONE_WAY) == 0) {
        if (reply) {
            // 接收 binder 返回的数据
            err = waitForResponse(reply);
        } else {
            Parcel fakeReply;
            err = waitForResponse(&fakeReply);
        }
    } else {
        err = waitForResponse(NULL, NULL);
    }
    return err;
}

```

2.3.1、发送数据 `writeTransactionData()` 函数

```cpp
status_t IPCThreadState::writeTransactionData(int32_t cmd, uint32_t binderFlags,
    int32_t handle, uint32_t code, const Parcel& data, status_t* statusBuffer) {
    binder_transaction_data tr;

    // 将数据填充到 binder_transaction_data 结构体中
    tr.target.ptr = 0; /* Don't pass uninitialized stack data to a remote process */
    // handle 值传递给 target，用来标识 target 端，0 表示 ServiceManager
    tr.target.handle = handle;
    tr.code = code;
    tr.flags = binderFlags;
    tr.cookie = 0;
    tr.sender_pid = 0;
    tr.sender_euid = 0;
    // 检查数据是否合法
    const status_t err = data.errorCheck();
    if (err == NO_ERROR) {
        // 继续填充数据
        tr.data_size = data.ipcDataSize();
        tr.data.ptr.buffer = data.ipcData();
        tr.offsets_size = data.ipcObjectsCount()*sizeof(binder_size_t);
        tr.data.ptr.offsets = data.ipcObjects();
    } else if (statusBuffer) {
        // TF_STATUS_CODE 又是什么东东
        tr.flags |= TF_STATUS_CODE;
        *statusBuffer = err;
        tr.data_size = sizeof(status_t);
        tr.data.ptr.buffer = reinterpret_cast<uintptr_t>(statusBuffer);
        tr.offsets_size = 0;
        tr.data.ptr.offsets = 0;
    } else {
        return (mLastError = err);
    }
    // 将数据填充到缓冲区等待发送，那实际发送数据是在哪里呢？
    mOut.writeInt32(cmd);
    mOut.write(&tr, sizeof(tr));
    return NO_ERROR;
}
```

2.3.2、接收数据 `waitForResponse()` 函数

```cpp
status_t IPCThreadState::waitForResponse(Parcel *reply,
    status_t *acquireResult) {
    uint32_t cmd;
    int32_t err;
    // 等待直到返回或者错误
    while (1) {
        // 重要的 talkViewDriver() 函数，直接与 binder 驱动进行交互
        if ((err=talkWithDriver()) < NO_ERROR) break;
        err = mIn.errorCheck();
        if (err < NO_ERROR) break;
        if (mIn.dataAvail() == 0) continue;
        // 接下来要执行的命令
        cmd = (uint32_t)mIn.readInt32();
        switch (cmd) {
            // ...
            default:
                // 执行命令
                err = executeCommand(cmd);
                if (err != NO_ERROR) goto finish;
                break;
        }
    }

finish:
    if (err != NO_ERROR) {
        if (acquireResult) *acquireResult = err;
        if (reply) reply->setError(err);
        mLastError = err;
    }
    return err;
}
```

2.3.3、`executeCommand()` 函数

```cpp
status_t IPCThreadState::executeCommand(int32_t cmd) {
    BBinder* obj;
    RefBase::weakref_type* refs;
    status_t result = NO_ERROR;

    switch ((uint32_t)cmd) {
        case BR_ERROR:
            result = mIn.readInt32();
            break;
        case BR_OK:
            break;
        // ...
        // 重点看这个，其他的先略过
        case BR_TRANSACTION: {
            binder_transaction_data tr;
            result = mIn.read(&tr, sizeof(tr));
            if (result != NO_ERROR) break;

            Parcel buffer;
            buffer.ipcSetDataReference(
                reinterpret_cast<const uint8_t*>(tr.data.ptr.buffer),
                tr.data_size,
                reinterpret_cast<const binder_size_t*>(tr.data.ptr.offsets),
                tr.offsets_size/sizeof(binder_size_t), freeBuffer, this);

            const pid_t origPid = mCallingPid;
            const uid_t origUid = mCallingUid;
            const int32_t origStrictModePolicy = mStrictModePolicy;
            const int32_t origTransactionBinderFlags = mLastTransactionBinderFlags;

            mCallingPid = tr.sender_pid;
            mCallingUid = tr.sender_euid;
            mLastTransactionBinderFlags = tr.flags;

            Parcel reply;
            status_t error;
            if (tr.target.ptr) {
                // 将 tr.target.ptr 强转为 RefBase::weakref_type 指针后调用 
                // attemptIncStrong() 方法，获取一个强引用
                if (reinterpret_cast<RefBase::weakref_type*>(
                        tr.target.ptr)->attemptIncStrong(this)) {
                    // 将 tr.cookie 强转为 BBinder 指针后调用 transact() 方法
                    error = reinterpret_cast<BBinder*>(tr.cookie)->transact(
                        tr.code, buffer, &reply, tr.flags);
                    // 将 tr.cookie 强转为 BBinder 指针后调用 decStrong() 方法减少一次强引用计数
                    reinterpret_cast<BBinder*>(tr.cookie)->decStrong(this);
                } else error = UNKNOWN_TRANSACTION;
            } else {
                // the_context_object 是 IPCThreadState 中定义的一个全局变量：
                // sp<BBinder> the_context_object;，可通过 setTheContextObject() 来设置
                error = the_context_object->transact(tr.code, buffer, &reply, tr.flags);
            }
            // 又又又又遇到了 TF_ONE_WAY
            if ((tr.flags & TF_ONE_WAY) == 0) {
                if (error < NO_ERROR) reply.setError(error);
                sendReply(reply, 0);
            }
            mCallingPid = origPid;
            mCallingUid = origUid;
            mStrictModePolicy = origStrictModePolicy;
            mLastTransactionBinderFlags = origTransactionBinderFlags;
        } break;
        // ...
        case BR_DEAD_BINDER: {
            // 收到驱动的指示：service 挂掉了，BpBinder 要做一些事儿了
            BpBinder *proxy = (BpBinder*)mIn.readPointer();
            // BpBinder 做的事儿在这，有趣的地方，稍后再看
            proxy->sendObituary();
            mOut.writeInt32(BC_DEAD_BINDER_DONE);
            mOut.writePointer((uintptr_t)proxy);
            } break;
        case BR_SPAWN_LOOPER:
            // 收到驱动的指示：要创建一个新的线程用来与 binder 通信
            mProcess->spawnPooledThread(false);
            break;
        // ...
    }
    return result;
}
```

2.4、与 binder 交互 `talkWithDriver()` 函数

```cpp
status_t IPCThreadState::talkWithDriver(bool doReceive) {
    if (mProcess->mDriverFD <= 0) {
        return -EBADF;
    }

    binder_write_read bwr;

    // Is the read buffer empty?
    const bool needRead = mIn.dataPosition() >= mIn.dataSize();

    // We don't want to write anything if we are still reading
    // from data left in the input buffer and the caller
    // has requested to read the next data.
    const size_t outAvail = (!doReceive || needRead) ? mOut.dataSize() : 0;

    // 结构体填充
    bwr.write_size = outAvail;
    bwr.write_buffer = (uintptr_t)mOut.data();

    // This is what we'll read.
    if (doReceive && needRead) {
        // 接收数据缓冲区填充，如果接收到数据就直接填充在 mIn 中
        bwr.read_size = mIn.dataCapacity();
        bwr.read_buffer = (uintptr_t)mIn.data();
    } else {
        bwr.read_size = 0;
        bwr.read_buffer = 0;
    }
    // Return immediately if there is nothing to do.
    if ((bwr.write_size == 0) && (bwr.read_size == 0)) return NO_ERROR;

    bwr.write_consumed = 0;
    bwr.read_consumed = 0;
    status_t err;
    do {
        // 通过 ioctl 与 binder 设备进行交互，暂时先到这里
        // 再向下深入的话需要去分析驱动层的源码了
        if (ioctl(mProcess->mDriverFD, BINDER_WRITE_READ, &bwr) >= 0)
            err = NO_ERROR;
        else 
            err = -errno;
        if (mProcess->mDriverFD <= 0) {
            err = -EBADF;
        }
    } while (err == -EINTR);

    if (err >= NO_ERROR) {
        if (bwr.write_consumed > 0) {
            if (bwr.write_consumed < mOut.dataSize())
                mOut.remove(0, bwr.write_consumed);
            else {
                mOut.setDataSize(0);
                processPostWriteDerefs();
            }
        }
        if (bwr.read_consumed > 0) {
            mIn.setDataSize(bwr.read_consumed);
            mIn.setDataPosition(0);
        }
        return NO_ERROR;
    }
    return err;
}
```

### startThreadPool() 和 joinThreadPool() （4/5）

1、`ProcessState.cpp::startThreadPool()` 函数

```cpp
void ProcessState::startThreadPool() {
    AutoMutex _l(mLock);
    // 如果未执行过才会执行以下分支
    if (!mThreadPoolStarted) {
        mThreadPoolStarted = true;
        spawnPooledThread(true);
    }
}
```

1.1、`ProcessState.cpp::spawnPooledThread()` 函数

```cpp
void ProcessState::spawnPooledThread(bool isMain) {
    // 此处的 isMain 为 true
    if (mThreadPoolStarted) {
        // 生成线程名，其格式为："Binder:%d_%X", pid, seq
        String8 name = makeBinderThreadName();
        // 创建 PoolThread 并执行
        sp<Thread> t = new PoolThread(isMain/*true*/);
        t->run(name.string());
    }
}
```

1.2、ProcessState 的内嵌类 PoolThread:

```cpp
class PoolThread : public Thread {
public:
    explicit PoolThread(bool isMain)
        // 调用父类，将值传递给 mIsMain(true) 
        : mIsMain(isMain) { }
    
protected:
    virtual bool threadLoop() {
        // mIsMain 为 true，最终调用到 IPCThreadState
        IPCThreadState::self()->joinThreadPool(mIsMain);
        return false;
    }    
    const bool mIsMain;
}
```

2、`IPCThreadState.cpp::joinThreadPool()` 函数

```cpp
void IPCThreadState::joinThreadPool(bool isMain) {
    // isMain 为 true, 此处写入 BC_ENTER_LOOPER 指令，进入循环
    mOut.writeInt32(isMain ? BC_ENTER_LOOPER : BC_REGISTER_LOOPER);
    status_t result;
    do {
        // 处理已经 dead 的 BBinder 对象
        processPendingDerefs();
        // 不停地获取并执行下一条指令
        result = getAndExecuteCommand();
        // ...
    } while (result != -ECONNREFUSED && result != -EBADF);
    // 退出循环
    mOut.writeInt32(BC_EXIT_LOOPER);
    talkWithDriver(false);
}
```

2.1、`IPCThreadState.cpp::getAndExecuteCommand()` 函数

```cpp
status_t IPCThreadState::getAndExecuteCommand() {
    status_t result;
    int32_t cmd;
    // 发送指令，读取请求
    result = talkWithDriver();
    if (result >= NO_ERROR) {
        size_t IN = mIn.dataAvail();
        if (IN < sizeof(int32_t)) return result;
        // 读取一条指令
        cmd = mIn.readInt32();
        pthread_mutex_lock(&mProcess->mThreadCountLock);
        mProcess->mExecutingThreadsCount++;
        if (mProcess->mExecutingThreadsCount >= mProcess->mMaxThreads &&
                mProcess->mStarvationStartTimeMs == 0) {
            mProcess->mStarvationStartTimeMs = uptimeMillis();
        }
        pthread_mutex_unlock(&mProcess->mThreadCountLock);
        // 执行命令，构成了循环调用
        result = executeCommand(cmd);

        pthread_mutex_lock(&mProcess->mThreadCountLock);
        mProcess->mExecutingThreadsCount--;
        if (mProcess->mExecutingThreadsCount < mProcess->mMaxThreads &&
                mProcess->mStarvationStartTimeMs != 0) {
            mProcess->mStarvationStartTimeMs = 0;
        }
        pthread_cond_broadcast(&mProcess->mThreadCountDecrement);
        pthread_mutex_unlock(&mProcess->mThreadCountLock);
    }
    return result;
}
```

**总结：**
- 1、从以上来看，有几个 Thread 在为 Service 服务呢？
  - startThreadPool 中启动的线程通过 joinThreadPool 读取 binder 设备，查看是否有请求
  - main 线程也调用 joinThreadPool 读取 binder 设备，查看是否有请求
- 2、由此可见，binder 设备是支持多线程操作的
- 3、Binder 通信和基于 Binder 通信的业务之间的关系：
  - Binder 是通信机制
  - 业务可以基于 Binder 通信，当然也可以使用其他的 IPC 手段
- 4、binder 通信和业务层的关系图如下：

![binder-transport-logic](/assets/android/binder-transport-logic.png)

## 服务大总管 service manager 

前面提到 defaultServiceMannager() 返回一个 BpServiceManager 对象，通过它可以把请求发送给
handle 值为 0 的目的端，即 BnServiceManager 来处理请求，但是源码中并没有这样一个类；然而系统
提供了一个 service_manager.c 程序，它完成的就是 BnServiceManager 的工作。

### ServiceManager 原理

1、`service_manager.c::main()` 函数

```cpp
int main(int argc, char** argv) {
    struct binder_state *bs;
    union selinux_callback cb;
    char *driver;
    if (argc > 1) {
        driver = argv[1];
    } else {
        driver = "/dev/binder";
    }
    // ①打开 binder 设备，mmap 大小为 128k
    bs = binder_open(driver, 128*1024);
    if (!bs) {
        // 打开失败，打印 log 并返回
        return -1;
    }
    // ②让自己成为大管家，是不是把自己的 handle 设置为 0 呢？
    if (binder_become_context_manager(bs)) {
        return -1;
    }
    
    // selinux 配置项
    cb.func_audit = audit_callback;
    selinux_set_callback(SELINUX_CB_AUDIT, cb);
    cb.func_log = selinux_log_callback;
    selinux_set_callback(SELINUX_CB_LOG, cb);
    sehandle = selinux_android_service_context_handle();
    selinux_status_open(true);

    if (sehandle == NULL) {
        abort();
    }
    if (getcon(&service_manager_context) != 0) {
        abort();
    }

    // ③开始干活儿，处理客户端发过来的请求
    // 参数 func 是一个函数指针，指向 svcmgr_handler 函数，用于解析客户端请求
    binder_loop(bs, svcmgr_handler/*binder_handler func*/);
    return 0;
}
```

2、打开 binder 设备：`service_manager.c::open_binder()`

```cpp
struct binder_state *binder_open(const char* driver, size_t mapsize) {
    struct binder_state *bs;
    //...
    // 打开设备，返回文件句柄
    bs->fd = open(driver, O_RDWR | O_CLOEXEC);
    // ...
    // 内存映射
    bs->mapsize = mapsize;
    bs->mapped = mmap(NULL, mapsize, PROT_READ, MAP_PRIVATE, bs->fd, 0);
    // ...
    return bs;
}
```

3、成为老大：`service_manager.c::binder_become_context_manager()`

```cpp
int binder_become_context_manager(struct binder_state *bs) {
    // 此处传递的参数是 0，指令是 BINDER_SET_CONTEXT_MGR
    return ioctl(bs->fd, BINDER_SET_CONTEXT_MGR, 0);
}
```

4、开始干活儿：`service_manager.c::binder_loop()`

```cpp
void binder_loop(struct binder_state *bs, binder_handler func) {
    int res;
    struct binder_write_read bwr;
    uint32_t readbuf[32];
    // 填充结构体参数
    bwr.write_size = 0;
    bwr.write_consumed = 0;
    bwr.write_buffer = 0;

    readbuf[0] = BC_ENTER_LOOPER;
    // 先执行一个 BC_ENTER_LOOPER 指令
    binder_write(bs, readbuf, sizeof(uint32_t));
    // 开始无限循环
    for (;;) {
        // 继续填充参数
        bwr.read_size = sizeof(readbuf);
        bwr.read_consumed = 0;
        bwr.read_buffer = (uintptr_t) readbuf;
        // 向 binder 驱动要个事情来做
        res = ioctl(bs->fd, BINDER_WRITE_READ, &bwr);
        if (res < 0) {
            break;
        }
        // 接收并解析请求，最终将调用 svcmgr_handler 函数
        res = binder_parse(bs, 0, (uintptr_t) readbuf, bwr.read_consumed, func);
        // ...
    }
}
```

4.1、解析请求：`service_manager.c::binder_parse()`

```cpp
int binder_parse(struct binder_state *bs, struct binder_io *bio,
                 uintptr_t ptr, size_t size, binder_handler func) {
    int r = 1;
    uintptr_t end = ptr + (uintptr_t) size;

    while (ptr < end) {
        uint32_t cmd = *(uint32_t *) ptr;
        ptr += sizeof(uint32_t);
        switch(cmd) {
        // ...
        case BR_TRANSACTION: {
            struct binder_transaction_data *txn = (struct binder_transaction_data *) ptr;
            // ...
            // 如果处理函数不为空
            if (func) {
                unsigned rdata[256/4];
                struct binder_io msg;
                struct binder_io reply;
                int res;

                bio_init(&reply, rdata, sizeof(rdata), 4);
                bio_init_from_txn(&msg, txn);
                // 处理请求
                res = func(bs, txn, &msg, &reply);
                // ...
            }
            break;
        }
        // ...
        }
    }
    return r;
}
```

5、处理请求：`service_manager.c::svcmgr_handler()`

```cpp
int svcmgr_handler(struct binder_state *bs,
                   struct binder_transaction_data *txn,
                   struct binder_io *msg,
                   struct binder_io *reply) {
    struct svcinfo *si;
    uint16_t *s;
    size_t len;
    uint32_t handle;
    uint32_t strict_policy;
    int allow_isolated;
    uint32_t dumpsys_priority;

    // BINDER_SERVICE_MANAGER 魔数，定义为 0
    if (txn->target.ptr != BINDER_SERVICE_MANAGER)
        return -1;

    if (txn->code == PING_TRANSACTION)
        return 0;

    // Equivalent to Parcel::enforceInterface(), reading the RPC
    // header with the strict mode policy mask and the interface name.
    // Note that we ignore the strict_policy and don't propagate it
    // further (since we do no outbound RPCs anyway).
    strict_policy = bio_get_uint32(msg);
    s = bio_get_string16(msg, &len);
    if (s == NULL) {
        return -1;
    }

    if ((len != (sizeof(svcmgr_id) / 2)) ||
        memcmp(svcmgr_id, s, sizeof(svcmgr_id))) {
        fprintf(stderr,"invalid id %s\n", str8(s, len));
        return -1;
    }

    if (sehandle && selinux_status_updated() > 0) {
        struct selabel_handle *tmp_sehandle = selinux_android_service_context_handle();
        if (tmp_sehandle) {
            selabel_close(sehandle);
            sehandle = tmp_sehandle;
        }
    }

    switch(txn->code) {
    case SVC_MGR_GET_SERVICE: // getService()
    case SVC_MGR_CHECK_SERVICE: // checkService()
        s = bio_get_string16(msg, &len);
        if (s == NULL) {
            return -1;
        }
        handle = do_find_service(s, len, txn->sender_euid, txn->sender_pid);
        if (!handle)
            break;
        bio_put_ref(reply, handle);
        return 0;

    case SVC_MGR_ADD_SERVICE: // addService()
        s = bio_get_string16(msg, &len);
        if (s == NULL) {
            return -1;
        }
        handle = bio_get_ref(msg);
        allow_isolated = bio_get_uint32(msg) ? 1 : 0;
        dumpsys_priority = bio_get_uint32(msg);
        if (do_add_service(bs, s, len, handle, txn->sender_euid, allow_isolated, dumpsys_priority,
                           txn->sender_pid))
            return -1;
        break;

    case SVC_MGR_LIST_SERVICES: { // listService()
        uint32_t n = bio_get_uint32(msg);
        uint32_t req_dumpsys_priority = bio_get_uint32(msg);

        if (!svc_can_list(txn->sender_pid, txn->sender_euid)) {
            return -1;
        }
        si = svclist;
        // walk through the list of services n times skipping services that
        // do not support the requested priority
        while (si) {
            if (si->dumpsys_priority & req_dumpsys_priority) {
                if (n == 0) break;
                n--;
            }
            si = si->next;
        }
        if (si) {
            bio_put_string16(reply, si->name);
            return 0;
        }
        return -1;
    }
    default:
        return -1;
    }
    bio_put_uint32(reply, 0);
    // 以上，实现了所有在 IServiceManager 中定义的业务函数
    return 0;
}
```

**总结：**

1、`svcmgr_handler` 函数实现了所有在 IServiceManager 中定义的业务函数

### service 注册

1、`service_manager.c::do_add_service()` 函数

```cpp
int do_add_service(struct binder_state *bs, const uint16_t *s, size_t len,
    uint32_t handle,uid_t uid, int allow_isolated, uint32_t dumpsys_priority,
    pid_t spid) {
    struct svcinfo *si;

    if (!handle || (len == 0) || (len > 127))
        return -1;

    // ①检查服务是否可以注册
    if (!svc_can_register(s, len, spid, uid)) {
        return -1;
    }
    // ②检查服务是否已存在，根据服务名的长度和名字是否相同来判断
    si = find_svc(s, len);
    if (si) {
        if (si->handle) {
            // 通知 service 已挂
            svcinfo_death(bs, si);
        }
        // 服务已存在，更新一下
        si->handle = handle;
    } else {
        si = malloc(sizeof(*si) + (len + 1) * sizeof(uint16_t));
        if (!si) {
            return -1;
        }
        // ③保存服务
        si->handle = handle;
        si->len = len;
        memcpy(si->name, s, (len + 1) * sizeof(uint16_t));
        si->name[len] = '\0';
        // service 退出的通知函数 svcinfo_death
        si->death.func = (void*) svcinfo_death;
        si->death.ptr = si;
        si->allow_isolated = allow_isolated;
        si->dumpsys_priority = dumpsys_priority;
        // 当前 service 的 next 指针指向表头
        si->next = svclist;
        // 保存 service 到表头
        svclist = si;
    }
    binder_acquire(bs, handle);
    binder_link_to_death(bs, handle, &si->death);
    return 0;
}
```

2、检查服务是否可以注册： `service_manager.c::svc_can_register()`

```cpp
static int svc_can_register(const uint16_t *name, size_t name_len, pid_t spid,
    uid_t uid) {
    const char *perm = "add";
    // 不允许 app 注册服务
    if (multiuser_get_app_id(uid) >= AID_APP) {
        return 0;
    }
    // 检查是否有某项权限（add/find）
    // 高版本是通过 selinux 来检查的
    // 低版本通过定义一个 allowed 数组来判断，如果没有达到 root 和 system 权限是无法添加的
    return check_mac_perms_from_lookup(spid, uid, perm, str8(name, name_len)) ? 1 : 0;
}
```

### ServiceManager 存在的意义

- 1、ServiceManager 能集中管理系统中的所有服务，能够施加权限控制，并不是所有的进程都可注册服务；
- 2、ServiceManager 支持通过字符串名称来查找对应的 service，有点像 DNS；
- 3、server 进程可能会挂掉，如果让每个 client 自己来检测的话压力会很大，现在只需向 ServiceManager
  查询一下就能够轻松知道

## service 以及它的 client

以 MediaPlayerService 和 它的 client 为例

### client 查询 service

一个 client 若想使用某个 service，就必须通过调用 ServiceManager 的 getService() 函数来查
询该 service。比如：IMediaDeathNotifier.cpp 中 getMediaPlayerService()

1、查询服务 `IMediaDeathNotifier.cpp::getMediaPlayerService()`

```cpp
const sp<IMediaPlayerService> IMediaDeathNotifier::getMediaPlayerService() {
    Mutex::Autolock _l(sServiceLock);
    if (sMediaPlayerService == 0) {
        sp<IServiceManager> sm = defaultServiceManager();
        sp<IBinder> binder;
        // 查询 media.player service, 如果还没注册上则每隔 0.5s 查询一次，直到注册成功
        do {
            // 想要与 service 通信，必须拿到一个 BpBinder 对象
            binder = sm->getService(String16("media.player"));
            if (binder != 0) {
                break;
            }
            usleep(500000); // 0.5 s
        } while (true);

        if (sDeathNotifier == NULL) {
            sDeathNotifier = new DeathNotifier();
        }
        // 注册服务死亡通知，用于服务挂掉时接收通知
        binder->linkToDeath(sDeathNotifier);
        // 调用 asInterface() 方法拿到 BpMediaPlayerService 对象之后，就能够使用其中的业
        // 务函数了，比如：createMetadataRetriever()/createMediaRecorder() 等，当然也
        // 仅仅是交给其打包转发而已，具体的实现在 BnMediaPlayerService
        sMediaPlayerService = interface_cast<IMediaPlayerService>(binder);
    }
    return sMediaPlayerService;
}
```

2、转发业务码：`BnMediaPlayerService::onTransact()`

```cpp
status_t BnMediaPlayerService::onTransact(uint32_t code, const Parcel& data,
    Parcel* reply, uint32_t flags) {
    switch (code) {
        case CREATE: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            sp<IMediaPlayerClient> client =
                interface_cast<IMediaPlayerClient>(data.readStrongBinder());
            audio_session_t audioSessionId = (audio_session_t) data.readInt32();
            // 子类要实现 create() 虚函数
            sp<IMediaPlayer> player = create(client, audioSessionId);
            reply->writeStrongBinder(IInterface::asBinder(player));
            return NO_ERROR;
        } break;
        case CREATE_MEDIA_RECORDER: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            const String16 opPackageName = data.readString16();
            // 子类要实现 createMediaRecorder() 虚函数
            sp<IMediaRecorder> recorder = createMediaRecorder(opPackageName);
            reply->writeStrongBinder(IInterface::asBinder(recorder));
            return NO_ERROR;
        } break;
        case CREATE_METADATA_RETRIEVER: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            // 子类要实现 createMetadataRetriever() 虚函数
            sp<IMediaMetadataRetriever> retriever = createMetadataRetriever();
            reply->writeStrongBinder(IInterface::asBinder(retriever));
            return NO_ERROR;
        } break;
        case ADD_BATTERY_DATA: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            uint32_t params = data.readInt32();
            // 子类要实现  addBatteryData() 虚函数
            addBatteryData(params);
            return NO_ERROR;
        } break;
        case PULL_BATTERY_DATA: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            // 子类要实现  pullBatteryData() 虚函数
            pullBatteryData(reply);
            return NO_ERROR;
        } break;
        case LISTEN_FOR_REMOTE_DISPLAY: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            const String16 opPackageName = data.readString16();
            sp<IRemoteDisplayClient> client(
                    interface_cast<IRemoteDisplayClient>(data.readStrongBinder()));
            if (client == NULL) {
                reply->writeStrongBinder(NULL);
                return NO_ERROR;
            }
            String8 iface(data.readString8());
            // 子类要实现 listenForRemoteDisplay() 虚函数
            sp<IRemoteDisplay> display(listenForRemoteDisplay(opPackageName, client, iface));
            reply->writeStrongBinder(IInterface::asBinder(display));
            return NO_ERROR;
        } break;
        case GET_CODEC_LIST: {
            CHECK_INTERFACE(IMediaPlayerService, data, reply);
            // 子类要实现 getCodecList() 虚函数
            sp<IMediaCodecList> mcl = getCodecList();
            reply->writeStrongBinder(IInterface::asBinder(mcl));
            return NO_ERROR;
        } break;
        default:
            return BBinder::onTransact(code, data, reply, flags);
    }
}
```

### service 工作

具体的业务逻辑是由 MediaPlayerService.cpp 来实现的，以 create() 为例来看一下

```cpp
sp<IMediaPlayer> MediaPlayerService::create(const sp<IMediaPlayerClient>& client,
        audio_session_t audioSessionId) {
    pid_t pid = IPCThreadState::self()->getCallingPid();
    int32_t connId = android_atomic_inc(&mNextConnId);

    // 创建 Client 对象
    sp<Client> c = new Client(this, pid, connId, client, audioSessionId,
            IPCThreadState::self()->getCallingUid());

    wp<Client> w = c;
    {
        Mutex::Autolock lock(mLock);
        // 记录 client
        mClients.add(w);
    }
    // 返回 client 引用
    return c;
}
```

**总结：**

- BpXxxService：client 端访问 service 时，service 端派出的代理；
- BnXxxService：service 端负责转发 service 代理发送的请求；
- XxxService：service 端真正实现业务逻辑的地方；

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
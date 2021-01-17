---
layout: post
title: Android binder 架构： java 层
author: sleticalboy
date: 2021-01-08 13:09:34 +0800
category: android
tags: [android, framework]
---

涉及到的源码及路径：

`frameworks/base/core/java/android/os/IBinder.java`<br/>
`frameworks/base/core/java/android/os/Binder.java`<br/>
`frameworks/base/core/java/android/os/IInterface.java`<br/>
`frameworks/base/core/java/com/android/internal/os/BinderInternal.java`<br/>
`frameworks/base/services/java/com/android/server/SystemServer.java`<br/>
`frameworks/base/services/core/java/com/android/server/am/ActivityManagerService.java`<br/>
`frameworks/base/services/core/java/com/android/server/SystemServiceManager.java`<br/>
`frameworks/base/core/java/android/os/IServiceManager.java`<br/>
`frameworks/base/core/java/android/os/ServiceManager.java`<br/>
`frameworks/base/core/java/android/os/ServiceManagerNative.java`<br/>
`frameworks/base/core/jni/android_util_Binder.cpp`<br/>
`frameworks/base/core/jni/android_os_Parcel.cpp`<br/>
`frameworks/base/core/jni/AndroidRuntime.cpp`

## Java 层 Binder 架构

![java binder arch](/assets/android/binder-java-arch.png)

- 系统定义了一个 IBinder 接口和其内部的 DeathRecipient 接口
- Binder 和 BinderProxy 分别实现了 IBinder 接口；Binder 作为服务端 Bn 的代表，而
BinderProxy 则作为服务端 Bp 的代表
- BinderInternal 类是仅供 Binder 架构使用的‘特供类’，其内部有一个 GcWatcher 类，
专门用于处理和 Binder 架构相关的垃圾回收工作
- Parcel 类用于承载数据通信的职责
- 总体来看，Java 层 Binder 和 native 层 Binder 是很相似的，可以看做是 native 层
的一个镜像

**理解 FLAG_ONEWAY 标记：**<br/>
- 此标记位用于 transact 方法：单方面调用，意味着调用者在调用之后立即返回，不需要
等待被调用方返回结果，仅用于调用者和被调用者处于不同的进程时
- native 层中的 Binder 调用基本都是阻塞调用
- Java 层可以使用此标记位实现‘非阻塞’调用，如果没有此标记位则是‘阻塞’调用，
会一直等待直到被调用方返回结果
- Java 层使用此标记位时一般都会给被调用方（server）注册一个回调，通过该回调告知
调用方（client）该请求的处理结果

## Java 层 Binder 初始化

Java 层 Binder 的需要借助 native 层 Binder 才能展开工作，因此一定要在 Java 层
Binder 正式开始工作之前建立与 native 层 Binder 的关系。在 Android 系统中，Java
世界初始化时期（`AndroidRuntime.cpp::start()`），系统会提前注册一些 JNI 函数，
其中 `android_util_Binder.cpp::register_android_os_Binder()` 专门用来负责建立起
该联系：

```cpp
int register_android_os_Binder(JNIEnv* env) {
    // 1、建立 Java Binder 和 native 层的关系
    if (int_register_android_os_Binder(env) < 0) return -1;
    // 2、建立 Java BinderInternal 和 native 层的关系
    if (int_register_android_os_BinderInternal(env) < 0) return -1;
    // 3、建立 Java BinderProxy 和 native 层的关系
    if (int_register_android_os_BinderProxy(env) < 0) return -1;
    // Log#e() 函数
    jclass clazz = FindClassOrDie(env, "android/util/Log");
    gLogOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    gLogOffsets.mLogE = GetStaticMethodIDOrDie(env, clazz, "e",
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I");
    // PercelFileDescriptor#<init> 函数
    clazz = FindClassOrDie(env, "android/os/ParcelFileDescriptor");
    gParcelFileDescriptorOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    gParcelFileDescriptorOffsets.mConstructor = 
        GetMethodIDOrDie(env, clazz, "<init>", "(Ljava/io/FileDescriptor;)V");
    // StrictMode#onBinderStrictModePolicyChange() 函数
    clazz = FindClassOrDie(env, "android/os/StrictMode");
    gStrictModeCallbackOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    gStrictModeCallbackOffsets.mCallback = GetStaticMethodIDOrDie(env, clazz,
            "onBinderStrictModePolicyChange", "(I)V");
    // Thread#dispatchUncaughtException() 函数
    clazz = FindClassOrDie(env, "java/lang/Thread");
    gThreadDispatchOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    gThreadDispatchOffsets.mDispatchUncaughtException = GetMethodIDOrDie(env, clazz,
            "dispatchUncaughtException", "(Ljava/lang/Throwable;)V");
    // Thread#currentThread() 函数
    gThreadDispatchOffsets.mCurrentThread = GetStaticMethodIDOrDie(env, clazz,
            "currentThread", "()Ljava/lang/Thread;");
    return 0;
}
```

### 建立 Java Binder 和 native 层的关系

```cpp
// 用于存放 Java 层 Binder 类在 native 层中使用到的信息
static struct bindernative_offsets_t {
    jclass mClass; // android.os.Binder class
    jmethodID mExecTransact; // execTransact() method
    jfieldID mObject; // Object state.
} gBinderOffsets;
const char* const kBinderPathName = "android/os/Binder";
// Java Binder 类中的 native 函数
static const JNINativeMethod gBinderMethods[] = {
     /* name, signature, funcPtr */
    { "getCallingPid", "()I", (void*)android_os_Binder_getCallingPid },
    { "getCallingUid", "()I", (void*)android_os_Binder_getCallingUid },
    { "clearCallingIdentity", "()J", (void*)android_os_Binder_clearCallingIdentity },
    { "restoreCallingIdentity", "(J)V", (void*)android_os_Binder_restoreCallingIdentity },
    { "setThreadStrictModePolicy", "(I)V", (void*)android_os_Binder_setThreadStrictModePolicy },
    { "getThreadStrictModePolicy", "()I", (void*)android_os_Binder_getThreadStrictModePolicy },
    { "flushPendingCommands", "()V", (void*)android_os_Binder_flushPendingCommands },
    { "getNativeBBinderHolder", "()J", (void*)android_os_Binder_getNativeBBinderHolder },
    { "getNativeFinalizer", "()J", (void*)android_os_Binder_getNativeFinalizer },
    { "blockUntilThreadAvailable", "()V", (void*)android_os_Binder_blockUntilThreadAvailable }
};
static int int_register_android_os_Binder(JNIEnv* env) {
    // 找到 android.os.Binder 类
    jclass clazz = FindClassOrDie(env, kBinderPathName);
    gBinderOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    // Binder#execTransact() 方法
    gBinderOffsets.mExecTransact = GetMethodIDOrDie(env, clazz, "execTransact", "(IJJI)Z");
    // Binder#mObject 字段
    gBinderOffsets.mObject = GetFieldIDOrDie(env, clazz, "mObject", "J");
    // 注册 Binder 类中 native 函数的实现
    return RegisterMethodsOrDie(env, kBinderPathName, gBinderMethods,
        NELEM(gBinderMethods));
}
```

### 建立 Java BinderInternal 和 native 层的关系

```cpp
// Java BinderInternal 中的 native 函数
static const JNINativeMethod gBinderInternalMethods[] = {
     /* name, signature, funcPtr */
    { "getContextObject", "()Landroid/os/IBinder;", (void*)android_os_BinderInternal_getContextObject },
    { "joinThreadPool", "()V", (void*)android_os_BinderInternal_joinThreadPool },
    { "disableBackgroundScheduling", "(Z)V", (void*)android_os_BinderInternal_disableBackgroundScheduling },
    { "setMaxThreads", "(I)V", (void*)android_os_BinderInternal_setMaxThreads },
    { "handleGc", "()V", (void*)android_os_BinderInternal_handleGc },
    { "nSetBinderProxyCountEnabled", "(Z)V", (void*)android_os_BinderInternal_setBinderProxyCountEnabled },
    { "nGetBinderProxyPerUidCounts", "()Landroid/util/SparseIntArray;", (void*)android_os_BinderInternal_getBinderProxyPerUidCounts },
    { "nGetBinderProxyCount", "(I)I", (void*)android_os_BinderInternal_getBinderProxyCount },
    { "nSetBinderProxyCountWatermarks", "(II)V", (void*)android_os_BinderInternal_setBinderProxyCountWatermarks}
};
// 用于存放 Java 层 BinderInternal 类在 native 层中使用到的信息
static struct binderinternal_offsets_t {
    jclass mClass; // com.android.internal.os.BinderInternal class
    jmethodID mForceGc; // forceBinderGc() method
    jmethodID mProxyLimitCallback; // binderProxyLimitCallbackFromNative() method
} gBinderInternalOffsets;
const char* const kBinderInternalPathName = "com/android/internal/os/BinderInternal";
static int int_register_android_os_BinderInternal(JNIEnv* env) {
    // 找到 com.android.internal.os.BinderInteral 类
    jclass clazz = FindClassOrDie(env, kBinderInternalPathName);
    gBinderInternalOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    // BinderInternal#forceBinderGc() 方法
    gBinderInternalOffsets.mForceGc = GetStaticMethodIDOrDie(env, clazz,
        "forceBinderGc", "()V");
    // BinderInternal#binderProxyLimitCallbackFromNative() 方法
    gBinderInternalOffsets.mProxyLimitCallback = GetStaticMethodIDOrDie(env,
        clazz, "binderProxyLimitCallbackFromNative", "(I)V");
    // 注册回调
    BpBinder::setLimitCallback(android_os_BinderInternal_proxyLimitcallback);
    // 注册 BinderInternal 中的 native 方法
    return RegisterMethodsOrDie(env, kBinderInternalPathName,
        gBinderInternalMethods, NELEM(gBinderInternalMethods));
}
```

### 建立 Java BinderProxy 和 native 层的关系

```cpp
// Java BinderProxy 中的 native 方法 
static const JNINativeMethod gBinderProxyMethods[] = {
     /* name, signature, funcPtr */
    {"pingBinder",          "()Z", (void*)android_os_BinderProxy_pingBinder},
    {"isBinderAlive",       "()Z", (void*)android_os_BinderProxy_isBinderAlive},
    {"getInterfaceDescriptor", "()Ljava/lang/String;", (void*)android_os_BinderProxy_getInterfaceDescriptor},
    {"transactNative",      "(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z", (void*)android_os_BinderProxy_transact},
    {"linkToDeath",         "(Landroid/os/IBinder$DeathRecipient;I)V", (void*)android_os_BinderProxy_linkToDeath},
    {"unlinkToDeath",       "(Landroid/os/IBinder$DeathRecipient;I)Z", (void*)android_os_BinderProxy_unlinkToDeath},
    {"getNativeFinalizer",  "()J", (void*)android_os_BinderProxy_getNativeFinalizer},
};
// 用于存放 Java 层 BinderProxy 类在 native 层中使用到的信息
static struct binderproxy_offsets_t {
    jclass mClass; // android.os.BinderProxy class
    jmethodID mGetInstance; // getInstance() method
    jmethodID mSendDeathNotice; // sendDeathNotice() method
    jmethodID mDumpProxyDebugInfo; // dumpProxyDebugInfo() method
    // BinderProxy#mNativeData 字段，指向 native 层 BinderProxyNativeData 的指针
    jfieldID mNativeData;
} gBinderProxyOffsets;
const char* const kBinderProxyPathName = "android/os/BinderProxy";
static int int_register_android_os_BinderProxy(JNIEnv* env) {
    // 找到 android.os.BinderProxy 类
    clazz = FindClassOrDie(env, kBinderProxyPathName);
    gBinderProxyOffsets.mClass = MakeGlobalRefOrDie(env, clazz);
    // BinderProxy#getInstance() 静态方法
    gBinderProxyOffsets.mGetInstance = GetStaticMethodIDOrDie(env, clazz,
        "getInstance", "(JJ)Landroid/os/BinderProxy;");
    // BinderProxy#sendDeathNotice() 静态方法
    gBinderProxyOffsets.mSendDeathNotice = GetStaticMethodIDOrDie(env, clazz,
        "sendDeathNotice", "(Landroid/os/IBinder$DeathRecipient;)V");
    // BinderProxy#dumpProxyDebugInfo() 静态方法
    gBinderProxyOffsets.mDumpProxyDebugInfo = GetStaticMethodIDOrDie(env, clazz,
        "dumpProxyDebugInfo", "()V");
    // BinderProxy#mNativeData 字段
    gBinderProxyOffsets.mNativeData = GetFieldIDOrDie(env, clazz, "mNativeData", "J");
    // 注册 BinderProxy 中的静态方法
    return RegisterMethodsOrDie(env, kBinderProxyPathName, gBinderProxyMethods,
        NELEM(gBinderProxyMethods));
}
```

### 建立 Java Parcel 和 native 层的关系

`android_os_Parcel.cpp::register_android_os_Parcel()`
```cpp
// 用于存放 Java 层 Parcel 类在 native 层中使用到的信息
static struct parcel_offsets_t {
    jclass clazz; // android.os.Parcel class
    jfieldID mNativePtr; // mNativePre field
    jmethodID obtain; // obtain() method
    jmethodID recycle; // recycle() method
} gParcelOffsets;
// Java Parcel 中的 native 方法
static const JNINativeMethod gParcelMethods[] = {
    // @CriticalNative
    {"nativeDataSize",            "(J)I", (void*)android_os_Parcel_dataSize},
    // @CriticalNative
    {"nativeDataAvail",           "(J)I", (void*)android_os_Parcel_dataAvail},
    // @CriticalNative
    {"nativeDataPosition",        "(J)I", (void*)android_os_Parcel_dataPosition},
    // @CriticalNative
    {"nativeDataCapacity",        "(J)I", (void*)android_os_Parcel_dataCapacity},
    // @FastNative
    {"nativeSetDataSize",         "(JI)J", (void*)android_os_Parcel_setDataSize},
    // @CriticalNative
    {"nativeSetDataPosition",     "(JI)V", (void*)android_os_Parcel_setDataPosition},
    // @FastNative
    {"nativeSetDataCapacity",     "(JI)V", (void*)android_os_Parcel_setDataCapacity},

    // @CriticalNative
    {"nativePushAllowFds",        "(JZ)Z", (void*)android_os_Parcel_pushAllowFds},
    // @CriticalNative
    {"nativeRestoreAllowFds",     "(JZ)V", (void*)android_os_Parcel_restoreAllowFds},

    {"nativeWriteByteArray",      "(J[BII)V", (void*)android_os_Parcel_writeByteArray},
    {"nativeWriteBlob",           "(J[BII)V", (void*)android_os_Parcel_writeBlob},
    // @FastNative
    {"nativeWriteInt",            "(JI)V", (void*)android_os_Parcel_writeInt},
    // @FastNative
    {"nativeWriteLong",           "(JJ)V", (void*)android_os_Parcel_writeLong},
    // @FastNative
    {"nativeWriteFloat",          "(JF)V", (void*)android_os_Parcel_writeFloat},
    // @FastNative
    {"nativeWriteDouble",         "(JD)V", (void*)android_os_Parcel_writeDouble},
    {"nativeWriteString",         "(JLjava/lang/String;)V", (void*)android_os_Parcel_writeString},
    {"nativeWriteStrongBinder",   "(JLandroid/os/IBinder;)V", (void*)android_os_Parcel_writeStrongBinder},
    {"nativeWriteFileDescriptor", "(JLjava/io/FileDescriptor;)J", (void*)android_os_Parcel_writeFileDescriptor},

    {"nativeCreateByteArray",     "(J)[B", (void*)android_os_Parcel_createByteArray},
    {"nativeReadByteArray",       "(J[BI)Z", (void*)android_os_Parcel_readByteArray},
    {"nativeReadBlob",            "(J)[B", (void*)android_os_Parcel_readBlob},
    // @CriticalNative
    {"nativeReadInt",             "(J)I", (void*)android_os_Parcel_readInt},
    // @CriticalNative
    {"nativeReadLong",            "(J)J", (void*)android_os_Parcel_readLong},
    // @CriticalNative
    {"nativeReadFloat",           "(J)F", (void*)android_os_Parcel_readFloat},
    // @CriticalNative
    {"nativeReadDouble",          "(J)D", (void*)android_os_Parcel_readDouble},
    {"nativeReadString",          "(J)Ljava/lang/String;", (void*)android_os_Parcel_readString},
    {"nativeReadStrongBinder",    "(J)Landroid/os/IBinder;", (void*)android_os_Parcel_readStrongBinder},
    {"nativeReadFileDescriptor",  "(J)Ljava/io/FileDescriptor;", (void*)android_os_Parcel_readFileDescriptor},

    {"openFileDescriptor",        "(Ljava/lang/String;I)Ljava/io/FileDescriptor;", (void*)android_os_Parcel_openFileDescriptor},
    {"dupFileDescriptor",         "(Ljava/io/FileDescriptor;)Ljava/io/FileDescriptor;", (void*)android_os_Parcel_dupFileDescriptor},
    {"closeFileDescriptor",       "(Ljava/io/FileDescriptor;)V", (void*)android_os_Parcel_closeFileDescriptor},

    {"nativeCreate",              "()J", (void*)android_os_Parcel_create},
    {"nativeFreeBuffer",          "(J)J", (void*)android_os_Parcel_freeBuffer},
    {"nativeDestroy",             "(J)V", (void*)android_os_Parcel_destroy},

    {"nativeMarshall",            "(J)[B", (void*)android_os_Parcel_marshall},
    {"nativeUnmarshall",          "(J[BII)J", (void*)android_os_Parcel_unmarshall},
    {"nativeCompareData",         "(JJ)I", (void*)android_os_Parcel_compareData},
    {"nativeAppendFrom",          "(JJII)J", (void*)android_os_Parcel_appendFrom},
    // @CriticalNative
    {"nativeHasFileDescriptors",  "(J)Z", (void*)android_os_Parcel_hasFileDescriptors},
    {"nativeWriteInterfaceToken", "(JLjava/lang/String;)V", (void*)android_os_Parcel_writeInterfaceToken},
    {"nativeEnforceInterface",    "(JLjava/lang/String;)V", (void*)android_os_Parcel_enforceInterface},

    {"getGlobalAllocSize",        "()J", (void*)android_os_Parcel_getGlobalAllocSize},
    {"getGlobalAllocCount",       "()J", (void*)android_os_Parcel_getGlobalAllocCount},

    // @CriticalNative
    {"nativeGetBlobAshmemSize",       "(J)J", (void*)android_os_Parcel_getBlobAshmemSize},
};
const char* const kParcelPathName = "android/os/Parcel";
int register_android_os_Parcel(JNIEnv* env) {
    // 找到 android.os.Percel 类
    jclass clazz = FindClassOrDie(env, kParcelPathName);
    gParcelOffsets.clazz = MakeGlobalRefOrDie(env, clazz);
    // 获取 Percel#mNativePtr 字段
    gParcelOffsets.mNativePtr = GetFieldIDOrDie(env, clazz, "mNativePtr", "J");
    // 获取 Percel#obtain() 静态方法
    gParcelOffsets.obtain = GetStaticMethodIDOrDie(env, clazz, "obtain", "()Landroid/os/Parcel;");
    // 获取 Percel#recycle() 方法
    gParcelOffsets.recycle = GetMethodIDOrDie(env, clazz, "recycle", "()V");
    // 注册 Parcel 类中的 native 方法
    return RegisterMethodsOrDie(env, kParcelPathName, gParcelMethods, NELEM(gParcelMethods));
}
```

### 小结

- 以上过成都是类似的，包括以下两方面内容：
  - 获取 Java 类中一些有用的 methodId 和 fieldId 存储起来，这说明 JNI 层会向上调
用到 Java 层中的函数或字段
  - 注册 Java 类中 native 函数的实现
- 框架的初始化其实就是提前获取一些 JNI 层使用的信息，比如类的成员函数/字段 id
等，这么做的好处是提前获取，等使用的时候就节省掉了 Binder 频繁调用时的查找时间

## ServiceManager#addService 方法源码分析

以 `ActivityManagerService(AMS)` 如何将自身添加到 `ServiceManager(SM)` 为例来分析<br/>

**代码调用流程如下**：
<pre>
SystemServer#main() -> run() -> startBootstrapService() ->
a, AMS#&lt;init&gt; // AMS 初始化 mActivityManagerService
b, AMS#setSystemProcess() -> // 从这里开始分析
SM#addService("activity", mActivityManagerService) 
...
</pre>

大致分为两个步骤来分析：
- AMS 如何将自身添加到 SM 中
- AMS 如何响应客户端的 Binder 请求

### AMS 将自己添加到 SM 中

1、`AMS#setSystemProcess()`

```java
public void setSystemProcess() {
    // 将 AMS 注册到 SM 中，服务名为 activity
    ServiceManager.addService(Context.ACTIVITY_SERVICE, this, /* allowIsolated= */ true,
        DUMP_FLAG_PRIORITY_CRITICAL | DUMP_FLAG_PRIORITY_NORMAL | DUMP_FLAG_PROTO);
    // ...
}
```

2、`SM#addService() & SM#getIServiceManager()`

```java
public static void addService(String name, IBinder service, boolean allowIsolated,
        int dumpPriority) {
    // 获取到 IServiceManager 并将服务注册到其中，其实就是将服务注册到 native
    // 层的 ServiceManager 中
    getIServiceManager().addService(name, service, allowIsolated, dumpPriority);
}

private static IServiceManager getIServiceManager() {
    if (sServiceManager != null) {
        return sServiceManager;
    }
    // 接下来分析 BinderInternal.getContextObject() 函数
    sServiceManager = ServiceManagerNative.asInterface(/*IBinder*/
        Binder.allowBlocking(BinderInternal.getContextObject()));
    // 这里的 asInterface() 方法与 native 层的 interface_cast 宏有异曲同工之处
    // 第 4 小节进行分析
    return sServiceManager;
}
```

3、`BinderInternal#getContextObject()`

3.1、BinderInternal#getContextObject() 是一个 native 函数，其实现为
`android_os_util_Binder.cpp::android_os_BinderInternal_getContextObject()`

```cpp
static jobject android_os_BinderInternal_getContextObject(JNIEnv* env, jobject clazz) {
    // 获取 native 层 ServiceManager 代理对象 BpServiceManager
    sp<IBinder> b = ProcessState::self()->getContextObject(NULL/*0*/);
    // 这里继续调用 javaObjectForIBinder() 函数利用 native 层 ServiceManager 的
    // 代理对象来创建一个 Java 层的 ServiceManager 代理对象
    return javaObjectForIBinder(env, b/*BpBinder*/);
}
```

3.2、`android_os_util_Binder.cpp::javaObjectForIBinder()`

```cpp
// If the argument is a JavaBBinder, return the Java object that was used to create it.
// Otherwise return a BinderProxy for the IBinder. If a previous call was passed the
// same IBinder, and the original BinderProxy is still alive, return the same BinderProxy.
jobject javaObjectForIBinder(JNIEnv* env, const sp<IBinder>& val) {
    // val 实际是 sp<BpServiceManager>
    if (val == NULL) return NULL;
    if (val->checkSubclass(&gBinderOffsets)) {
        // It's a JavaBBinder created by ibinderForJavaObject. Already has Java object.
        jobject object = static_cast<JavaBBinder*>(val.get())->object();
        LOGDEATH("objectForBinder %p: it's our own %p!\n", val.get(), object);
        return object;
    }

    // For the rest of the function we will hold this lock, to serialize
    // looking/creation/destruction of Java proxies for native Binder proxies.
    AutoMutex _l(gProxyLock);

    // gNativeDataCahe 为缓存数据
    BinderProxyNativeData* nativeData = gNativeDataCache;
    if (nativeData == nullptr) {
        // 缓存数据为 nullptr，创建对象
        nativeData = new BinderProxyNativeData();
    }
    // gNativeDataCache is now logically empty.
    // 调用 Java 层 BinderProxy#getInstance() 方法生成 BinderProxy 对象
    // 3.3 小节分析
    jobject object = env->CallStaticObjectMethod(gBinderProxyOffsets.mClass,
            gBinderProxyOffsets.mGetInstance, (jlong) nativeData, (jlong) val.get());
    if (env->ExceptionCheck()) {
        // In the exception case, getInstance still took ownership of nativeData.
        gNativeDataCache = nullptr;
        return NULL;
    }
    // 获取 Java 层 BinderProxy#mNativeData 字段，即 nativeData 指针
    BinderProxyNativeData* actualNativeData = getBPNativeData(env, object);
    if (actualNativeData == nativeData) {
        // New BinderProxy; we still have exclusive access.
        nativeData->mOrgue = new DeathRecipientList;
        nativeData->mObject = val;
        gNativeDataCache = nullptr;
        ++gNumProxies;
        if (gNumProxies >= gProxiesWarned + PROXY_WARN_INTERVAL) {
            gProxiesWarned = gNumProxies;
        }
    } else {
        // 首次调用时：
        // nativeData = new BinderProxyNativeData, gNativeDataCache = nullptr
        // 将 nativeData 缓存起来，下次使用
        gNativeDataCache = nativeData;
    }
    return object;
}
```

3.3、`BinderProxy#getInstance()`

```java
private static BinderProxy getInstance(long nativeData, long iBinder) {
    // nativeDate 是指向 native 层 BinderProxyNativeData 结构体的指针
    // iBinder 是指向 native 层 BpServiceManager 对象的指针
    BinderProxy result;
    try {
        // 查一下缓存中是否有 iBinder 指针对应的 Java 层 BinderProxy 对象
        result = sProxyMap.get(iBinder);
        if (result != null) {
            return result;
        }
        // 创建一个 BinderProxy 对象，并将 mNativeData 字段指向 native 层 
        // nativeData 指针
        result = new BinderProxy(nativeData);
    } catch (Throwable e) {
        // We're throwing an exception (probably OOME); don't drop nativeData.
        NativeAllocationRegistry.applyFreeFunction(
            NoImagePreloadHolder.sNativeFinalizer, nativeData);
        throw e;
    }
    // 为 BinderProxy 对象分配 native 内存，并与 Java 层的对象建立关联
    // registerNativeAllocation 函数内部使用到了 Reference 对象，猜测可能与 GC
    // 有关，这里不做详细分析
    NoImagePreloadHolder.sRegistry.registerNativeAllocation(result, nativeData);
    // The registry now owns nativeData, even if registration threw an exception.
    // 缓存数据
    sProxyMap.set(iBinder, result);
    return result;
}
```

3.4、`BinderInternal#getContextObject()` 方法小结：

- 通过 JNI 调用，创建一个 Java 层的 BinderProxy 对象；
- 通过 JNI 调用，将 BinderProxy 对象与 native 层的 BpProxy 对象建立关联，该
BpProxy 就是 BpServiceManager，其通信目标就是 ServiceManager

4、`ServiceManagerNative#asInterface()`

```java
static public IServiceManager asInterface(IBinder obj) {
    // obj 是一个 BinderProxy 对象的实例
    if (obj == null) {
        return null;
    }
    // descriptor = "android.os.IServiceManager" 与 native 层是保持一致的
    IServiceManager in = (IServiceManager)obj.queryLocalInterface(descriptor);
    if (in != null) {
        return in;
    }
    // 以 obj 为参数，创建 ServiceManagerProxy 对象，赋值给 mRemote 字段
    return new ServiceManagerProxy(obj);
}
```

5、`ServiceManagerProxy#addService()`

```java
public void addService(String name, IBinder service, boolean allowIsolated,
    int dumpPriority) throws RemoteException {
    Parcel data = Parcel.obtain();
    Parcel reply = Parcel.obtain();
    // descriptor = "android.os.IServiceManager"
    data.writeInterfaceToken(IServiceManager.descriptor);
    data.writeString(name); // service name
    // writeStrongBinder() 最终会调用 nativeWriteStrongBinder()，其具体实现在
    // android_os_Parcel.cpp::android_os_Parcel_writeStrongBinder() 中，在下一节
    // 进行分析
    data.writeStrongBinder(service); // service 对象（IBinder）
    data.writeInt(allowIsolated ? 1 : 0);
    data.writeInt(dumpPriority);
    // 调用 BinderProxy#transact() 函数
    mRemote.transact(ADD_SERVICE_TRANSACTION, data, reply, 0);
    reply.recycle();
    data.recycle();
}
```

将数据打包成 Parcel 对象之后发送给 remote 端

6、`BinderProxy#transact()`

该函数最终会调用到 `BinderProxy#transactNative()` 函数，该 函数为 native 函数，
其具体实现为 `android_util_Binder.cpp::android_os_BinderProxy_transact()`

```cpp
static jboolean android_os_BinderProxy_transact(JNIEnv* env, jobject obj,
        jint code, jobject dataObj, jobject replyObj, jint flags) { // throws RemoteException
    if (dataObj == NULL) {
        jniThrowNullPointerException(env, NULL);
        return JNI_FALSE;
    }
    // 将 Java 层 Parcel 对象装换为 native 层 Parcel 对象
    Parcel* data = parcelForJavaObject(env, dataObj);
    if (data == NULL) {
        return JNI_FALSE;
    }
    Parcel* reply = parcelForJavaObject(env, replyObj);
    if (reply == NULL && replyObj != NULL) {
        return JNI_FALSE;
    }

    // getBPNativeData(env, obj) 获取指向 gNativeDataCache 的指针，然后获取
    // BinderProxyNativeData 中 mObject 成员，该字段指向 native 层 IBinder
    // 此处即 BpServiceManager 对象
    IBinder* target = getBPNativeData(env, obj)->mObject.get();
    if (target == NULL) {
        jniThrowException(env, "java/lang/IllegalStateException", "Binder has been finalized!");
        return JNI_FALSE;
    }

    // 通过 native BpBinder 对象将数据发送给 ServiceManager
    status_t err = target->transact(code, *data, reply, flags);

    if (err == NO_ERROR) {
        return JNI_TRUE;
    } else if (err == UNKNOWN_TRANSACTION) {
        return JNI_FALSE;
    }

    signalExceptionForError(env, obj, err, true /*canThrowRemoteException*/, data->dataSize());
    return JNI_FALSE;
}
```

### 揭开 `Parcel#writeStrongBinder()` 神秘的面纱

1、Parcel#writeStrongBinder() 最终会调用到 Parcel#nativeWriteStrongBinder()，这是
个 native 方法，实现为 `android_os_Parcel.cpp::android_os_Parcel_writeStrongBinder()`

```cpp
static void android_os_Parcel_writeStrongBinder(JNIEnv* env, jclass clazz,
    jlong nativePtr, jobject object) {
    // 此处的 object 为 Java 层的 Binder 对象
    Parcel* parcel = reinterpret_cast<Parcel*>(nativePtr);
    if (parcel != NULL) {
        // 接下来会调用 ibinderForJavaObject() 返回一个 native 层的 IBinder 对象
        const status_t err = parcel->writeStrongBinder(ibinderForJavaObject(env, object));
        if (err != NO_ERROR) {
            signalExceptionForError(env, clazz, err);
        }
    }
}
```

2、`android_util_Binder.cpp::ibinderForJavaObject()`

见名知意，此方法为 Java 层 Binder 生成一个 native 层 IBinder 对象，下面分析这里是
如何实现的：

```cpp
sp<IBinder> ibinderForJavaObject(JNIEnv* env, jobject obj) {
    // obj 为 Java 层的 Binder 对象
    if (obj == NULL) return NULL;
    // Instance of Binder?
    if (env->IsInstanceOf(obj, gBinderOffsets.mClass)) {
        // 通过 JNI 向上调用 Java 类中的字段得到 JavaBBinderHolder 对象
        JavaBBinderHolder* jbh = (JavaBBinderHolder*)
            env->GetLongField(obj, gBinderOffsets.mObject);
        // get() 方法，返回 JavaBBinder 对象
        // 注意：JavaBBinder 继承自 BBinder，而 BBinder 继承自 IBinder
        return jbh->get(env, obj);
    }
    // Instance of BinderProxy?
    if (env->IsInstanceOf(obj, gBinderProxyOffsets.mClass)) {
        // 直接取出
        return getBPNativeData(env, obj)->mObject;
    }
    return NULL;
}
```

从这里可以推断 Java 层 Binder#mObject 字段对应 native 层 JavaBBinderHolder 对象，
对象，那么 mObject 字段是何时赋值的呢？答案就在 Binder 的构造器中！

3、Java 层 Binder 构造

```java
public Binder() {
    // native 方法，实现为 android_os_Binder_getNativeBBinderHolder()
    mObject = getNativeBBinderHolder();
    NoImagePreloadHolder.sRegistry.registerNativeAllocation(this, mObject);
}
```

```cpp
static jlong android_os_Binder_getNativeBBinderHolder(JNIEnv* env,
    jobject clazz) {
    // 直接实例化一个 JavaBBinderHolder 对象返回给 Java 层 Binder#mObject 字段
    JavaBBinderHolder* jbh = new JavaBBinderHolder();
    return (jlong) jbh;
}
```

从类的名字来看，JavaBBinderHolder 只是一层外衣，真正的数据是其内部的 “JavaBBinder”
那么 JavaBBinderHolder 又是何方与 JavaBBinder 建立联系的呢？答案就在其 get() 方法

4、`android_util_Binder.cpp::JavaBBinderHolder::get()`

```cpp
sp<JavaBBinder> get(JNIEnv* env, jobject obj) {
    // obj 为 Java 层的 Binder 对象
    AutoMutex _l(mLock);
    sp<JavaBBinder> b = mBinder.promote();
    // 如果还没有与 JavaBBinder 建立关联，则创建 JavaBBinder 对象并赋值给 mBinder
    if (b == NULL) {
        // 简单分析 JavaBBinder 类
        b = new JavaBBinder(env, obj);
        mBinder = b;
    }
    // 已建立关联，直接返回
    return b;
}
```

5、`android_util_Binder.cpp::JavaBBinder`

JavaBBinder 继承自 BBinder

```cpp
class JavaBBinder : public BBinder {
private:
    JavaVM* const   mVM;
    jobject const   mObject;  // Java Binder 全局引用

public:
    JavaBBinder(JNIEnv* env, jobject /* Java Binder */ object)
        : mVM(jnienv_to_javavm(env)), mObject(env->NewGlobalRef(object)) {
        // new 一个全局引用并赋值给 mObject 字段
    }

    // 返回 Java Binder
    jobject object() const {
        return mObject;
    }

protected:
    virtual status_t onTransact(uint32_t code, const Parcel& data, Parcel* reply,
        uint32_t flags = 0) {
        // 执行 Binder#execTransact() 方法响应客户端 Binder 请求，下节分析
        jboolean res = env->CallBooleanMethod(mObject, gBinderOffsets.mExecTransact,
            code, reinterpret_cast<jlong>(&data), reinterpret_cast<jlong>(reply), flags);
        return res != JNI_FALSE ? NO_ERROR : UNKNOWN_TRANSACTION;
    }
};
```

### 小结

通过上面的分析，Java 层 SM#addService() 实际添加到 native 层 ServiceManager 的其
实并不是 AMS 本身，而是一个 JavaBBinder 对象，addService() 的本质是将此对象传递给
binder 驱动。

Java Binder、JavaBBinderHolder、JavaBBinder、BBinder 之间的关系如下：<br/>
![缺图一张](/assets/android/binder-java-b-binder-holder.png)<br/>
从上图我们可以看出：
- Java 层 Binder 通过 mObject 字段指向 native 层的 JavaBBinderHolder 对象；
- native 层 JavaBBinderHolder 又通过 mBinder 字段指向 native 层 JavaBBinder 对象；
- native 层 JavaBBinder 又通过 mObject 字段指向 Java 层的 Binder 对象；

**思考**：<br/>

- 为什么不直接让 Java 层的 Binder 对象指向 native 层的 JavaBBinder 对象呢？分析
上述三个类，发现 JavaBBinderHolder 中用到了 sp<T> 弱引用，因此可以猜测应该和内存
管理有关。
- Java 层添加到 native 层 ServiceManager 中的 service（Binder） 其实都对应着一个
native 层的 JavaBBinder。

## AMS 响应客户端的 Binder 请求

以 Activity#startActivity() 方法为例分析 AMS 如何响应客户端的 Binder 请求，具体调用
流程如下：
<pre>
========client========
ClientActivity#startActivity() ->
Activity#startActivity() ->
ContextImpl#startActivity() ->
Instrumentation#execStartActivity() ->
========service manager========
ActivityManager.getService().startActivity() ->
  1. ActivityManager.getService() -> IActivityManagerSingleton.get() ->
    android.util.Singleton.get() -> Singleton.create() ->
  2. return IActivityManager.Stub.asInterface(ServiceManager.getService("activity"))
    // JNI 调用从 service manager 中获取
    ServiceManager.getService("activity") => BinderProxy
  3. IActivityManager.Stub.asInterface(b) -> new IActivityManager.Stub.Proxy(b)
    mRemote => b => BinderProxy
------- java 层 --------
IActivityManager.Stub.Proxy().startActivity() ->
mRemote.transact(Stub.TRANSACTION_startActivity) ->
BinderProxy#transact() -> transactNative() ->
------- jni 层 --------
android_util_Binder.cpp::android_os_BinderProxy_transact() -> target::transact()
native IBinder::transact() -> BBinder::transact() -> Binder.cpp::transact() -> Binder.cpp::onTransact() ->
android_util_Binder.cpp::JavaBBinder::onTransact() ->
------- java 层 --------
Binder#execTransact() -> onTransact() ->
IActivitymanager.Stub#onTransact() -> onTransact() => TRANSACTION_startActivity
IActivityManager.Stub#onTransact$startActivity$() ->
========AMS========
ActivityManagerService#startActivity()
  ActivityManagerService 继承自IActivityManager.Stub.Proxy， 而 Proxy 又继承自 IActivityManager
</pre>

### 客户端发起 Binder 请求

当客户端 Activity 发起 startActivity() 请求时，最终会从 app 进程调用到 system_server
进程，不过在使用系统服务之前必须要先通过 SM 获取到该服务。

### 通过 SM 获取 AMS

系统获取 AMS 的过程就不详细分析了

```java
@Override
protected IActivityManager create() {
    // 这里返回的 IBinder 对象其实就是 BinderProxy
    final IBinder b = ServiceManager.getService("activity");
    // 这里实际创建的是 IActivityManager.Stub.Proxy() 对象，IActivityManager.Stub
    // 是抽象类并继承自 IActivityManager，其实际实现子类是 AMS
    // 这里的 ibinder 最终传给了 IActivityManager.Stub.Proxy 的 mRemote 字段
    return IActivityManager.Stub.asInterface(b);
}
```

### AMS 响应客户端请求

1、客户端发起的 startActivity() 调用最先到达 IActivityManager.Stub.Proxy#startActivity()，
然后通过调用 `mRemote.transact(Stub.TRANSACTION_startActivity)` 进行转发，那么下一
步会调用到 `BinderProxy#transact()` 方法，并进一步通过 transactNative() 调用到 native
层 `android_util_Binder.cpp::android_os_BinderProxy_transact()` 方法：

2、`android_util_Binder.cpp::android_os_BinderProxy_transact()`

```cpp
static jboolean android_os_BinderProxy_transact(JNIEnv* env, jobject obj,
        jint code, jobject dataObj, jobject replyObj, jint flags) { // throws RemoteException
    // ...
    // 这里获取到的是 JavaBBinder 对象，该对象继承自 native IBinder
    IBinder* target = getBPNativeData(env, obj)->mObject.get();
    // 此方法会调用父类 transact() 方法并最终调用 Binder.cpp::onTransact() 方法，
    // 这里其子类为 JavaBBinder，所以会调用 JavaBBinder::onTransact() 方法
    status_t err = target->transact(code, *data, reply, flags);
    // ...
    return JNI_FALSE;
}
```

3、`android_util_Binder.cpp::JavaBBinder::onTransact()`

```cpp
virtual status_t onTransact(uint32_t code, const Parcel& data, Parcel* reply,
    uint32_t flags = 0) {
    // 通过 JNI 向上调用 Java Binder#execTransact() 方法
    jboolean res = env->CallBooleanMethod(mObject, gBinderOffsets.mExecTransact,
        code, reinterpret_cast<jlong>(&data), reinterpret_cast<jlong>(reply), flags);
    // ....
    return res != JNI_FALSE ? NO_ERROR : UNKNOWN_TRANSACTION;
}
```

4、Java `Binder#execTransact()`

```java
private boolean execTransact(int code, long dataObj, long replyObj, int flags) {
    // 从 native Parcel 转换成 Java Parcel
    Parcel data = Parcel.obtain(dataObj);
    Parcel reply = Parcel.obtain(replyObj);
    boolean res;
    try {
        // 直接调用 onTransact() 方法，一般都是由子类实现，在 AIDL 中都是由
        // IXxx.Stub#onTransact() 来进行分发给实现类的各种业务调用，比如此处调用的
        // startActivity() 最终会调用到 AMS#startActivity()
        res = onTransact(code, data, reply, flags);
    } catch (RemoteException|RuntimeException e) {
        if ((flags & FLAG_ONEWAY) != 0) {
            if (e instanceof RemoteException) {
                Log.w(TAG, "Binder call failed.", e);
            } else {
                Log.w(TAG, "Caught a RuntimeException from the binder stub implementation.", e);
            }
        } else {
            // Clear the parcel before writing the exception
            reply.setDataSize(0);
            reply.setDataPosition(0);
            reply.writeException(e);
        }
        res = true;
    }
    // 释放资源
    reply.recycle();
    data.recycle();
    return res;
}
```

### 小结

通过以上的分析发现 Java 层 Binder 架构中 JavaBBinder 并不承担处理实际业务的职责；
- 当收到请求时，JavaBBinder 通过 JNI 向上调用其绑定的 Java Binder 对象的 execTransact();
- Java Binder#execTransact() 最终调用子类实现的 onTransact() 函数；
- 子类通过 onTransact() 函数将任务派发给最终的子类来完成

以下是 AMS 响应 Binder 请求的整个流程：
![ams-response-binder-request](/assets/android/binder-ams-response-request.png)

## 总结

![android-binder-arch](/assets/android/binder-java-natice-arch.png)

- 对于客户端的 BinderProxy 来讲，Java 层的 BinderProxy 在 native 层对应着一个 BpBinder
对象；凡是从 Java 层发出的请求，首先从 BinderProxy 传递到 native 层的 BpBinder，继而
由 BpBinder 将请求发送到 binder 驱动
- 对于代表服务端的 Service 来讲，Java 层的 Binder 在 native 层有一个 JavaBBinder 对
象；但 JavaBBinder 只起到中转作用，即把来自客户端的请求从 native 层传递到 Java 层
- 无论是 Java 层还是 native 层，自始至终都只有一个 ServiceManager

## 参考资料
- 《深入理解Android卷1》（邓凡平）第六章：深入理解 Binder
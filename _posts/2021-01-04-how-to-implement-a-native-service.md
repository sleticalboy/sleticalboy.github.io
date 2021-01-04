---
layout: post
title: 如何实现一个 native service
author: sleticalboy
date: 2021-01-04 20:53:51 +0800
category: android
tags: [android, framework]
---

## native 层实现

### 声明 service 业务接口

```cpp
#ifndef ANDROID_ITESTSERVICE_H
#define ANDROID_ITESTSERVICE_H

#include <binder/IInterface.h>
#include <binder/Parcel.h>

// 命名空间为 android
namespace android {

// 声明业务接口，子类实现接口处理具体业务
class ITest : public IInterface {
public:
    // !!一定不要忘记了这里!!
    DECLARE_META_INTERFACE(Test)

    // 子类实现以下接口处理业务函数
    virtual void write();
    virtual void read();
};

// BnTest 根据请求码 code 对客户端的请求进行转发，实际工作由 ITest 子类完成
class BnTest : public BnInterface<ITest> {
public:
    virtual status_t onTransact(uint32_t code, const Parcel &data,
                                Parcel *reply, uint32_t flags = 0);
};
} // namespace android
#endif // ANDROID_ITESTSERVICE_H
```

### 实现 service 业务方法

```cpp
// 定义 log tag, ALOGx() 中会用到
#define LOG_TAG "TestServer"

#include <binder/IPCThreadState.h>
#include <binder/IServiceManager.h>
#include <utils/Log.h>
#include "ITest.h"

namespace android {

const uint32_t CODE_WRITE = 0x10;
const uint32_t CODE_READ = 0x11;

class BpTest : public BpInterface<ITest> {
public:
    BpTest(const sp<IBinder> &impl)
            : BpInterface<ITest>(impl) {}

    // 与 ITest 中声明的业务函数同名，原因是 BpInterface 是多继承类 & 模板类，
    // 其原型为： template<typename INTERFACE>
    // class BpInterface : public INTERFACE, public BpRefBase {...}
    void write() override {
        Parcel data, reply;
        data.writeInterfaceToken(ITest::getInterfaceDescriptor());
        // 转发到 BnTest::onTransact()
        ALOGD("BpTest:: start transact %s cmd(%d)", "WRITE", CODE_WRITE);
        remote()->transact(CODE_WRITE, data, &reply);
    }

    void read() override {
        Parcel data, reply;
        data.writeInterfaceToken(ITest::getInterfaceDescriptor());
        // 转发到 BnTest::onTransact()
        ALOGD("BpTest:: start transact %s cmd(%d)", "READ", CODE_READ);
        remote()->transact(CODE_READ, data, &reply);
    }
};

// 实现 BnTest::onTransact()
status_t BnTest::onTransact(uint32_t code, const Parcel &data, Parcel *reply, uint32_t flags) {
    switch (code) {
        case CODE_READ:
            CHECK_INTERFACE(ITest, data, reply)
            ALOGD("BnTest::%s() read(%d), flags(%d)", __FUNCTION__, code, flags);
            // 这里调用的是 ITest::read() 函数
            read();
            return NO_ERROR;
        case CODE_WRITE:
            CHECK_INTERFACE(ITest, data, reply)
            ALOGD("BnTest::%s() write(%d), flags(%d)", __FUNCTION__, code, flags);
            // 这里调用的是 ITest::write() 函数
            write();
            return NO_ERROR;
        default:
            return BnInterface::onTransact(code, data, reply);
    }
}

// 实现 ITest::read() 接口，处理实际的业务逻辑
void ITest::read() {
    ALOGD("ITest::read() called, start do hard work");
}

// 实现 ITest::write() 接口，处理实际的业务逻辑
void ITest::write() {
    ALOGD("ITest::write() called, start do hard work");
}
// !!一定不要忘记了这里!!
IMPLEMENT_META_INTERFACE(Test, "android.test.ITest")
} // namespace android
```

### 编写 TestServer.cpp 文件实现 server 端

```cpp
#define LOG_TAG "TestService"

#include <binder/IPCThreadState.h>
#include <binder/ProcessState.h>
#include <binder/IServiceManager.h>
#include <utils/Log.h>
#include <utils/String8.h>
#include "ITest.h"

// 使用 android 命名空间
using namespace android;

int main(int count, char **argv) {
    // count 为参数个数，argv[0] 表示可执行程序本身
    ALOGI("sample service start count: %d, argv[0]: %s", count, argv[0]);

    // 创建单例
    sp<ProcessState> proc(ProcessState::self());

    // 获取 service manager
    sp<IServiceManager> sm(defaultServiceManager());
    ALOGI("defaultServiceManager(): %p", sm.get());

    // 注册服务
    sm->addService(String16("sample.service"), new BnTest());
    ALOGI("add sample.service to service manager");

    // 开启工作线程
    ProcessState::self()->startThreadPool();
    // 加入到主线程
    IPCThreadState::self()->joinThreadPool();
    return 0;
}
```

### 编写 Android.bp 文件并编译出 service 端可执行程序

```androidbp
// 编译二进制可执行程序：sample_service
cc_binary {
    name: "sample_service",
    srcs: [
        "ITest.cpp",
        "TestServer.cpp",
    ],
    include_dirs: [
        "vendor/grandstream/test-service/native"
    ],
    shared_libs: [
        "libbinder",
        "libcutils",
        "liblog",
        "libutils",
    ],
    cflags: [
        "-Werror",
        "-Wno-error=deprecated-declarations",
        "-Wall",
    ],
}
```

至此，程序源代码目录结构如下：
```
├── Android.bp
├── ITest.cpp
├── ITest.h
└── TestServer.cpp
```
然后在源码环境下进入目录，执行 `mm` 命令进行编译生成 `sample_server` 程序：
`out/target/product/xxx/system/bin/sample_server`，最后将该程序 push 到
设备中：
```bash
adb push out/target/product/xxx/system/bin/sample_service /system/bin/sample_service
```

## 第一种：通过 native 层访问 `sample.service`

### 编写 TestClient.cpp 文件实现 client 端

```cpp
#define LOG_TAG "TestClient"

#include <binder/IPCThreadState.h>
#include <binder/ProcessState.h>
#include <binder/IServiceManager.h>
#include <utils/Log.h>
#include <utils/String8.h>
#include "ITest.h"

// 使用 android 命名空间
using namespace android;

int main(int count, char **argv) {
    ALOGI("sample client start count: %d, argv[0]: %s", count, argv[0]);

    // 获取 service manager
    sp<IServiceManager> sm(defaultServiceManager());
    ALOGI("defaultServiceManager(): %p", sm.get());

    // 获取注册的 sample.service 服务
    sp<IBinder> binder = sm->getService(String16("sample.service"));
    if (binder == NULL) {
        ALOGE("sample service binder is null, abort...");
        return -1;
    }
    ALOGI("sample service binder is %p", binder.get());

    // 通过 interface_cast 还原 ITest 接口
    sp<ITest> service = interface_cast<ITest>(binder);
    ALOGI("sample service is %p", service.get());

    // 使用服务提供的业务接口
    service->write();
    service->read();
    return 0;
}
```

### 修改 Android.bp 文件并编译出 client 可执行程序

1、修改 Android.bp 文件追加如下内容：

```androidbp
// 编译二进制可执行程序：sample_client
cc_binary {
    name: "sample_client",
    srcs: [
        "ITest.cpp",
        "TestClient.cpp",
    ],
    include_dirs: [
        "vendor/grandstream/test-service/native"
    ],
    shared_libs: [
        "libbinder",
        "libcutils",
        "liblog",
        "libutils",
    ],
    cflags: [
        "-Werror",
        "-Wno-error=deprecated-declarations",
        "-Wall",
    ],
}
```

2、编译出 `sample_client` 可执行程序并且 push 到设备中

然后在源码环境下进入目录，执行 `mm` 命令进行编译生成 `sample_client` 程序：
`out/target/product/xxx/system/bin/sample_client`，最后将该程序 push 到设备中：
```bash
adb push out/target/product/xxx/system/bin/sample_client /system/bin/sample_client
```

3、运行程序观察调用过程

进入串口先执行 `sample_service`（或`/system/bin/sample_service`） 启动 service,
在执行 `sample_client` （或`/system/bin/sample_client`） 向 server 发送请求，在
logcat 中可观察到如下日志输出：

```logcat
I/TestService: sample service start count: 1, argv[0]: sample_service
I/TestService: defaultServiceManager(): 0x729e23d180
I/TestService: add sample.service to service manager
I/TestClient: sample client start count: 1, argv[0]: system/bin/sample_client
I/TestClient: defaultServiceManager(): 0x76f023d180
I/TestClient: sample service binder is 0x76f024b140
I/TestClient: sample service is 0x76f023d1c0
D/TestServer: BpTest:: start transact WRITE cmd(16)
D/TestServer: BnTest::onTransact() write(16), flags(16)
D/TestServer: ITest::write() called, start do hard work
D/TestServer: BpTest:: start transact READ cmd(17)
D/TestServer: BnTest::onTransact() read(17), flags(16)
D/TestServer: ITest::read() called, start do hard work
```

## 通过 java 层访问 `sample.service`

### 编写 aidl 文件定义访问接口

### `aidl` 编译并生成中间类

### 编写 java 文件进行访问
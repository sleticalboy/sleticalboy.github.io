---
layout: post
title: 实战：使用 Binder 机制实现 C/S 架构
author: sleticalboy
date: 2021-01-04 20:53:51 +0800
category: android
tags: [android, framework]
---

## 第一种：native 层实现

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

// BnTest 根据请求码 code 对客户端的请求进行转发，实际工作由 ITest 子类完成，
// BnInterface 既是模板类又是多继承，其原型为：
// template<typename INTERFACE>
// class BnInterface : public INTERFACE, public BBinder {}
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
        ALOGD("BpTest::write() start transact %s cmd(%d)", "WRITE", CODE_WRITE);
        remote()->transact(CODE_WRITE, data, &reply);
    }

    void read() override {
        Parcel data, reply;
        data.writeInterfaceToken(ITest::getInterfaceDescriptor());
        // 转发到 BnTest::onTransact()
        ALOGD("BpTest::read() start transact %s cmd(%d)", "READ", CODE_READ);
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

    // 注意 BnTest 的继承关系如下：
    //              IBinder
    //                ^^
    //                ||
    //              BBinder
    //                ^^
    //                ||
    //           BnInterface
    //                ^^
    //                ||
    //              BnTest
    // 即实际上 BnTest 就是一个 IBinder
    // 注册服务
    sm->addService(String16("sample.service"), new BnTest()/*binder*/);
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
    // 可执行程序的名字
    name: "sample_service",
    // 使用哪些源文件来进行编译
    srcs: [
        "ITest.cpp",
        "TestServer.cpp",
    ],
    // 包含的头文件所在的目录
    include_dirs: [
        "vendor/grandstream/test-service/native"
    ],
    // 使用到哪些共享库
    shared_libs: [
        "libbinder",
        "libcutils",
        "liblog",
        "libutils",
    ],
    // c flags
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
D/TestServer: BpTest::write() start transact WRITE cmd(16)
D/TestServer: BnTest::onTransact() write(16), flags(16)
D/TestServer: ITest::write() called, start do hard work
D/TestServer: BpTest::read() start transact READ cmd(17)
D/TestServer: BnTest::onTransact() read(17), flags(16)
D/TestServer: ITest::read() called, start do hard work
```
**总结：**

从以上日志输出可以看出，当对某一 service 中的业务函数发起调用时，首先调用 BpXxx（即 
BpInterface），接着调用 BnXxx（即 BnInterface），最终调用 IXxx（即 IInterface）

---
## 第二种：java 层实现

### 实现 server 端

1、编写 AIDL 文件 `DataStruct.aidl` 和 `ITest.aidl`

1.1、 `ITest.aidl` 文件

```aidl
package com.sleticalboy.sample.service;
// aidl 文件中，即使文件是在同一个 package 下，也要显示导入
import com.sleticalboy.sample.service.DataStruct;

interface ITest {
    void doWrite(in DataStruct data);
    void doRead(in String name, in boolean notify);
}
```

1.2、 `ITest.aidl` 文件

```aidl
package com.sleticalboy.sample.service;
// 切记，当 java 类实现 Parcelable 接口时，在 aidl 中要用 parcelable 关键字
parcelable DataStruct;
```

可以使用 `aidl` 命令先生成对应的 java 文件以方便代码编写

```bash
aidl -Iaidl/ -osrc/ aidl/com/sleticalboy/sample/service/ITest.aidl
```

2、编写 server 端

```java
package com.sleticalboy.sample.service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

public class SampleService extends Service {

    private static final String TAG = "SampleService";

    private final IBinder mBinder = new ITest.Stub() {
        @Override
        public void doWrite(DataStruct data) throws RemoteException {
            Log.d(TAG, "doWrite() data = [" + data + "]");
        }

        @Override
        public void doRead(String name, boolean notify) throws RemoteException {
            Log.d(TAG, "doRead() name = [" + name + "], notify = [" + notify + "]");
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }
}
```

3、编写 Android.bp 文件并编译出 SampleService apk

3.1、Android.bp 文件内容如下：

```androidbp
// 编译 Android apk
android_app {
    // apk 名字
    name: "SampleService",
    // 源文件: .java/.aidl/.logtags/.proto
    srcs: [
        "aidl/com/sleticalboy/sample/service/ITest.aidl",
        "src/com/sleticalboy/sample/service/**/*.java",
    ],
    aidl: {
        // 本地目录（与 Android.bp 文件同级的目录）
        local_include_dirs: ["aidl"],
        // 猜测与日志输出相关
        generate_traces: true,
    },
    // 签名文件，此处表示与平台使用相同的签名文件
    certificate: "platform",
    // 清单文件
    manifest: "AndroidManifest.xml",
    // 静态库，
    static_libs: [
        "android-common",
    ],
    // 优化开关
    optimize: {
        enabled: false,
    },
}
```

3.2、执行 mmm 命令进行编译

```bash
mmm vendor/sleticalboy/sample_service/java/
```

3.3、将编译出的 service apk 安装到设备中

```bash
adb install -r -d -t out/target/product/xxx/system/priv-app/SampleService/SampleService.apk
```

4、server 端目录结构如下：

```filetree
├── aidl
│   └── com
│       └── sleticalboy
│           └── sample
│               └── service
│                   ├── DataStruct.aidl
│                   └── ITest.aidl
├── Android.bp
├── AndroidManifest.xml
├── build_manul.sh
└── src
    └── com
        └── sleticalboy
            └── sample
                └── service
                    ├── DataStruct.java
                    └── SampleService.java
```

### 实现 client 端

1、直接在 Activity 中访问服务端

```java
package com.sleticalboy.sample.client;

import android.annotation.Nullable;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;
import android.widget.Toast;

import com.sleticalboy.sample.client.R;

import com.sleticalboy.sample.service.DataStruct;
import com.sleticalboy.sample.service.ITest;

public class SampleClient extends Activity {

    private static final String TAG = "SampleClient";

    private ITest mService;
    private final ServiceConnection mConn = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            Log.d(TAG, "onServiceConnected() name: " + name + ", binder: " + binder);
            mService = ITest.Stub.asInterface(binder);
            SampleClient.this.onServiceConnected();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            mService = null;
        }
    };

    private void onServiceConnected() {
        if (mService != null) {
            Toast.makeText(this, R.string.service_bind_ok, Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.sample_client);

        doBindeService();

        initViews();
    }

    private void initViews() {
        findViewById(R.id.btn_write).setOnClickListener(v -> {
            if (mService == null) {
                return;
            }
            try {
                DataStruct data = new DataStruct();
                data.mName = "data to server";
                data.mNotify = true;
                mService.doWrite(data);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        });
        findViewById(R.id.btn_read).setOnClickListener(v -> {
            if (mService == null) {
                return;
            }
            try {
                mService.doRead("client", false);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        });
        findViewById(R.id.btn_native).setOnClickListener(v -> {
            // 只要有权限，是能查询到 ServiceManager 中注册的 service
            IBinder service = ServiceManager.getService("sample.service");
            Log.w(TAG, "sample.service: " + service);
        });
    }

    private void doBindeService() {
        Intent intent = new Intent();
        intent.setClassName("com.sleticalboy.sample.service",
                "com.sleticalboy.sample.service.SampleService");
        boolean bound = bindService(intent, mConn, BIND_AUTO_CREATE);
        Log.d(TAG, "bind service: " + bound);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unbindService(mConn);
    }
}
```

2、编写 Android.bp 文件并编译出 SampleClient apk

2.1、Android.bp 文件内容如下

```androidbp
android_app {
    name: "SampleClient",
    srcs: [
        "src/com/sleticalboy/sample/client/**/*.java",
        "../sample_service/java/src/com/sleticalboy/sample/service/**/*.java",
        "../sample_service/java/aidl/com/sleticalboy/sample/service/ITest.aidl",
    ],
    aidl: {
        local_include_dirs: ["../sample_service/java/aidl"],
        generate_traces: true,
    },
    certificate: "platform",
    manifest: "AndroidManifest.xml",
    static_libs: [
        "android-common",
    ],
    optimize: {
        enabled: false,
    },
}
```

2.2、执行 `mmm` 命令进行编译

```bash
mmm vendor/sleticalboy/sample_client/
```

2.3、将编译出的 client apk 安装到设备中

```bash
adb install -r -d -t out/target/product/xxx/system/priv-app/SampleClient/SampleClient.apk
```

3、client 端目录结构如下

```
├── Android.bp
├── AndroidManifest.xml
├── res
│   ├── layout
│   │   └── sample_client.xml
│   └── values
│       └── strings.xml
└── src
    └── com
        └── sleticalboy
            └── sample
                └── client
                    └── SampleClient.java
```

### client 访问 service 运行输出如下：

```log
// 待添加
```

---
## 参考资料

### aidl 使用文档

`aidl` 工具的源码在 `${ANDROID_ROOT}/system/tools/aidl` 目录下，分为 java 和
cpp 两类，分别可以通过输入 aidl 文件生成 java 文件和 cpp 文件

```txt
INPUT required
usage: aidl OPTIONS INPUT [OUTPUT]
       aidl --preprocess OUTPUT INPUT...

OPTIONS:
   -I<DIR>    search path for import statements.可以去哪个目录下寻找import文件
   -d<FILE>   generate dependency file.
   -a         generate dependency file next to the output file with the name based on the input file.
   -ninja     generate dependency file in a format ninja understands.
   -p<FILE>   file created by --preprocess to import.
   -o<FOLDER> base output folder for generated files. 生成的java文件输出目录
   -b         fail when trying to compile a parcelable.
   -t         include tracing code for systrace. Note that if either the client or server code is not auto-generated by this tool, that part will not be traced.

INPUT:
   An aidl interface file.

OUTPUT:
   The generated interface files.
   If omitted and the -o option is not used, the input filename is used, with the .aidl extension changed to a .java extension.
   If the -o option is used, the generated files will be placed in the base output folder, under their package folder
```

### [androidbp 文件格式](/assets/android/soong_build.html)

编译源码时会自动生成相关的文档，文档具体路径在：
`${ANDROID_ROOT}/out/soong/docs/soong_build.html`
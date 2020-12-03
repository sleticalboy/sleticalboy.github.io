---
layout: post
title: vold-storaged
author: sleticalboy
date: 2020-12-03 08:18:17
category: android
tags: [framework]
---

# vold & storaged

## storaged
> 源码目录：android/system/core/storaged

### java 层
- StorageManager
- StorageManagerService
    - $Lifecycle#onStart()
        - mStorageManagerService = new StorageManagerService(getContext());
        - publishBinderService("mount", mStorageManagerService); # 真正的服务名 mount
        - mStorageManagerService.start();
    - #start() -> #connect()
        - IBinder binder = ServiceManager.getService("storaged");
        - mStoraged = IStoraged.Stub.asInterface(binder);

### native 层
-  android/system/core/storaged/storaged.rc 文件
    ```shell
    service storaged /system/bin/storaged
    class main
    capabilities DAC_READ_SEARCH
    priority 10
    file /d/mmc0/mmc0:0001/ext_csd r
    writepid /dev/cpuset/system-background/tasks
    user root
    group package_info
    ```
- 入口：android/system/core/storaged/main.c
- 重要文件
    ```shell
    $ tree storaged/
    storaged/
    ├── binder
    │   └── android
    │       └── os # java 层的 aidl 接口
    │           ├── IStoraged.aidl
    │           └── storaged
    │               ├── IStoragedPrivate.aidl
    │               └── UidInfo.aidl
    ├── include
    │   ├── storaged.h
            # 定义了 storaged 在 native 层的服务名 static char const* getServiceName() { return "storaged"; }
            # 使用 dumpsys storaged 会报错 -> Can't find service: storaged
    │   ├── storaged_service.h
    ├── main.cpp # 主函数文件
    ├── storaged.cpp
    ├── storaged.rc
    ├── storaged_service.cpp
    ```

---
## vold
> 源码目录： android/system/vold/
### java 层
- StorageManager
- StorageManagerService
    - $Lifecycle#onStart()
        - mStorageManagerService = new StorageManagerService(getContext());
        - publishBinderService("mount", mStorageManagerService); # 真正的服务名 mount
        - mStorageManagerService.start();
    - #start() -> #connect()
        - IBinder binder = ServiceManager.getService("vold");
        - mVold = IVold.Stub.asInterface(binder);

### native层
- android/system/vold/vold.rc
    ```shell
    service vold /system/bin/vold \
        --blkid_context=u:r:blkid:s0 --blkid_untrusted_context=u:r:blkid_untrusted:s0 \
        --fsck_context=u:r:fsck:s0 --fsck_untrusted_context=u:r:fsck_untrusted:s0
    class core
    ioprio be 2
    writepid /dev/cpuset/foreground/tasks
    shutdown critical
    group reserved_disk
    ```
- 入口: android/system/vold/main.cpp
- 重要文件
    ```shell
    ├── binder
    │   └── android
    │       └── os # java 层 aidl 接口
    │           ├── IVold.aidl
    │           ├── IVoldListener.aidl
    │           └── IVoldTaskListener.aidl
    ├── fs
    │   ├── Exfat.cpp
    │   ├── Exfat.h
    │   ├── Ext4.cpp
    │   ├── Ext4.h
    │   ├── F2fs.cpp
    │   ├── F2fs.h
    │   ├── Ntfs.cpp
    │   ├── Ntfs.h
    │   ├── Vfat.cpp
    │   └── Vfat.h
    ├── main.cpp # 主函数文件
    ├── model
    │   ├── Disk.cpp
    │   ├── Disk.h
    │   ├── EmulatedVolume.cpp
    │   ├── EmulatedVolume.h
    │   ├── ObbVolume.cpp
    │   ├── ObbVolume.h
    │   ├── PrivateVolume.cpp
    │   ├── PrivateVolume.h
    │   ├── PublicVolume.cpp
    │   ├── PublicVolume.h
    │   ├── VolumeBase.cpp
    │   └── VolumeBase.h
    ├── Process.cpp
    ├── Process.h
    ├── vdc.rc
    ├── VoldNativeService.cpp # native 层服务具体实现
    ├── VoldNativeService.h   # 定义 native 层服务的头文件 static char const* getServiceName() { return "vold"; }
    ├── vold.rc
    ├── VolumeManager.cpp
    ├── VolumeManager.h
    ```

## 其他
- 系统服务是通过 SystemServiceManager 通过反射创建实例对象的
    - 对象创建之后先注册（mServices.add(service)）后调用 onStart() 方法启动服务
- /system/etc/init/\*.rc 文件定义了哪些服务是需要开机启动的
- MountService
- java 层的 Parcel 和 native 层 parcel 的区别与联系
- 系统权限定义
    - system/core/libcutils/include/private/android_filesystem_config.h

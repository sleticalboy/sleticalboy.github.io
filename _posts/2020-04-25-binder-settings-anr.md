---
layout: post
title: Binder Settings anr 引起的思考
author: sleticalboy
date: 2020-04-25 23:54:30
category: android
tags: [android, framework]
---

```
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

- 整体流程
```
客户端 -> 代理服务端 (Proxy)-> 服务端(Binder) -> native 层 Binder -> Binder 驱动
【java 层 Client 发起请求】BatteryStatsHelper#getStats() ->
【java 层服务 Proxy】IBatteryStats.Stub.Proxy#getStatisticsStream() ->
【java 层 Binder】BinderProxy#transact() -> BinderProxy#transactNative() ->
【native 层 BinderProxy】android_util_Binder.cpp::android_os_BinderProxy_transact() -> BpBinder.cpp::transact() -> 
【native 层 IPCThreadState】IPCThreadState.cpp::transact() -> IPCThreadState.cpp::waitForResponse() -> IPCThreadState.cpp::talkWithDriver() -> 
【native 层 Binde r驱动】通过 ioctl() 与 binder 驱动交互
------》暂时中断
```

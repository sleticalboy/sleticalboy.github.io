---
layout: post
title: android-README
author: sleticalboy
date: 2020-12-02 02:19:11
category: android
tags: [android]
---

# Android 知识体系

## AOSP 基础
- [源码下载并编译](aosp/compile-source-code.md)
- [编译结果输出](aosp/build-aosp.md)
- [编译导入 ide 所需的文件](aosp/build-idegen-jar.md)
- [分支管理](aosp/checkout-branch.md)

## framework 层
- [面试总结](面试总结.md)
- [app启动流程分析(一)从点击桌面图标到 ActivityThread 的 main() 方法执行](framework/01-app启动流程分析.md)
- [app启动流程分析(二)从 ActivityThread 的 main() 方法执行到页面显示](framework/02-app启动流程分析.md)
- [app启动流程分析(三)AndroidManifest.xml 文件解析](framework/pms/03-AndroidManifest文件解析.md)
- [ActivityThread 对 Activity 的生命周期的管理](framework/components/at-activity-lifecycle.md)
- [ActivityThread 对 ContentProvider 的生命周期的管理](framework/components/at-provider-lifecycle.md)
- [ActivityThread 对 BroadcastReceiver 的生命周期的管理](framework/components/at-receiver-lifecycle.md)
- [ActivityThread 对 Service 的生命周期的管理](framework/components/at-service-lifecycle.md)
- [Service](framework/components/Service.md)
- [system server](framework/SystemServer.md)

## Handler 机制
- [Handler](framework/handler/Handler机制.md)

## Fragment 碎片化
- [Fragment](framework/Fragment.md)

## 存储机制
- [volume 守护进程](framework/vold-storaged.md)

## ndk 开发
- [jni 基础](ndk-jni/jni-basic.md)
- [clion 开发环境搭建](ndk-jni/clion-dev.md)
- [clion cmake 配置](ndk-jni/src/clion-cmake-config.png)

## 蓝牙子模块
- [蓝牙概述](sub-bluetooth/bluetooth.md)

## 驱动子模块
- [uevent](sub-driver/uevent.md)

## anr 原理
- [anr 案例](framework/binder-settings-anr.md)
- [anr 原理](framework/anr.md)

## 工具使用
- [adb 使用文档](adb-doc.md)
- [adb 使用记录](adb使用记录.md)
- [aapt 使用文档](build-tools-aapt.md)
- [logcat 使用文档](logcat-doc.md)

## open source framework
- [Glide](open-source/glide.md)
- [OKHttp](open-source/okhttp.md)
- [Retrofit](open-source/retrofit.md)
- [fastjson](open-source/fast-json.md)
- [OjbectBox](open-source/objectbox.md)
- [umeng 数据库破解](open-source/umeng数据库破解.md)

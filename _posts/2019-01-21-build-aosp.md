---
layout: post
title: aosp 编译、工具等记录
author: sleticalboy
date: 2019-01-21 10:40:09
category: aosp
tags: [aosp, android]
---


## 编译系统

Android 平台提供三种指令来编译：

1. `make`：不带参数，编译整个系统，时间比较久；
2. `mmm`：编译单个模块，比如：`mmm packages/apps/Settings`，
3. `mm`：编译单个模块，需要进入该模块目录，比如：`cd packags/apps/Settings && mm`
4. `make module_name`：编译单个模块，需要知道模块名，且编译时会编译该模块所依赖的所有其他模块

指令参数：
1. `-B`：默认是增量编译，只编译改动的文件，这个指令强制编译所有目标文件


编译成功的标志：
```bash
#### make completed successfully (02:37:19 (hh:mm:ss)) ####
```

## 为 clion 编译出 CMakeLists.txt 文件

开启编译选项：
```bash
$ export SOONG_GEN_CMAKEFILES=1
$ export SOONG_GEN_CMAKEFILES_DEBUG=1
```
全量编译：
```bash
make -j 16
```
编译单个目录，比如 `frameworks/native/libs/ui`
```bash
$ mmm frameworks/native/libs/ui
```
生成文件：
```bash
$ ls out/development/ide/clion/frameworks/native/libs/ui
libui-arm64-android libui-arm-android
```

## 如何将 Android.mk 文件转换成 Android.bp 文件？
1. 使用 `androidmk` 工具，位于 `${ANDROID_ROOT}/out/soong/host/linux-x86/bin/androidmk`
  - 使用方法：`androidmk Android.mk >Android.bp`;
  - 其原理是读入一个 mk 文件，然后解析成 bp文件
2. Android N 之前，mk 文件是标准的编译文件，N 之后默认 bp 文件为标准编译文件；
3. mk 与 bp 的区别：
  - mk 中可以引用环境变量但 bp 中不能引用环境变量；
  - mk 中可以有流程控制但 bp 中无流程控制；


## 编译系统概述

### 编译系统变化
Android 7.0 之前是 makefile，之后引入 kati 将 makefile 转换成 ninja

### 代码位置

编译系统整体源码在 `${ANDROID_ROOT}/build` 目录下
kati 的位置在 `${ANDROID_ROOT}/build/kati/` 下
soong 在 `${ANDROID_ROOT}/build/soong` 下，与 `${ANDROID_ROOT}/build/blueprint`
共同起作用：`Android.bp`->`blueprint>>soong`->`ninja file`

soong 是在 blueprint 的基础上进行扩展，基于 blueprint 的语法定制产生 Android.bp
语法，然后通过解析 Android.bp 生成 ninja 文件（soong 和 bluepring 均由 go 编写）

### Android ninja 组织

编译过程中，首先将所有的 Android.bp 文件搜集成 `out/soong/build.ninja.d`，并以
此为基础生成 `out/soong/build.ninja` 文件；然后将所有的 Android.md 文件搜集生
成 `out/build-aosp_arm.ninja` 文件；最后通过 `out/combined-aosp_arm.ninja` 文件
将前两个文件组织起来，如下图所示：

![bp-mk-relationship](/assets/android/aosp-build-bp-mk.png)

## 编译流程

### make 流程

### mm 流程

### soong 流程

## ninja 使用

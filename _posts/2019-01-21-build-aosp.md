---
layout: post
title: aosp 编译、工具等记录
author: sleticalboy
date: 2019-01-21 10:40:09
category: aosp
tags: [aosp, android]
---

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
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

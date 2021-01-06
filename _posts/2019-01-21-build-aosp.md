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
export SOONG_GEN_CMAKEFILES=1
export SOONG_GEN_CMAKEFILES_DEBUG=1
```
全量编译：
```bash
make -j 16
```
编译单个目录，比如 `frameworks/native/libs/ui`
```bash
mmm frameworks/native/libs/ui
```
生成文件：
```bash
ls out/development/ide/clion/frameworks/native/libs/ui
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

## 如何使用 google 系统提供的驱动二进制文件来编译 pixel 2 xl

1、进入
[Driver Binaries for Nexus and Pixel Devices](https://developers.google.cn/android/drivers)
页面，在右侧找到并点击‘Pixel 2 XL binaries for Android 9.0.0 (PQ3A.190801.002)’
如下图所示：
![pixel 2xl](/assets/android/google-drivers-bin-pixel2xl.png)
然后点击‘Link’进行下载

2、下载完成之后执行以下命令进行解压：

```bash
# 解压出 extract-google_devices-xxx.sh 可执行文件
tar -zxvf google_devices-xxx.tgz
```

3、导出所需的文件文件

执行 `./extract-google_devices-xxx.sh` 命令，根据提示阅读并接受条款，当出现以
下提示时说明文件导出成功：

```bash
vendor/
vendor/google_devices/
vendor/google_devices/taimen/
vendor/google_devices/taimen/BoardConfigPartial.mk
vendor/google_devices/taimen/device-partial.mk
vendor/google_devices/taimen/proprietary/
vendor/google_devices/taimen/proprietary/device-vendor.mk
vendor/google_devices/taimen/proprietary/vendor.img
vendor/google_devices/taimen/proprietary/BoardConfigVendor.mk
vendor/google_devices/taimen/android-info.txt

Files extracted successfully.
```

4、将 `vendor` 目录拷贝到 Android 源码目录

```bash
cp -r vendor ${ANDROID_ROOT}/
```

5、再次整体编译源码：

编译之前要选择正确的 combo，我这里选择的是 `47. aosp_taimen-userdebug`，

```bash
# 清理上次编译生成的 out 目录
make clobber
# 再次编译
make
```

---
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

当在 `${ANDROID_ROOT}` 目录下执行 `make` 时，默认会找到当前 Makefile 并找到
all 目标进行编译操作，Makefile 文件主要内容只有一行：`include build/make/core/main.mk`，
往下就执行到了 main.mk 文件中：
```make
ifndef KATI

host_prebuilts := linux-x86
ifeq ($(shell uname),Darwin)
host_prebuilts := darwin-x86
endif

.PHONY: run_soong_ui
run_soong_ui:
    +@prebuilts/build-tools/$(host_prebuilts)/bin/makeparallel --ninja build/soong/soong_ui.bash --make-mode $(MAKECMDGOALS)

.PHONY: $(MAKECMDGOALS)
$(sort $(MAKECMDGOALS)) : run_soong_ui
    @#empty

else # KATI
```

`MAKECMDGOALS` 是执行 make 时后面的参数，也就是说执行任何命令的时候都是执行的
`run_soong_ui`，即从 make 切换到了 soong 编译，之后跟 make 就没有关系了

### mm 流程

`mm` 是 aosp 中提供的一个函数，原型在 `build/envsetup.sh` 中：

```bash
function mm() {
    local T=$(gettop)
    # 如果是在源码根目录下，mm 等同于 make 命令
    if [ -f build/soong/soong_ui.bash ]; then
        _wrap_build $T/build/soong/soong_ui.bash --make-mode $@
    else
        # 找到 Android.mk 或者 Android.bp 文件
        local M=$(findmakefile)
        local MODULES=
        local GET_INSTALL_PATH=
        local ARGS=
        # 替换掉 makefile 路径中根目录之前的内容
        local M=`echo $M|sed 's:'$T'/::'`
        if [ ! "$T" ]; then
            echo "Couldn't locate the top of the tree.  Try setting TOP."
            return 1
        elif [ ! "$M" ]; then
            echo "Couldn't locate a makefile from the current directory."
            return 1
        else
            local ARG
            for ARG in $@; do
                case $ARG in
                  GET-INSTALL-PATH) GET_INSTALL_PATH=$ARG;;
                esac
            done
            if [ -n "$GET_INSTALL_PATH" ]; then
              MODULES=
              ARGS=GET-INSTALL-PATH-IN-$(dirname ${M})
              ARGS=${ARGS//\//-}
            else
              MODULES=MODULES-IN-$(dirname ${M})
              # Convert "/" to "-".
              MODULES=${MODULES//\//-}
              ARGS=$@
            fi
            if [ "1" = "${WITH_TIDY_ONLY}" -o "true" = "${WITH_TIDY_ONLY}" ]; then
              MODULES=tidy_only
            fi
            # 执行编译命令
            ONE_SHOT_MAKEFILE=$M _wrap_build $T/build/soong/soong_ui.bash --make-mode $MODULES $ARGS
        fi
    fi
}
```

### soong 流程

## ninja 使用

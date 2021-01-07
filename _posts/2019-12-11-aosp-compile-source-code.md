---
layout: post
title: compile-source-code
author: sleticalboy
date: 2019-12-11 18:31:44
category: aosp
tags: [aosp, android]
---

# Ubuntu 18.04 下载并编译 Android 源码

---
## 准备环境
- 安装 openJDK8
    ```
    $ sudo apt install openjdk-8-jdk openjdk-8-source openjdk-8-doc
    ```
- 如果编译 Android 6.0 以下的源码，需要安装 openjdk7（此安装源在 Ubuntu 18.04 已经被移除了，这里用 `oracle jdk 7` 代替）
    ```
    // step 1： 下载 jdk7 https://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz?AuthParam=1570605801_fcfbdb29eeacd52532bdd180633ab5f7
    // step 2： 配置多版本 java/javac
    // step 2.1： 先`安装`
    $ sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-7-oraclejdk/bin/java 1082
    $ sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-7-oraclejdk/bin/javac 1082
    // step 2.2： 选择不同的版本
    $ sudo update-alternatives --config java
    $ sudo update-alternatives --config javac
    ```
- 安装 git 工具
    - 安装
        ```
        $ sudp apt install git
        ```
    - 配置
        - 配置用户名和 email
            ```
            $ git config --global user.name "username"
            $ git config --global user.email "email"
            ```
        - 配置提交信息编辑器
            ```
            $ git config --global core.editor=vim
            ```
- 安装 python2.7（repo 脚本是用 python2.7 版本编写的， 不能兼容 python3； 而 Ubuntu 18.04 自带 python3）
    ```
    $ sudo apt install python2.7
    ```
- 安装源码管理脚本 `repo`
    ```
    // step 1： 获取 repo 脚本
    $ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    // step 2： 添加可执行权限
    $ chmod a+x ~/bin/repo
    // step 3： 将 repo 脚本添加到可执行路径中
    $ echo 'export PATH=/home/binli/bin:$PATH' >>~/.bashrc
    // step 4： 刷新环境
    $ source ~/.bashrc
    ```

---
## 源码下载
> 参考：[清华大学开源软件镜像站 Android 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/AOSP/)

### 下载 repo 工具
``` shell
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
# or curl https://mirrors.tuna.tsinghua.edu.cn/git/git-repo -o ~/bin/repo
chmod a+x ~/bin/repo
```

### 初始化仓库
- `repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/manifest`
- 指定 Android 版本：`repo init -u https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/manifest -b android-4.0.1_r1`

### 同步源码
- `repo sync`

---
## 源码编译
- 安装编译源码所需的依赖
    - 安装大部分依赖包
        ```
        $ sudo apt install libx11-dev:i386 libreadline-dev:i386 libgl1-mesa-dev g++-multilib -y flex bison gperf build-essential libncurses5-dev:i386 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 dpkg-dev libsdl1.2-dev git gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip m4 lib32z1-dev ccache
        ```
    - 单独安装 `libesd0-dev`
        - 追加以下内容到 `/etc/apt/source.list` 文件（root 权限）
            ```
            # for install libesd0-dev
            deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe    
            # deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main universe
            ```
        - 更新并安装
            ```
            $ sudo apt update 
            $ sudo apt install libesd0-dev
            ```
    - 安装 python 依赖包 `cropto`
        - 首先安装 `pip` 包管理工具
            ```
            $ sudo apt install python-pip
            ```
        - 使用 pip 安装 crypto 模块
            ```
            $ pip install crypto
            ```
        - 验证是否安装成功
            ```
            $ python
            Python 2.7.15+ (default, Oct  7 2019, 17:39:04) 
            [GCC 7.4.0] on linux2
            Type "help", "copyright", "credits" or "license" for more information.
            >>> from Crypto.Signature import PKCS1_v1_5
            >>> 此处若无输出则说明安装成功
            ```
- 编译源码
    - 设置环境变量
        ```
        $ source build/envsetup.sh 
        ```
    - 选择
    ```
    $ lunch 
    You're building on Linux
    Lunch menu... pick a combo:
        1. aosp_arm-eng
        2. aosp_arm64-eng
        3. aosp_mips-eng
        4. aosp_mips64-eng
        5. aosp_x86-eng
        6. aosp_x86_64-eng

        Which would you like? [aosp_arm-eng] 6
    ```
    - 开始编译
        ```
        $ make -j4
        ```
    - 漫长的等待之后
        ```
        #### build completed successfully (03:21:10 (hh:mm:ss)) ####
        ```

---
## 烧写镜像


---
## 分支切换


---
## 问题总结
### Ubuntu 18.04 编译 Android 9.0 源码

### Ubuntu 18.04 编译 Android 6.0 源码
- flex-2.5.39: loadlocale.c:130: _nl_intern_locale_data: Assertioncnt < (sizeof (_nl_valu
```bash
export LC_ALL=C
```
- recipe for target 'out/host/linux-x86/obj/lib/libart.so' failed function.sh: line 44: sendemail: command not found
    - 1) 缺少 sendemail 软件包, 如果仍然报错尝试 2)
    ```
    $ sudo apt install sendemail
    ```
    - 2) 尝试关闭 clang 编译器
    ```bash
    # Host.
    ART_HOST_CLANG := false
    ifneq ($(WITHOUT_HOST_CLANG),true)
      # By default, host builds use clang for better warnings.

    # ART_HOST_CLANG := true
    # 把 true 修改为 false
      ART_HOST_CLANG := false
    endif
    # 版权声明：本文为CSDN博主「Hunkk4」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
    # 原文链接：https://blog.csdn.net/u011444472/article/details/51463074
    ```
- clang: error: linker command failed with exit code 1 (use -v to see invocation)
```bash
# errors
prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.15-4.8//x86_64-linux/bin/ld: error: out/host/linux-x86/obj/SHARED_LIBRARIES/libart_intermediates/arch/x86_64/quick_entrypoints_x86_64.o: unsupported reloc 42 against global symbol art::Runtime::instance_
prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.15-4.8//x86_64-linux/bin/ld: error: out/host/linux-x86/obj/SHARED_LIBRARIES/libart_intermediates/arch/x86_64/quick_entrypoints_x86_64.o: unsupported reloc 42 against global symbol art::Runtime::instance_
...
clang: error: linker command failed with exit code 1 (use -v to see invocation)
build/core/host_shared_library_internal.mk:51: recipe for target 'out/host/linux-x86/obj/lib/libart.so' failed
# resolution 1
# https://android-review.googlesource.com/c/platform/build/+/223100/1/core/clang/HOST_x86_common.mk#17
prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.15-4.8//x86_64-linux/bin/ld: final link failed: Bad value
clang: error: linker command failed with exit code 1 (use -v to see invocation)
build/core/host_shared_library_internal.mk:51: recipe for target 'out/host/linux-x86/obj/lib/
# resolution 2
# https://blog.csdn.net/JKjiang123/article/details/77987521
cp /usr/bin/x86_64-linux-gnu-ld.gold ${AOSP_SRC}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.15-4.8/x86_64-linux/bin/
```

### Ubuntu 18.04 编译 Android 4.4 源码
- make: *** [out/target/common/obj/PACKAGING/checkapi-current-timestamp] 错误 38 处理
```bash
$ make update-api && make
 touch out/target/common/obj/PACKAGING/checkapi-last-timestamp
 touch out/target/common/obj/PACKAGING/checkapi-current-timestamp
```
- frameworks/av/media/CedarX-Projects/CedarAndroidLib/LIB_KK44_/Android.mk: No such file or directory
```bash
# https://blog.csdn.net/JAZZSOLDIER/article/details/78140554
```
- out/target/product/mx3/obj/GYP/shared_intermediates/content/jni/HashSet_jni.h:10:26: error: extra tokens at end of #ifndef directive [-Werror]
```bash
# 这个错误是由于之前使用sudo alternatives --install /usr/bin/javajava /usrjava/jdk1.7.0_25/bin/java 500这种方式设置的java jdk和javac环境，但是没有设置javap，因此出错。
# 需要配置 javap 版本之后 make clean， make
# 版权声明：本文为CSDN博主「疑是银河落九天」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
# 原文链接：https://blog.csdn.net/u012195899/article/details/82078384
```

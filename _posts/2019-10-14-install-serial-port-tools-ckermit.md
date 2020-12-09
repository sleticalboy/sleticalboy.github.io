---
layout: post
title: 串口工具 ckermit 安装与使用
author: sleticalboy
date: 2019-10-14 18:14:14
category: linux
tags: [linux]
---

#### 安装与配置
- 1，安装 ckermit
    ```
    $ sudo apt install ckermit 
    ```
- 2，验证软件版本
    ```
    $ kermit --version
    9.0.302 [9.0.302]
    ```
- 配置 ckermit
    - 在 ～ 目录下创建 .kermrc 配置文件
        ```
        $ touch .kermrc
        ```
    - 在 .kermrc 中写入以下内容
        ```
        # 如果使用的是USB线，那你就填ttyUSB0
        # 如果是 9 针格的串口线，就填ttyS0
        set line /dev/ttyS0
        set speed 115200
        set carrier-watch off
        set handshake none
        set flow-control none
        robust
        set file type bin
        set file name lit
        set rec  pack 1000
        set send pack 1000
        set window 5 
        ```
    - 启动
        ```
        $ sudo kermit -c
        ```

#### 参考连接
- [ubuntu下串口工具 minicome 使用](https://blog.csdn.net/lzhitwh/article/details/80304579)
- [Ubuntu下使用minicom+ckermit实现串口调试](https://blog.csdn.net/wr132/article/details/76283688)

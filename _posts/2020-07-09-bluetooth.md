---
layout: post
title: bluetooth
author: sleticalboy
date: 2020-07-09 10:39:32
category: android
tags: [sub-bluetooth]
---

# 蓝牙

## 经典蓝牙 bt

## 蓝牙低功耗 ble

### 主设备与从设备
- [参考文献-1](https://blog.csdn.net/hahachenchen789/article/details/51601934)
- [参考文献-2](https://www.sohu.com/a/345515562_576959)
```
六种设备状态
待机状态（standby）：设备没有传输和发送数据，并且没有连接到任何设备
广播状态（Advertiser）：周期性广播状态
扫描状态（Scanner）：主动寻找正在广播的设备
发起链接状态（Initiator）：主动向扫描设备发起连接。
主设备（Master）：作为主设备连接到其他设备。
从设备（Slave）：作为从设备连接到其他设备。

五种工作状态
准备（standby），
广播（advertising），
监听扫描（Scanning），
发起连接（Initiating），
已连接（Connected）

四种设备类型
Cnetral主机（常作为client端）：如手机，PC，接收从机的广播并向其发起连接
Peripheral从机（常作为Service端）：如心率计，血糖计 ，向外广播数据并等待连接
Observer观察者：
Broadcast广播者：

连接过程：
  Peripheral开启广播-->Central扫描从机广播-->Peripheral接收到Central的扫描请求，Peripheral向Central发送扫描回应数据-->Central向Peripheral发起连接-->开始通信。
```

## 抓取蓝牙日志(Bluetooth HCI (Host Controller Interface))
- `adb pull /data/misc/bluetooth/logs/btsnoop_hci.log`
- [参考文献](https://blog.csdn.net/yuanzhangmei1/article/details/25053013)
- `adb shell settings put secure bluetooth_hci_log 1`
- 修改配置文件
- 开日蓝牙可抓包开关 `setprop persist.bluetooth.btsnoopenable true`
```
Android4.2之前抓取hci log都是通过hcidump命令完成的，但是Android4.2 Bluetooth引入了Bluedroid，这是一个新的蓝牙协议栈。所以抓取hci log的方法也改变了。
在Android 4.2之后， Bluetooth控制hcidump 的写开关和默认保存的hci log的路径,以及各种级别的log 开关是在/etc/bluetooth/bt_stack.conf 文件里. 如果你需要hci log，那你首先需要从手机把这个文件adb pull出来，然后修改这个文件的内容，然后adb push回去。文件里你修改的BtSnoopFileName这个值就是你需要的hci log文件路径。
bt_stack.conf的文件内容如下

# Enable BtSnoop logging function
# valid value : true, false
BtSnoopLogOutput=true　//默认是false,如果需要抓取hcidump 的话,改成 true
# BtSnoop log output file
BtSnoopFileName=/sdcard/btsnoop_hci.log //默认写hcidump 的路径，btsnoop_hci.log 就是hcidump的log。可以按照你自己的需要修改。
```

---
layout: post
title: ch01-MediaPlayer
author: sleticalboy
date: 2019-06-21 12:15:26
category: book
tags: [android, audio, video]
---

# Android 系统的 MediaPlayer

## 状态图及生命周期
- 正常流程
  - idle：空闲状态
    > 调用了 reset() 方法
  - initialized：初始化完成
    > 调用了 setDataSource() 方法 
  - preparing
    > 调用了 prepareAsync() 方法，当资源就绪会回调 onPrepared() 方法
  - prepared
    > 调用了 prepare() 方法，当资源就绪会回调 onPrepared() 方法
  - started
  - paused
  - stopped
  - end
    > 调用了 release() 方法
- 异常流程
  - error： 正常流程任意位置出错都会导致状态转换到此状态
    > 回调 onError() 方法

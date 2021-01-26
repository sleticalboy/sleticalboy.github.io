---
layout: post
title: Android anr 原理及分类
author: sleticalboy
date: 2020-12-02 02:19:11
category: android
tags: [android]
---

## anr 原理

## anr 分类

### input 超时

普通：5000ms
Instrumentation：60000ms

由 InputDispatcher 分发事件时上报

---> native 层
InputDispatcherThread::threadLoop() ->
InputDispatcher::dispatchOnce() -> dispatchOnceInnerLocked() ->
dispatchMotionLocked() -> findTouchedWindowTargetsLocked() ->
handleTargetsNotReadyLocked() -> onANRLocked() ->
doNotifyANRLockedInterruptible() ->
InputDispatcherPolicyInterface::notifyANR() ->
--> jni 调用
NativeInputManager::notifyANR() ->
---> Java 层
IMS#notifyANR() -> WindowManagerCallbacks#notifyANR() ->
InputMonitor#notifyANR() ->
AMS#inputDispatchingTimedOut() -> inputDispatchingTimedOut() ->
AppErrors#appNotResponding() -> AMS#SHOW_NOT_RESPONDING_UI_MSG ->
AppErrors#handleShowAnrUi() -> 显示 ANR 弹窗
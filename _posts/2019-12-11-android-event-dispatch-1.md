---
layout: post
title: Android 事件分发：Java 层
author: sleticalboy
date: 2019-12-11 18:31:44
category: android
tags: [android, framework]
---

涉及到的源代码及路径：
`frameworks/base/core/java/android/app/Activity.java`
`frameworks/base/core/java/com/android/internal/policy/PhoneWindow.java`
`frameworks/base/core/java/com/android/internal/policy/DecorView.java`
`frameworks/base/core/java/android/view/InputEventSender.java`
`frameworks/base/core/java/android/view/InputEventSender.java`
`frameworks/base/core/java/android/view/InputFilter.java`
`frameworks/base/core/java/android/view/InputQueue.java`
`frameworks/base/core/java/android/view/InputDevice.java`
`frameworks/base/core/java/android/view/InputChannel.java`

## 按键事件：KeyEvent
- Activity.dispatchKeyEvent():  Windown.Callback.dispatchKeyEvent()
- activity.getWindow().superDispatchKeyEvent(): PhoneWindow.superDispatchKeyEvent()
- mDecor.superDispatchKeyEvent() -> DecorView.dispatchKeyEvent() -> ViewGroup.dispatchKeyEvent()

## 触摸事件：TouchEvent
- Activity.dispatchTouchEvent(): Window.Callback.dispatchTouchEvent()
- activity.getWindow().superDispatchTouchEvent(): PhoneWindow.superDispatchTouchEvent()
- mDecor.superDispatchTouchEvent() -> DecorView.superDispatchTouchEvent() -> ViewGroup.dispatchTouchEvent()

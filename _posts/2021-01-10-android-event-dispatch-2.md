---
layout: post
title: Android 事件分发：native 层
author: sleticalboy
date: 2021-01-10 20:40:13 +0800
category: android
tags: [android, framework]
---

涉及到的源代码及路径：
`frameworks/base/core/jni/android_view_InputChannel.cpp`<br/>
`frameworks/base/core/jni/android_view_InputDevice.cpp`<br/>
`frameworks/base/core/jni/android_view_InputEventReceiver.cpp`<br/>
`frameworks/base/core/jni/android_view_InputEventSender.cpp`<br/>
`frameworks/base/core/jni/android_view_InputQueue.cpp`<br/>
`frameworks/base/services/core/java/com/android/server/wm/WindowManagerService.java`<br/>

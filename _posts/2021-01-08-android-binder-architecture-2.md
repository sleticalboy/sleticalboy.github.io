---
layout: post
title: Android binder java 层
author: sleticalboy
date: 2021-01-08 13:09:34 +0800
category: android
tags: [android, framework]
---

涉及到的源码及路径：

`frameworks/base/core/java/android/os/IBinder.java`<br/>
`frameworks/base/core/java/android/os/Binder.java`<br/>
`frameworks/base/core/java/android/os/IInterface.java`<br/>
`frameworks/base/core/java/com/android/internal/os/BinderInternal.java`<br/>
`frameworks/base/core/jni/android_util_Binder.cpp`<br/>
`frameworks/base/core/jni/android_os_Parcel.cpp`<br/>

<pre>
----------     ----------------------------      -------------------------
| Parcel |     |        IBinder           |      |      BinderInternal   |
----------     ----------------------------      -------------------------
               | +FLAG_ONEWAY = 0x0000001 |      | +getContextObject()   |
               |--------------------------|      | +forceBinderGc()      |
               | +transact()              |      | +handleGc()           |
               | +queryLocalInterface()   |      | +joinThreadPool()     |
               |    ------------------    |      |   ----------------    |
               |    | DeathRecipient |    |      |   | GcWatcher    |    |
               |    ------------------    |      |   ----------------    |
               |    | +binderDied()  |    |      |   | +finalize()  |
               |    ------------------    |      |   ----------------    |
               |--------------------------|      -------------------------
                             ^
                             |
           ---------------------------------------
           |                                     |
  --------------------            ------------------------------
  |      Binder      |            |         BinderProxy        |
  --------------------            ------------------------------
  | +getCallingId()  |            | +transact()                |
  | +getCallingUid() |            | -destroy()                 |
  | +init()          |            | +linkToDeath()             |
  | +transact()      |            ------------------------------
  | -execTransact()  |            
  | -destroy()       |            
  --------------------            
</pre>
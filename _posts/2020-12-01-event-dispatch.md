---
layout: post
title: event-dispatch
author: sleticalboy
date: 2020-12-01 02:31:07
category: android
tags: [framework, view]
---

# 事件分发机制

## KeyEvent
- Activity.dispatchKeyEvent():  Windown.Callback.dispatchKeyEvent()
- activity.getWindow().superDispatchKeyEvent(): PhoneWindow.superDispatchKeyEvent()
- mDecor.superDispatchKeyEvent() -> DecorView.dispatchKeyEvent() -> ViewGroup.dispatchKeyEvent()

## TouchEvent
- Activity.dispatchTouchEvent(): Window.Callback.dispatchTouchEvent()
- activity.getWindow().superDispatchTouchEvent(): PhoneWindow.superDispatchTouchEvent()
- mDecor.superDispatchTouchEvent() -> DecorView.superDispatchTouchEvent() -> ViewGroup.dispatchTouchEvent()

---
layout: post
title: 敏行 Android 端项目重构
author: sleticalboy
date: 2021-04-28 23:21:19 +0800
category: articale
tags: [technology]
---

## 网络模块

### 后端 API 接口请求

HttpClient 和 AndroidHttpClient 实现

### 文件上传与下载

HttpUrlConnection 和 AndroidHttpClient 实现

### 图片加载中的网络请求

HttpURLConnection 实现

### Web 中的网络请求

1、 WebView 拦截部分网络请求

HttpURLConnection 实现

2、Web 调试时下载资源

WebSocket

### 重构过程

1、隔离层抽取

HttpRequest
HttpResponse
HttpConfig

HttpAdapter

2、调用方式收敛

3、老旧方式移除

4、底层实现替换

默认实现为 HttpUrlConnection
可自行替换为 OkHttp + Retrofit + RxJava

## 图片加载模块

### UniversalImageLoader

优点：

1、多线程异步加载；
2、AbsListView 滑动监听；
3、内存缓存、磁盘缓存

缺点：
1、使用弱引用做内存缓存，容易被回收；

### 技术选型

1、Volley

优点：

1、图片、网络一体；
2、轻巧

缺点：
1、不能加载本地图片；
2、大文件下载时对内存压力比较大(byte[])

2、Picasso

优点：
缺点：

3、Fresco

优点：

1、Android 5.0 以下机型优势比较明显，native 层开辟区域存放 Bitmap
2、类似 web 渐进式显示图片
3、gif 加载流畅
4、专注于大量图片显示

缺点：

1、涉及到 native 层 jni 知识，学习门槛较高；
2、体积较大且集成入侵性较强：DraweeView；

4、Glide

优点：

1、专注于列流畅表滑动，四级缓存；
2、组件生命周期集成、网络变化集成、内存泄露处理；
3、webp、gif 加载、base64、video 缩略图；
4、体积小且集成入侵性较低；

缺点：

1、复杂度大，学习成本较高；
2、gif 加载时内存飙升：gif 被解析成一帧一帧的 Bitmap 存放在内存中




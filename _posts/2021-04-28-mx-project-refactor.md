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

### WebView 中的网络请求

HttpURLConnection 实现

### 技术选型

HttpUrlConnection

OkHttp + Retrofit + RxJava

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

图片、网络一体

大文件下载时对内存压力比较大
不能加载本地图片

2、Picasso

精巧

3、Fresco
4、Glide

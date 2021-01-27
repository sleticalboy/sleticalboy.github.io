---
layout: post
title: 面试总结
author: sleticalboy
date: 2019-09-01 18:51:19
category: android
tags: [android]
---

## 自我介绍
```
李斌，河南南阳人，25 岁，2017/06毕业；
从大四开始接触并学习 Android 到现在大概有三年了，毕业之后开始正式从事 Android 开发到现在，一共经历过两家公司；
北京德惠众合信息技术有限公司，以即时通讯为核心的做移动办公的服务型公司，客户对象主要是政府、银行等企业机关，做定制化的 app 开发，
目前参与了（内蒙公安厅、中原银行、江苏银行、建设银行、北京银行等）4/5个项目的开发；
北京悦影科技有限公司，做新闻采编的一家公司，新闻素材的采集、合成、上传到发布等一些列流程，修改bug，离职之后就没有再过多的关注；
寻求一份 Android 开发的岗位；
个人比较喜欢杭州（气候、生活节奏）
想问的：项目内容，公司的日常开发环境，福利待遇，加班情况等
```

---
## android 基础
> 四大组件 + Fragment、Handler 机制、View 基础知识、数据库 + SharedPreference、
  网络编程、IPC 机制
### Activity

- 启动模式
    - Standard
    - SingleTop
    - SingleTask
    - SingleInstance

- 生命周期
    ```java
    public void onCreate() {
        //
    }

    public void onStart() {
        //
    }

    public void onResume() {
        //
    }

    public void onPause() {
        //
    }

    public void onStop() {
        //
    }

    public void onDestroy() {
        //
    }
    ```

- 启动流程
```java
// Context.startActivity() -> ContextImpl.startActivity() -> AMS.startActivity() ->
// 
```

### [Service](/android/2019/09/27/service/)

### BroadcastReceiver

### ContentProvider
- 基本使用
    ```java
    // 增删改查
    public Uri insert() {}
    public int delete() {}
    public void update() {}
    public Cursor query() {}
    ```

### [Fragment](/android/2019/09/27/fragment/)

### [Handler 机制理解](/android/2019/09/02/handler/)

### View
- 事件分发流程
    ```java
    public boolean onDispatchTouchEvent() {}
    public boolean onInterceptTouchEvent() {}
    public boolean onTouchEvent() {}
    ```
- invalidate() 和 requestLayout() 两者的区别
- draw() 和 onDraw() 的区别
- requestDisallowInterceptTouchEvent(boolean disallow) 方法的作用范围是什么，该标记位何时失效

### 数据库 + SharedPreference

### 网络编程
- http 协议

### IPC 机制
- Bundle
```
Parcelable 序列化
```
- 文件共享
```
文件序列化
```
- Messenger
```
Handler, Message, Service
```
- ContentProvider
```
CRUD 操作
```
- AIDL
- Socket


---
## Java 基础
> 常用类库（String、包装类、ArrayList、LinkedList、HashMap），多线程，并发，JVM，类加载器

---
## 源码

### View

### app 冷启动流程

### Activity

### Service

### BoradcastReceiver

### ContentProvider

## 开源框架

### MQTT

### Glide

### OkHttp

### Volley

### ASM 字节码框架

---
## 算法

### LRU 

### 排序算法

---
## 业务场景
- 如何实现一个可折叠的列表
- 让 ScrollView 不可滚动有几种方式
    ```java
    // 方式一：重写以下两个方法，分别返回 false
    @Override
    public boolean onInterceptTouchEvent(MotionEvent event) {
        // 不拦截事件
        return false;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        // 不消费事件
        return false;
    }
    // 方式二：重写子类的 onTouchEvent() 方法，并调用 
    // getParent().requestDisallowInterceptTouchEvent(true) 方法
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        // 业务逻辑
        if (getParent() != null) {
            getParent().requestDisallowInterceptTouchEvent(true);
        }
    }
    ```
- for 循环执行 n 次 invalidate() 方法，draw() 方法会执行几次？

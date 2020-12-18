---
layout: post
title: Camera Service
author: sleticalboy
date: 2020-12-16 22:55:43 +0800
category: android
tags: [camera]
---


## Java 层

CameraManager:
openCamera() -> openCameraForUid() -> openCameraDeviceUserAsync() -> 
1. 构造 CameraDeviceImpl deviceImpl = new CameraDeviceImpl();
2. 如果支持 camera2 则：
2.1 ICameraService cameraService = CameraManagerGlobal.get().getCameraService();
   否则：
2.2 CameraDeviceUserShim.connectBinderShim(callbacks, id);

## native 层（接2.1）

系统服务 ICameraService 是在 native 层实现的，service 名称为 media.camera，其实现位于
frameworks/av/services/camera/CameraService.cpp，头文件是同级目录下的 CameraService.h
我们看 connectDevice() 的具体实现
CameraService.h::connectDevice() -> 
CameraService.cpp::connectDevice() -> connectHelper() -> makeClient() ->
	client = new CameraClient()
	client = new camera2Client()
client.initialize() ->
	frameworks/av/services/camera/libcameraservice/api2/CameraDeviceClient.h
	frameworks/av/services/camera/libcameraservice/api2/CameraDeviceClient.cpp
	initializeImpl() -> 父类初始化 Camera2ClientBase::initialize()
	在 CameraClient.cpp::initialize() 中初始化 mHardware = new CameraHardwareInterface(),
    接着进行 hardware 初始化：mHardware::initialize() ->
	CameraProviderManager.cpp::openSession() -> 打开设备：上电、初始化、返回 session 句柄
	mHardware::setCallbacks(notifyCallback, dataCallback, ...) 注意此处传递的是函数指针
	enableMsgType() -> mHardware::enableMsgType(error, zoom, focus, metadata msg, ...)
返回 client 引用

## hal 层

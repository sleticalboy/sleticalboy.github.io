---
layout: post
title: Android JNI 基础
author: sleticalboy
date: 2020-05-26 18:51:20
category: android
tags: [ndk, android]
---

## JNI

Java Native Interface 缩写为 JNI，通过 JNI 可以：
1. java 程序可以调用 native 函数；
2. native 程序可以反向调用 java 函数

注意：JNI 层必须实现为动态库的形式，这样 JVM 才能加载并调用 so 中的函数

总结：JNI 是连通 java 层和 native 层的桥梁

## 加载动态库与 native 函数声明

```java
static {
    // 加载对应的 JNI 库，name 是库的名称，实际加载时：
    // linux -> libname_jni.so, windows -> name.dll
    System.loadLibrary("name");
}

// java 中使用 native 关键字声明 native 函数，具体实现在 JNI 层
private static native void native_init();
```

## JNI 函数注册

##  char* to jcharArray
```cpp
static jcharArray getData_native(JNIEnv *env, jobject clazz) {
	struct nrf_ctrl tx_ctrl;
	tx_ctrl.tx_ctrl = {'D', 'A', 'T', 'A'};
	int len = 4;
	jcharArray data = env->NewCharArray(len);
	jchar *temp = (jchar *) calloc(len, sizeof(jchar));
	for(int i = 0; i < len; i+=2) {
	    *(temp + i) = *(rx_ctrl.rxbuf + i);
	    *(temp + i + 1) = *(rx_ctrl.rxbuf + i + 1);
	}
	env->SetCharArrayRegion(data, 0, len, temp);
	return data;
}
```

## jstring to char*
```cpp
static void sendData_native(JNIEnv *env, jobject clazz, jstring data) {
	const char* _data = env->GetStringUTFChars(data, 0);
	LOGI("send cmd to Nrf channels pipe: %s\n", _data);	
}
```

## jcharArray to char*
```cpp
static void sendCommand_native(JNIEnv *env, jobject clazz, jcharArray cmd) {
    int fd = open("/dev/nrf_ctrl", O_RDWR);
    if (fd <= 0) {
        LOGE("send cmd to Nrf failed with fd: %d", fd);
        return;
    }
    struct nrf_ctrl tx_ctrl;
    tx_ctrl.length = 6;
    tx_ctrl.txbuf = new char[tx_ctrl.length];
    jchar* _cmd = env->GetCharArrayElements(cmd, nullptr);
    for (int i = 0; i < tx_ctrl.length; i++) {
        tx_ctrl.txbuf[i] = *(_cmd + i);
        LOGI("send cmd to Nrf %d: j: %02x, c: %02x", i, *(_cmd + i), tx_ctrl.txbuf[i]);
    }
    int ret = ioctl(fd, NRF_IOCTL_SET_DEVICE_GMDCMD, &tx_ctrl);
    if (ret < 0) {
        LOGE("send cmd to Nrf failed with ret: %d", ret);
    }
    // release
    env->ReleaseCharArrayElements(_cmd, cmd, JNI_ABORT);
    close(fd);
}
```

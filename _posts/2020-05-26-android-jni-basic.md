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

### 静态注册

- 先编写 java 代码，然后编译生成 .class 文件；
- 使用 jdk 提供的工具 `javah`，如 `javah -o putput package.classname` 生成头文件
  `output.h`，该头文件中声明了在 java 层声明的 JNI 接口，native 层实现该函数即可
- 实例：
  1. 第一步： java 层声明 native 函数
  ```java
  package com.example.android;
  public class HelloNdk {
      public native void sayHello();
  }
  ```
  - 第二步：生成的头文件
  ```cpp
  // 格式：Java_包名_类名_函数名，其中包名中的 . 要替换为 _
  JNIEXPORT void JNICALL Java_com_example_android_HelloNdk_sayHello();
  ```
- native 函数如何找到对应的 JNI 函数
当 java 层调用 native 函数时，会从对应的 JNI 库中搜索 `Java_com_android_example_HelloNdk_sayHello`
函数，如找不到则抛错；如找到则将 `sayHello` 与该函数建立关联，即保存 JNI 层的函
数指针；之后再调用该函数时就可以直接使用该函数指针，这些工作均是由虚拟机完成。
- 静态注册的缺点
  - 需要对每一个声明了 native 方法的 java 类进行编译并且使用 javah 生成头文件；
  - javah 生成的 JNI 层函数名过长，不易书写；
  - 初次运行需要更具

### 动态注册

## Java 和 JNI 层数据类型的转换

## JNIEnv 和 jstring 的使用方法及 JNI 中的类型签名

## 垃圾回收在 JNI 层中的使用及异常处理

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

---
layout: post
title: objectbox
author: sleticalboy
date: 2020-12-03 08:18:17
category: android
tags: [open-source]
---

# ObjectBox 数据库

## issues
- DB's last entity ID 2 is higher than 1 from model
  ```log
  新老数据库不兼容会出现此问题，解决方法删除旧数据即可
  ```
- new AndroidObjectBrowser(boxStore).start(context); 一直返回 false
  ```groovy
    // 在子 module 目录下做如下配置
    buildscript {
        ext.objectbox_version = '2.3.1'
        repositories {
            jcenter()
        }
        dependencies {
            classpath "io.objectbox:objectbox-gradle-plugin:$objectbox_version"
        }
    }
    apply plugin: 'com.android.application'
    省略 ...
    dependencies {
        省略 ...
        debugImplementation "io.objectbox:objectbox-android-objectbrowser:$objectbox_version"
        releaseImplementation "io.objectbox:objectbox-android:$objectbox_version"
    }

    // 放到最后，不然会报一些奇怪的错误[类重复]
    apply plugin: 'io.objectbox'
  ```
  ```shell
  然后 `adb forward tcp:8090 tcp:8090`
  在手机浏览器打开 http://localhost:8090/index.html 即可查看数据库内容
  ```
- 无法生成 MyObjectBox.java 类
```java
// 最有可能的原因是没有先创建实体类，使用 @Entity 注解创建的实体类在 rebuild 工程试试
```
- 其他高级配置
```groovy
android {
    ...
    defaultConfig {
        ...
        javaCompileOptions {
            annotationProcessorOptions {
                // 配置 MyObjectBox.java 生成目录[在子工程里配置貌似不生效]
                arguments = ["objectbox.myObjectBoxPackage": "com.sleticalboy.objectbox"]
                // 配置数据库配置 json 文件生成位置[在子工程里配置貌似不生效]
                arguments = ["objectbox.modelPath": "$projectDir/schemas/objectbox.json".toString()]
                // 开启 debug 模式
                arguments = [ 'objectbox.debug' : 'true' ]
            }
        }
    }
}
```

---
layout: post
title: Daily Question Record
author: sleticalboy
date: 2019-01-16 23:21:15
category: daily
tags: [android, java]
---

## View
### TextView
- 文字阴影效果
```xml
< TextView
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:shadowColor="#8000"
    android:shadowDx="3"
    android:shadowDy="3"
    android:shadowRadius="2"
    android:textColor="#00ff00"
    tools:text="a man has no name"/>
```

### EditText/TextView
- 限制字符长度
```xml
android:maxLength="50"
```
```java
et.setFilters(new InputFilter[]{new InputFilter.LengthFilter(50)})
```
- 软键盘搜索事件
```xml
imeOptions="actionSearch"
```
- 限制输入类型为 ip
```xml
<!-- xml 布局 -->
< EditText
    android:id="@+id/et_setting_printer_edit_info_ip"
    ...
    android:inputType="number"
    android:digits="0123456789." />
```
```java
// Java 代码
final EditText mEditText = new EditText(context);
mEditText.setKeyListener(DigitsKeyListener.getInstance("0123456789."));
mEditText.setInputType(InputType.TYPE_CLASS_NUMBER);
```
- 文字实现`跑马灯`效果
    - setEllipsize(TextUtils.TruncatAt.MARQUEE)
    - text.setSelected(true)
    - 注意：
        - EditText 不支持跑马灯效果，如果执行 setEllipsize(TextUtils.TruncatAt.MARQUEE) 会抛出异常 EditText cannot use the ellipsize mode TextUtils.TruncateAt.MARQUEE
        - 只有当 text.setSelected(true) 时才有效果

### ListView
- 在 TV 开发中可能会遇到 ListView#setSelection(int index) 无效，可尝试以下解决办法
```java
private Instrumentation mInst;
public void performKeyEvent(int keyCode) {
    if (mInst == null) {
        mInst = new Instrumentation();
    }
    mInst.sendKeyDownUpSync(keyCode);
}
```


### Bitmap

### Drawable

## Activity
- 启动 Activity 时，如果添加了 Intent.FLAG_ACTIVITY_NEW_TASK 标记位，startActivityForResult() 之后会立即回调 onActivityResult() 方法
- Android认为不同Task之间的Activity是不能传递数据的

## Service
- ServiceConnection#onServiceDisconnected() 方法不会在 Context#unbindServie() 调用后执行，只会在 service 死掉时执行

## BroadcastReceiver

## Dialog

## OpenGL
- OpenGl ES关于渲染方式有以下两种：
```
RENDERMODE_CONTINUOUSLY和RENDERMODE_WHEN_DIRTY。
默认渲染方式为RENDERMODE_CONTINUOUSLY，这两种渲染的含义是：
RENDERMODE_CONTINUOUSLY：渲染器会不停地渲染场景，
RENDERMODE_WHEN_DIRTY：只有在创建和调用requestRender()时才会刷新。
一般设置为RENDERMODE_WHEN_DIRTY方式，这样不会让CPU一直处于高速运转状态，提高手机电池使用时间和软件整体性能。
```

## Android DataBinding 使用
- 布局跟标签必须是 layout 

```xml
< layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">
< /layout>
```

## Gradle build error

- Program type already present: android.support.v4.app.BackStackRecord$xxx
```groovy
 implementation/api/compile 'com.android.support:support-v4:27.1.1'
```
- Could not find manifest-merger.jar (com.android.tools.build:manifest-merger:26.0.0)
```groovy
google() // 这个仓库放到最前面试试
jcenter()
mavenCentral()
```
- Error:No such property: GradleVersion for class: JetGradlePlugin
```groovy
androidx -> gradle version 4.10.1
```


## Android Runtime Crash
- java.lang.NoClassDefFoundError:failed resolution of :Lorg/apache/http/
```xml
< uses-library android:name="org.apache.http.legacy" android:required="false" />
```
- Unable to add window -- token android.os.BinderProxy@1e45a46 is not valid; is your activity running?
```java
// 当前 activity 已经关闭，仍然调用了 dialog.show() 方法，通常是由于异步调用 引起的，
if (mContext instanceof Activity && !((Activity) mContext).isFinishing()) {
    dialog.show();
}
```
- Receiver not registered: BroadcastReceiver 没有注册就调用了 unregister() 方法
```log
利用标记位，判断是否注册/反注册
```
- java.lang.RuntimeException: android.os.DeadSystemException
```java
没解决
```
- java.lang.UnsupportedOperationException: TextureView doesn't support displaying a background drawable
```xml
< TextureView
    android:id="@+id/mLiveView"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:layout_gravity="center_horizontal"/>
    <!-- 不能设置 background 属性 -->
    <!-- android:background="@mipmap/ic_face_verification" -->
```



## Http 状态码
- 200~300：成功
- 302：
- 306：
- 307：
- 400：bad request 
  ```log
  是多少
  ```
- 401：未认证
- 403：禁止访问
- 413：请求体过大
- 500：服务器内部错误

okhttp:
- CLEARTEXT communication to xxx.xxx.com not permitted by network security policy
```xml
from: https://blog.csdn.net/qq_18620851/article/details/80617549
问题： 由于 Android P 限制了明文流量的网络请求，非加密的流量请求都会被系统禁止掉。
1: 在 res 下新建一个 xml 目录，然后创建一个名为: network_security_config.xml 文件 ，该文件内容如下：
<?xml version="1.0" encoding="utf-8"?>
< network-security-config>
    <base-config cleartextTrafficPermitted="true" />
< /network-security-config>
< application
    ...
    android:networkSecurityConfig="@xml/network_security_config">
< /application>
2：服务器和本地应用都改用 https (推荐)
3：targetSdkVersion 降级回到 27
```

## Java 相关
- java.util.ConcurrentModificationException
```java
// list, vector 在迭代时同步对元素进行修改就会引发此异常
// 1, 单线程下解决方式
Iterator<?> it = list.iterator();
while (it.hasNext()) {
    T t = it.next();
    if (t 满足条件) {
        it.remove();
    }
}
// 2, 多线程下使用 synchronized 关键字或者 lock，或者使用 CopyOnWriteArrayList
```




# Daily Question Record

## View
### TextView
- 文字阴影效果
```xml
<TextView
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:shadowColor="#8000"
    android:shadowDx="3"
    android:shadowDy="3"
    android:shadowRadius="2"
    android:textColor="#00ff00"
    tools:text="a man has no name"/>
```

### EditText
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

### Bitmap

### Drawable

## Activity

## Service

## BroadcastReceiver

## Dialog

## Android DataBinding 使用
- 布局跟标签必须是 layout 
```xml
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">
</layout>
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
<uses-library android:name="org.apache.http.legacy" android:required="false" />
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
<TextureView
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
<network-security-config>
    <base-config cleartextTrafficPermitted="true" />
</network-security-config>
<application
    ...
    android:networkSecurityConfig="@xml/network_security_config">
</application>
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




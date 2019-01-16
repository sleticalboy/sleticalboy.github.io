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

### Bitmap

### Drawable

## Activity

## Service

## BroadcastReceiver

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

## Android Crash
- java.lang.NoClassDefFoundError:failed resolution of :Lorg/apache/http/
```xml
<uses-library android:name="org.apache.http.legacy" android:required="false" />
```

## Http 状态码
- 200~300：成功
- 302：
- 306：
- 307：
- 400：
- 401：未认证
- 403：禁止访问
- 413：请求体过大
- 500：服务器内部错误
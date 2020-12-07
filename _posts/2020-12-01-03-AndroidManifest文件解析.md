---
layout: post
title: 03-AndroidManifest文件解析
author: sleticalboy
date: 2020-12-01 02:31:07
category: android
tags: [framework, pms]
---

# 03-AndroidManifest.xml文件解析分析
> 启动 app 时 AndroidManifest.xml 文件是何时解析的？

## Questtions
- 找不到解析入口在哪里？解决思路：
  - LoadedApk.makeApplication() 方法里有个 clsName, 可以尝试反向查找 clsName 在哪里赋值的【未果】
  - 网上搜一下【未果】
  - 剩下的一种可能： 当应用下载安装完之后相关的信息就存储起来了，等到用的时候直接从缓存查询。
    - 猜测：Launcher 维护了一个数据库，库里放的是桌面上所有展示应用的部分关键信息，
      当用户点击桌面图标启动应用时，拿这部分关键信息取数据库或哪里取出应用的其他信息，
      然后做后续的启动工作。
    - 如果上面的猜测成立，问题就能解决
  - 如果是上面的可能，就要看 apk 安装流程的源码了

## 时序图

### PackageManagerService
- 重要字段
  ```java
  // packageName -> Package 映射
  final ArrayMap<String, PackageParser.Package> mPackages = new ArrayMap<>();
  final PackageHandler mHandler = new PackageHander(); // 子线程
  ```
- PMS 的构造器里做了巨多(600多行代码)的工作，其中就包括扫描 /data/app/ 下所有符合‘包名-flag/base.apk’的文件 ，
  然后由 ParallelPackageParser(内部有一个线程池)调用 PackageParser 解析每一个 apk 并缓存解析出来的 Package 文件等待下次使用。
- PMS 初始化是在 SystemServer.main() 方法里执行的
- 我们平时对 PMS 的调用都是跨进程调用
  ```shell
  # 可以看到，所有的文件属性都是 d 即目录，符合‘/data/app/包名-flag/’格式
  root@NX529J:/data/app # ls -al
  drwxr-xr-x          cn.nubia.accounts-1
  drwxr-xr-x          cn.nubia.browser-1
  drwxr-xr-x          cn.nubia.calendar.preset-1
  drwxr-xr-x          cn.nubia.neopush-1
  drwxr-xr-x          cn.nubia.neoshare-2
  drwxr-xr-x          cn.nubia.paycomponent-1
  drwxr-xr-x          cn.nubia.soundrecorder.preset-1
  drwxr-xr-x          cn.nubia.thememanager-1
  drwxr-xr-x          com.dodola.breakpad-1
  drwxr-xr-x          com.sleticalboy.dailywork-1
  drwxr-xr-x          com.sleticalboy.ic-2
  drwxr-xr-x          com.sleticalboy.noc-2
  drwxr-xr-x          com.sleticalboy.okhttp25.test-1
  drwxr-xr-x          com.sleticalboy.tinker-1
  drwxr-xr-x          com.speedsoftware.rootexplorer-1
  drwxr-xr-x          com.willme.topactivity-1
  drwxr-xr-x          uk.co.senab.photoview.sample-2
  # 下边随便进入一个目录看下，任何一个应用安装完成之后都会有一个 base.apk 文件
  # lib 是一个目录，里面放的是打包到 apk 中的 .so 文件，如果一个应用中没有 .so 那么这个目录将会是个空目录
  root@NX529J:/data/app/com.speedsoftware.rootexplorer-1 # ls -al
  -rw-r--r--  4573584 base.apk
  drwxr-xr-x          lib
  ```

### PackageParser
- 一些静态常量
```java
/** File name in an APK for the Android manifest. */
private static final String ANDROID_MANIFEST_FILENAME = "AndroidManifest.xml";
private static final String TAG_MANIFEST = "manifest";
private static final String TAG_APPLICATION = "application";
private static final String TAG_PACKAGE_VERIFIER = "package-verifier";
private static final String TAG_OVERLAY = "overlay";
private static final String TAG_KEY_SETS = "key-sets";
private static final String TAG_PERMISSION_GROUP = "permission-group";
private static final String TAG_PERMISSION = "permission";
private static final String TAG_PERMISSION_TREE = "permission-tree";
private static final String TAG_USES_PERMISSION = "uses-permission";
private static final String TAG_USES_PERMISSION_SDK_M = "uses-permission-sdk-m";
private static final String TAG_USES_PERMISSION_SDK_23 = "uses-permission-sdk-23";
private static final String TAG_USES_CONFIGURATION = "uses-configuration";
private static final String TAG_USES_FEATURE = "uses-feature";
private static final String TAG_FEATURE_GROUP = "feature-group";
private static final String TAG_USES_SDK = "uses-sdk";
private static final String TAG_SUPPORT_SCREENS = "supports-screens";
private static final String TAG_PROTECTED_BROADCAST = "protected-broadcast";
private static final String TAG_INSTRUMENTATION = "instrumentation";
private static final String TAG_ORIGINAL_PACKAGE = "original-package";
private static final String TAG_ADOPT_PERMISSIONS = "adopt-permissions";
private static final String TAG_USES_GL_TEXTURE = "uses-gl-texture";
private static final String TAG_COMPATIBLE_SCREENS = "compatible-screens";
private static final String TAG_SUPPORTS_INPUT = "supports-input";
private static final String TAG_EAT_COMMENT = "eat-comment";
private static final String TAG_PACKAGE = "package";
private static final String TAG_RESTRICT_UPDATE = "restrict-update";
private static final String TAG_USES_SPLIT = "uses-split";
```
- 几个比较重要的函数
  - parseBaseApk()
  - parseBaseApkChild()
  - parseClusterPackage()
  - parseApkLite(File apkFile, int flags) 解析包名和 application 中的一些信息(split name、安装位置)
  - parseBaseApkCommon() 解析 instrumentation/application/四大组件
  - parseBaseApplication() 解析 application xml tree
  - buildClassName() 三种 case
    - .HelloWorld 省略包名带‘.’
    - HelloWorld 省略包名和‘.’
    - com.xxx.HelloWorld 全名
  - parseActivity() 解析 Activity 和 BroadcastReceiver
  - parseService() 解析 Service
  - parseProvider() 解析 ContentProvider
  - parseActivityAlias()
  - parseMetaData()
  - parseAllMetaData()
  - parseUsesStaticLibrary()
  - parseInstrumentation()
  - parsePermission()
  - parsePermissionGroup()
  - parsePermissionTree()
  - parseUsesPermission()
  - parseKeySets()
  - parseIntent()
  - parsePublicKey()
  - parseVerifer()
  - parsePackage(pdgFile, flag, usesCache)
    - 会先从缓存取，如果取出的不为空则直接返回
    - 如果不存在，则解析 apk 文件为 Package 对象，然后缓存，最后返回
  - parsePackage(pdgFile, flag, /\*false\*/)
    - 调用1：PackageUtils.getPackageInfo() <- PackageInstallerActivity.processPackageUri()
    - 调用2：PMS.scanPackageLI() <- PMS构造器
    - 调用3：PMS.installPackageLI() <- installPackageTracedLI() <- processPendingInstall()
      - 这个方法应该是系统启动的时候初始化 PMS 时调用到的


### Settings

### Intent
- Intent.parseIntent()
```java
public static @NonNull Intent parseIntent(@NonNull Resources resources, @NonNull XmlPullParser parser,
         AttributeSet attrs) throws XmlPullParserException, IOException {
    Intent intent = new Intent();
    // ...
    String packageName = sa.getString(com.android.internal.R.styleable.Intent_targetPackage);
    String className = sa.getString(com.android.internal.R.styleable.Intent_targetClass);
    if (packageName != null && className != null) {
        intent.setComponent(new ComponentName(packageName, className));
    }
    // ...
    return intent;
}
```

## 涉及到的源文件及路径
- PackageManager.java
  - `frameworks/base/core/java/android/content/pm/PackageManager.java`
- PackageManagerService.java
  - `frameworks/base/services/core/java/com/android/server/pm/PackageManagerService.java`
- PackageParser.java
  - `frameworks/base/core/java/android/content/pm/PackageParser.java`
- PackageItemInfo.java
  - `frameworks/base/core/java/android/content/pm/PackageItemInfo.java`
  - PermissionInfo.java
  - PermissionGroupInfo.java
  - InstrumentationInfo.java
  - ApplicationInfo.java
  - ComponentInfo.java
    - ActivityInfo.java
    - ServiceInfo.java
    - ProviderInfo.java
- LauncherApps.java

### launcher 相关
- LauncherApplication.java
  - 注册了一个 LauncherApps.Callback, 当桌面图标发生变化时通知 LauncherModel 刷新数据
  - 注册了一个 ContentObserver, 当收藏发生变化时通知 LauncherModel 刷新数据
- Launcher.java: Launcher 入口页面
- ItemInfo.java 
  - ShortcutInfo.java
  - ApplicationInfo.java
- LauncherModel.java
  - LauncherModel extends BroadcastReceiver {}
  - LauncherModel.LoaderTask implements Runnable {}
- InstallShortcutReceiver.java 安装新应用时会收到广播向数据库添加新数据
- WidgetPreviewLoader.java 数据库类
- AllAppsList.java
- IconCache.java
- LauncherProvider.java

### Package installer 相关
- InstallStart.java 系统安装 apk 入口页面, 会根据 packageUri.getSchema() 判断打开 InstallStaging 还是 PackageInstallerActivity 页面
```xml
< activity android:name=".InstallStart"
        android:exported="true"
        android:excludeFromRecents="true">
    <intent-filter android:priority="1">
        <action android:name="android.intent.action.VIEW" />
        <action android:name="android.intent.action.INSTALL_PACKAGE" />
        <category android:name="android.intent.category.DEFAULT" />
        <data android:scheme="file" />
        <data android:scheme="content" />
        <data android:mimeType="application/vnd.android.package-archive" />
    </intent-filter>
    <intent-filter android:priority="1">
        <action android:name="android.intent.action.INSTALL_PACKAGE" />
        <category android:name="android.intent.category.DEFAULT" />
        <data android:scheme="file" />
        <data android:scheme="package" />
        <data android:scheme="content" />
    </intent-filter>
    <intent-filter android:priority="1">
        <action android:name="android.content.pm.action.CONFIRM_PERMISSIONS" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
< /activity>
```
- InstallStaging.java 负责开启 AsyncTask 拷贝一份临时的 apk 文件，然后将文件路径转换成 android.net.Uri 传递给 PackageInstallerActivity
- PackageInstallerActivity.java 根据 packageUri.getSchema() 处理相应的逻辑
  - package:
    - PackageManager.getPackageInfo()
    - mAppSnippet = ...
  - file: 
    - PackageParser.Package parsed = PackageUtil.getPackageInfo() 解析加缓存
    - mPkgInfo = PackageParser.generatePackageInfo(parsed, ...)
    - mAppSnippet = ...
  - 其他: 

### DownloadManager 相关
- DownloadManager.java 
  - 其实是通过 ContentProvider 实现的 crud 操作
- DownloadProvider.java /\*extends ContentProvider\*/ insert() 时会添加一条任务
- DownloadJobService.java 下载任务管理
- DownloadThread.java 网络获取数据操作
- DownloadReceiver.java 接收下载完成的广播，如果是 apk，打开相应的安装页面

## 总结

## 结语

## 参考资料

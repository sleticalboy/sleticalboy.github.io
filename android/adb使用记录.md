# adb 使用记录
> [九阳神功总纲](https://developer.android.com/studio/command-line/logcat)

- 查看可以被 dump 的 service ：
```dumpsys | grep "DUMP OF SERVICE"```
- 系统应用新添加的Activity后跳转报错解决办法（比如Settings应用）：
```pm install -r system/priv-app/GsSettings/GsSettings.apk```，触发pms重新解析一次apk即可
- logcat 模板
```logcat | grep -i -E '(keyword_1|keyword_2)' --color=always```
- logcat 带颜色输出
```logcat -v color```
- 如何查看Android 系统中 native 层的 Service
```shell
$ getprop | grep init.svc 
init.svc.cameraserver: [running]
init.svc.installd]: [running]
init.svc.lighttpd]: [running]
init.svc.logd-reinit]: [stopped]
init.svc.servicemanager]: [running]
init.svc.storaged]: [running]
init.svc.vold]: [running]
init.svc.wificond]: [running]
init.svc.zygote]: [running]
init.svc.zygote_secondary]: [running]
```
- 对应的java层定义在SystemServer中的 enum State
```java
public enum State {
    RUNNING("running"),
    STOPPING("stopping"),
    STOPPED("stopped"),
    RESTARTING("restarting");
}
```
- 打开开发者模式中的【布局边界开关】
```java
// 自己编译的镜像上可用，测试通过反射方式在三星 S8+ 设备上是无效的
// setprop debug.layout true/false
private void updateLayoutBounds() {
    // show layout bound
    final boolean isEnabled = SystemProperties.getBoolean("debug.layout", false/*default*/);
    SystemProperties.set("debug.layout", Boolean.toString(!isEnabled));
    SystemPropPoker.getInstance().poke();
}
```
- 系统空间达到阈值通知模拟
```shell 
$ dumpsys devicestoragemonitor help                                  
Device storage monitor service (devicestoragemonitor) commands:
  help
    Print this help text.
  force-low [-f]
    Force storage to be low, freezing storage state.
    -f: force a storage change broadcast be sent, prints new sequence.
  force-not-low [-f]
    Force storage to not be low, freezing storage state.
    -f: force a storage change broadcast be sent, prints new sequence.
  reset [-f]
    Unfreeze storage state, returning to current real values.
    -f: force a storage change broadcast be sent, prints new sequence.
```
- 输入事件模拟：
```shell
# 模拟按键事件
[adb shell] input keyevent key_code (key_code 是KeyEvent.java里面的按键数值）
# 模拟输入文本
[adb shell] input text 'string'
```
- 内存泄露检测
```shell
$ dumpsys cpuinfo/meminfo
dumpsys meminfo com.example.app
 Objects
               Views:        1         ViewRootImpl:        0
         AppContexts:        3           Activities:        0
              Assets:        2        AssetManagers:        0
       Local Binders:        6        Proxy Binders:       27
       Parcel memory:        4         Parcel count:       16
    Death Recipients:        2      OpenSSL Sockets:        0
```
- 卸载应用
```[adb shell] pm uninstall package.name```
- 启动activity
```shell
# 通过指定包名和类来打开(原生设置主)页面
[adb shell] am start -n com.android.settings/.Settings
# 通过 action 打开页面
[adb shell] am start -a android.settings.APPLICATION_DEVELOPMENT_SETTINGS
# 发送广播
[adb shell ] am broadcast -a com.android.action.XXX -e[s/i/f/l/z] key1 value1
```
- 清除数据
```pm clear package.name```
- 禁用组件
```pm disable com.android.bluetooth```
- dump 服务
```shell
$ dumpsys timezone_service                                           
Priority TimeZone: America/Atikokan
Current  TimeZone: America/Atikokan
hasZoneInfo: true
Last     TimeZone: 2
Current offset: -18000000
$ dumpsys time_service
priority: 0
0: NTP, 1: SIP, 2: LOCAL
NTP
this time of NTP Result: true
once success NTP Result: true
DHCP NTP Option: 
Main NTP Server: pool.ntp.org
Second NTP: 
Android NTP: time.android.com, used: false
Duration(s) to update: 86400
```
- 打开 WLAN 详细日志记录功能
  - 设置->开发者选项->网络->打开【启用WLAN详细日志记录功能】
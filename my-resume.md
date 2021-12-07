# <center>李斌-Android开发</center>

</br>
<table>
    <tr align="right">
        <th>个人信息</th>
        <td align="left" style="padding-left: 2em">李斌 男 1994/10</td>
        <th>邮&nbsp;&nbsp;&nbsp;&nbsp;箱</th>
        <td align="left" style="padding-left: 2em">sleticalboy@gmail.com</td>
    </tr>
    <tr align="right">
        <th>工作年限</th>
        <td align="left" style="padding-left: 2em">4年</td>
        <th>&nbsp;Github</th>
        <td align="left" style="padding-left: 2em">
            <a href="https://www.github.com/sleticalboy" target="_blank">sleticalboy</a>
        </td>
    </tr>
    <tr align="right">
        <th>毕业院校</th>
        <td align="left" style="padding-left: 2em">华北科技学院·网络工程专业</td>
        <th>电&nbsp;&nbsp;&nbsp;&nbsp;话</th>
        <td align="left" style="padding-left: 2em">13291865918</td>
    </tr>
    <tr align="right">
        <th>期望职位</th>
        <td align="left" style="padding-left: 2em" colspan="3">
        杭州·Android 开发·计算机软件·移动互联网·物联网
        </td>
    </tr>
</table>
</br>

---

# 技术栈

- 熟悉面向对象思想以及常用设计模式；
- 熟悉 JDK 中各种集合、队列、锁、多线程、底层结构及原理；
- 熟悉 Android 基础组件、数据存储、网络编程以及自定义控件；
- 熟悉 Android 跨进程通信开发，了解 binder 架构组成及其底层运行原理；
- 熟悉 Glide、OkHttp、Retrofit、ButterKnife 框架并了解其内部实现原理；
- 熟悉 Android 平台下卡顿、布局、内存优化以及 OOM、ANR、crash 处理技巧；
- 熟练使用 Linux 系统及常用命令并能够进行 Android 源码阅读、修改、编译、调试等工作；
- 了解 Java 内存模型、Java 虚拟机以及常见的垃圾回收算法；
- 了解 Gradle 插件编程并有通过 ASM 字节码框架实现插桩自动埋点技术实践；
- 了解 Android init/servicemanager/zygote/SystemServer 等进程启动流程；
- 了解 Android 输入系统整体流程及工作原理，并能够根据需求对源码进行修改；
- 了解 JNI （Huffman 图片压缩、通过 ioctl 与驱动进行数据传输）和 BLE 开发；
- 了解热修复技术并知晓其内部核心原理，了解组件化/插件化开发和反编译等相关技能；

---

# 个人经历、印象比较深刻的事

1、大学时期组织四人小队骑行新藏线，领略祖国边疆风貌和人文色彩；
2、大学时期担任自行车协会组织社团活动；
3、大学时期参与京东高校联合举办的自行车越野赛事，取得第八名的成绩；

# 工作经历

## [深圳市潮流网络技术有限公司杭州分公司][3] (2019/10 ~ 2021/4)

### GVC3220 项目 Settings 应用维护

- **职责**
  - 负责 Settings 应用开发和维护工作；
  - 根据产品需求实现部分功能、开发自测完成提测以及解决 bug；
- **技术点**
  - 使用 MediaPlayer + AudioPlayer 实现系统铃声播放；
  - 参考 Android 原生 Settings 完成 WiFi 模块功能改造适配；
  - 使用 Messenger 实现 Settings 应用与 GMD 蓝牙固件升级子模块之间跨进程通信；
- **业绩**
  - 完成 GMD 蓝牙固件升级模块开发任务；
  - 期间修复 bug 200+，完成需求开发 5 个；

### [GVC3220][5] 项目 GMDSettings 模块

GMD 设备与 GVC3220 设备通过蓝牙、2.4G 完成通信即音频数据传输

- **职责**
  - 根据产品需求设计、架构、开发并维护 GMD 设置模块；
  - 与框架、多媒体、驱动同事沟通开发难点、制定数据传输协议以及功能接口；
  - 功能提测、bug fix、开发及使用文档输出；
- **技术点**
  - 设计模式实践：享元模式、责任链模型、观察者模型、生产者消费者模型以及静态代理；
  - 使用 AIDL 实现 app 进程与 avs 服务之间的跨进调用；
  - 使用蓝牙 BLE 扫描、GATT 连接及通过 GATT 属性服务向 GMD 获取和传递信息；
  - 使用 JNI 与驱动程序进行交互：下发指令、读取 2.4G 通信状态等；
  - 反射+注解实现运行时控件赋值、设置点击事件、资源绑定以及 Bean 与数据库表的关联；
- **业绩**
  - 独立开发并维护 GMD 子模块，实现全部功能及修复已知的所有问题；

### AirMedia 项目出厂自动化测试程序开发维护

- **职责**
  - 基于 3220 项目移植开发 ATE 测试以及出厂程序应用；
  - 随时关注并解答产线以及测试同事反馈的技术问题，输出用户使用文档；
- **技术点**
  - 使用 Service 在后台接收 pc 端发出 dbus 消息并在 app 端自动完成指定测试操作；
  - 使用文件读写的方式向内核通知 LED 灯点亮与灭、风扇的使用与关闭；
  - 使用 UEventObserver 监听内核产生的外接设备插拔事件实现 USB 接口检测功能；

## [北京德惠众合信息技术有限公司][2] (2017/6 ~ 2019/9)

敏行客户端是一款集`即时通讯`、`敏邮`、`公司通讯录`、`工作圈`、`应用商店`、 `新闻资讯`
等功能于一体的移动化办公软件；面向的客户主要为银行、政府等企业机关。

- **职责**
  - APP 迭代维护，协同测试人员测试并修复 bug；
  - 参与项目需求分析及评估、部分功能框架的设计与搭建;
  - 根据项目进行需求分析、技术调研、文档编写、功能实现与优化；
- **技术点**
  - 使用 LiveData/Lifecycle + MVP 架构重构项目部分页面；
  - 使用透明 Fragment 实现 Android 6.0+ 动态权限申请适配；
  - 自定义 GridView 实现聊天页面输入法类微信 `表情面板` 功能
  - 使用 LeakCanary 泄露内存检测，累计解决 30 余处内存泄露释放内存 20M+；
  - 网络/图片库基础组件建设：通用请求和响应封装、抽取抽象层、动态替换底层实现；
  - 使用 libjpeg 库压缩聊天和朋友圈图片，极大提高图片加载与发送速度，缓解服务端压力；

---

## 自我评价

- 工作有激情，有团队精神并且善于沟通合作；
- 学习能力强，能独立钻研，喜欢通过阅读源码来解决问题；

[1]: https://github.com/sleticalboy
[2]: https://www.minxing365.com/web/
[3]: http://www.grandstream.cn/
[4]: http://www.grandstream.cn/Prd_view.aspx?id=232
[5]: https://baijiahao.baidu.com/s?id=1702728434712645427&wfr=spider&for=pc
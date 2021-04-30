# <center>李斌-Android开发</center>
</br>
<table>
    <tr align="right">
        <th>个人信息</th>
        <td align="left" style="padding-left: 2em">李斌 男 1994/10</td>
        <th>邮箱</th>
        <td align="left" style="padding-left: 2em">sleticalboy@gmail.com</td>
    </tr>
    <tr align="right">
        <th>工作年限</th>
        <td align="left" style="padding-left: 2em">4年</td>
        <th>Github</th>
        <td align="left" style="padding-left: 2em">
            <a href="https://www.github.com/sleticalboy" target="_blank">sleticalboy</a>
        </td>
    </tr>
    <tr align="right">
        <th>毕业院校</th>
        <td align="left" style="padding-left: 2em">华北科技学院·本科·网络工程专业</td>
        <th>&nbsp;&nbsp;手机/微信</th>
        <td align="left" style="padding-left: 2em">18911233403</td>
    </tr>
    <tr align="right">
        <th>期望职位</th>
        <td align="left" style="padding-left: 2em" colspan="3">
        Android 开发工程师·杭州·计算机软件·移动互联网·物联网
        </td>
    </tr>
</table>
</br>

---

## 个人优势

- 熟悉面向对象思想以及常用设计模式并在工作中有所实践；
- 熟悉 JDK 中各种集合、队列、锁、多线程、底层结构及原理；
- 熟悉 Android 基础组件、数据存储、网络编程以及自定义控件；
- 熟悉 Android 平台下卡顿、布局、内存优化以及 OOM、ANR、crash 处理技巧；
- 熟悉 OkHttp、Retrofit、Glide、ButterKnife 开源框架并了解其内部实现原理；
- 熟悉 Linux 常用命令并能够熟练进行 Android 源码阅读、修改、编译、调试等工作；
- 熟悉 Android 跨进程通信开发，了解 binder 架构组成及其底层运行原理；
- 了解 Android 输入系统整体启动流程及工作原理，并能够根据需求对源码进行修改；
- 了解 Java 内存模型、Java 虚拟机以及常见的垃圾回收算法；
- 了解 JNI （Huffman 图片压缩、通过 ioctl 与驱动进行数据传输）和 BLE 开发；
- 了解热修复技术并知晓其内部核心原理，了解组件化/插件化开发和反编译等相关技能；
- 了解 Gradle 插件编程并有通过 ASM 字节码框架实现插桩自动埋点技术实践；

---

## 工作经历

### [深圳市潮流网络技术有限公司杭州分公司][3] (2019/10 ~ 2021/4)

参与 GVC 和 AirMedia 系列产品系统应用开发与维护工作

#### GVC3220 项目 Settings 应用维护

- **职责**
  - 参考 3210 项目移植开发 Settings 应用到 3220 项目；
  - 根据产品需求实现部分功能、开发自测完成提测以及解决 bug；
- **技术点**
  - 使用 MediaPlayer + AudioPlayer 实现系统铃声播放；
  - 参考 Android 原生 Settings 完成 WiFi 模块功能改造适配；
  - 使用 Messenger 实现 Settings 应用与 GMD 蓝牙固件升级子模块之间跨进程通信；
- **业绩**
  - 完成 GMD 蓝牙固件升级子模块开发任务；
  - 期间修复 bug 200+，完成需求开发 5 个

#### GVC3220 项目 GMDSettings 子模块独立开发

20 年 3 月开始着手开发 GMD 功能，期间与框架组、驱动组、多媒体组等多方同事协同开发，
10 月份该模块趋于稳定，12 月份 3220 项目 beta。今年 2 月份开始对 GMD 模块进行架构和
功能重构，目前重构工作已完成。

- **职责**
  - 根据产品需求独立开发并维护 GMD 子模块；
  - 与多媒体同事制定数据传输协议以及功能接口；
  - 与框架、多媒体以及驱动同事沟通开发难点；
  - 功能提测以及解决 bug，整理开发文档；
- **技术点**
  - 使用 AIDL 实现跨进程调用 avs 发送超声波接口；
  - 使用蓝牙 BLE 扫描、GATT 连接及通过 GATT 属性服务获取和传递信息；
  - 使用 JNI 与驱动进行交互：下发指令、读取 2.4G 通信状态等；
  - 自定义注解+反射技术实现自动 findViewById、给 View 设置点击事件、资源绑定；
  - 自定义注解+反射技术实现 JavaBean 对象与 SQLite 数据库表的关联；
  - 设计模式实践：享元模式、责任链模型、观察者模型、生产者消费者模型以及静态代理；
- **业绩**
  - 独立开发并维护 GMD 子模块所有功能；
  - 实现 GMD 功能 12 个，修复问题 100+；

#### AirMedia 项目 ATE测试及出厂程序开发维护

20 年 12 月下旬接到该任务，春节前夕开发测试完成交至产线。

- **职责**
  - 基于 3220 项目移植开发 ATE 测试以及出厂程序应用；
  - 及时与其他部门同事的沟通协作，保证应用按照时间线完成；
  - 随时关注并解答产线以及测试同事反馈的技术问题；
  - 编写用户使用指导文档；
- **技术点**
  - 使用 Service 在后台接收 pc 端 ate 上位机的 dbus 消息并在 app 端自动完成指定操作；
  - 使用 UEventObserver 监听内核产生的外接设备插拔事件实现 USB 接口检测功能；
  - 使用文件读写的方式向内核通知 LED 灯点亮与灭、风扇的使用与关闭；
  - 自定义注解+反射实现 setContentView/findViewById 功能；

### [北京德惠众合信息技术有限公司][2] (2017/2 ~ 2019/9)

敏行客户端是一款集`即时通讯`、`敏邮`、`公司通讯录`、`工作圈`、`应用商店`、 `新闻资讯`
等功能于一体的移动化办公软件；面向的客户主要为银行、政府等企业机关。

- **基于敏行 APP 进行定制化开发**
- **项目职责**
  - 参与项目需求分析及评估、部分功能框架的设计与搭建;
  - 根据项目进行需求分析、技术调研、文档编写、功能实现与优化；
  - 协同测试人员测试，修改项目 bug，完善项目；
  - APP 版本迭代及出差驻场协同项目经理完成客户需求
- **技术点**
  - 自定义 GridView 实现聊天页面输入法类微信 `表情面板` 功能
  - LeakCanary 内存泄露检测、累计解决 30 余处内存泄露场景释放内存 20M+
  - 使用鲁班压缩优化聊天和朋友圈送图片大小，极大提高图片发送和加载速度
  - 使用透明 Fragment 实现 Android 6.0+ 动态权限申请适配
  - 网络基础组件建设：通用请求和响应封装、抽取抽象层、兼容旧版本、动态替换底层实现
  - 图片加载基础组件建设：与网络基础组件思路大致一致
  - MVC、MVP、MVVM 架构在项目中实践

---

## 自我评价

- 工作有激情、学习能力强，有团队精神并且善于沟通合作；
- 能独立钻研，没有什么问题是不能通过阅读源码来解决的；

[1]: https://github.com/sleticalboy
[2]: https://www.minxing365.com/web/
[3]: http://www.grandstream.cn/

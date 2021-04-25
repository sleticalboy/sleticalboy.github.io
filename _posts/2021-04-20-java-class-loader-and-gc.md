---
layout: post
title: Java 类加载与垃圾回收
author: sleticalboy
date: 2021-04-20 10:57:10 +0800
category: java
tags: [java]
---

## Android 类加载

```java
protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
    // 1、如果类已被加载，则直接返回
    // First, check if the class has already been loaded
    Class<?> c = findLoadedClass(name);
    if (c == null) {
        try {
            if (parent != null) {
                // 2.1、如果父类不为空则委托父类加载
                c = parent.loadClass(name, false);
            } else {
                // 2.2、委派给启动类加载器加载，Android 这里永远返回 null
                c = findBootstrapClassOrNull(name);
            }
        } catch (ClassNotFoundException e) {
            // ClassNotFoundException thrown if class not found
            // from the non-null parent class loader
        }
        // 3、仍未加载到，则通过 findClass() 自己来加载
        if (c == null) {
            // If still not found, then invoke findClass in order
            // to find the class.
            c = findClass(name);
        }
    }
    return c;
}
```

## 调用流程

```
findClass() -> BaseDexClassLoader#findClass() ->
DexPathList#findClass() -> DexPathList.Element#findClass() ->
DexFile#loadBinaryClassName() -> #defineClass() -> #defineClassNative()
art/runtime/native/dalvik_system_DexFile.cc#defineClassNative()

// 继承结构
   ClassLoader
       ^
       |
BaseDexClassLoader
       ^
       |
 PathClassLoader

PathClassLoader 中实际是调用父类 BaseDexClassLoader#findClass() 来加载类的，其核心实现是在 DexPathList 类中，
从该类的 dexElements 数组中(Element) 中加载类，热修复技术的核心在于将修复的类打包为 dex 文件并插入到 dexElements 
数组的前面

Android 中通过自定义 ClassLoader 继承 PathClassLoader 可以加载 apk 之外的类，这是插件化技术的核心

Android 中无启动类加载器
Android 中默认父加载器为 BootClassLoader
Android 中 app 类加载器为 PathClassLoader
```

## 双亲委派模型

- 1、加载类时先查看是否已加载过；
- 2、未加载过：
  - 2.1、若存在父加载器则先交给父加载器尝试加载；（Android 中默认父加载器为 BootClassLoader）
  - 2.2、若不存在父加载器则交给启动类加载器加载；（Android 中无启动类加载器）
- 3、若父加载器和启动类加载器都加载不到时，才会交给自己加载 findClass()；

### 有什么好处？

- 1、避免类重复加载；
- 2、保护核心类不被恶意破坏；

## 类加载过程
- 1、装载：查找和导入 .class 文件
- 2、链接：把 .class 文件二进制数据合并到 JRE 中
  - 2.1、校验：检查载入 .class 二进制文件正确性
  - 2.2、准备：给静态变量分配存储空间并赋初值
  - 2.3、解析：将符号引用转换为直接（地址）引用
- 3、初始化：按顺序对类的静态变量、静态代码块进行初始化操作

## 引申

### 类加载的方式有几种？

- 1、Class.forName()

### 类卸载？

- 1、加载类的 ClassLoader 被 GC 回收；
- 2、该类所有的实例都被 GC，即 JVM 中不存在该类的任何实例；
- 3、该类的 Class 对象没有在任何地方被引用，如不能在任何地方通过反射访问该类的方法；

### 何时触发初类的始化？

- 1、JVM 启动时对包含 main(String[] args) 方法的类进行初始化；
- 2、new/getstatic/putstatic/invokestatic，即：new 对象、获取/设置静态变量、调用静态方法
- 3、Java 反射机制对类进行反射调用时可能触发对类的初始化；
- 4、初始化子类时，可能触发对父类的初始化；

### static 变量/代码块初始化的顺序？

- 从上到下的顺序来初始化

## 运行时数据区

程序计数器、JVM 栈、本地方法栈、堆区、方法区、运行时常量区

### 程序计数器

作用：记录下一条要执行的字节码指令

字节码解释器的工作：改变 PC 计数器来选取下一条要执行的字节码指令

多线程：通过轮流切换并分配处理器执行时间的方式实现的

每个线程会有独立的 PC 计数器，因此程序计数器是线程私有的

native 方法时：PC 计数器指向 Undefined
Java 方法时：PC 计数器指向下一条指令地址

不会 OOM，但是会 SOE

### 虚拟机栈

每一条 JVM 线程都有一个私有的虚拟机栈，生命周期与线程一致

作用：存储线程中 Java 方法调用的状态，包括局部变量、参数、返回值以及中间运算结果

### 本地方法栈

作用：用来支持 native 语言

Hotspot 将本地方法栈和虚拟机栈合二为一

### 堆区

堆是所有线程所共享的运行时内存区域

作用：存放对象实例以及数组

堆中存储的对象被 GC 管理

内存回收角度：可粗略分为新生代和老年代
内存分配角度：多个线程私有的分配缓冲区

划分的目的：更快的回收或者分配内存

堆容量：可固定、可扩展
堆使用的内存在物理上不需要连续，逻辑上连续即可

当空间不足时会出现 OOM 异常

### 方法区

方法去是所有线程共享的运行时内存区域

作用：存储已经被 JVM 加载的类的结构信息，包括运行时常量池、字段、方法信息、静态变量等数据

方法区是堆区的逻辑组成部分，在物理上不需要连续

## 运行时常量池

是方法区的一部分，可以理解为是类或接口的常量池的运行时表现形式

## GC 算法

### 如何判断一个对象是否是垃圾对象？

1、可达性分析法

是否存在到达 GC Roots 的路径

- GC Roots 有哪些？
  - 线程
  - 虚拟机栈
  - 本地方法栈
  - 系统类
  - 类变量

2、引用计数法

引用计数为 0 则为垃圾对象

### 标记-清除算法

当堆中有效内存空间被耗尽时，就会进行垃圾回收工作

- 标记垃圾对象：遍历所有的 GC Roots，然后将所有 GC Roots 可达对象标记为存活对象
- 清除垃圾对象：遍历堆中所有对象，将没有标记的对象全部清除掉

缺点：

- 效率低、stop the world
- 产生内存碎片（清理出的空闲内存是不连续的）、分配大对象时容易导致 GC

### 复制算法

背景：解决`标记-清除`算法的缺点

- 将内存空间分为活动区间和空闲区间，活动区间用于存储动态分配的对象；
- 遍历活动空间并将活着的对象全部复制到空闲区间且按照内存地址`依次排列`；
- GC 将更新存活对象的内存引用指向新的内存地址

缺点：

- 空间利用率减少一半
- 要求对象存活率非常低

### 标记-整理算法

- 标记：遍历所有的 GC Roots，将存活的对象标记；
- 整理：移动所有存活的对象且按照内存地址依次序排列，然后将末端地址以后的内存全部回收

弥补了内存分散的缺点和内存减半的缺点

缺点：

- 效率不高

**总结**：

- 算法效率：复制 > 标记-整理 > 标记-清除
- 内存整齐度：复制 = 标记-整理 > 标记-清除
- 内存利用率：标记-整理 = 标记-清除 > 复制

### 分代收集算法

- 新生代：朝生夕死的对象，如：方法中的局部变量
- 老年代：单例对象、Class 对象
- 永久代：string 常量池中的对象、享元对象
- 元空间：Java 1.8 出现，用于替换永久代

minor GC：针对新生代

major GC/Full GC：针对老年代，偶尔会对永久带回收

多次 minor GC 后会触发 major GC

### Stop The World

停止除了 GC 外的所有线程，只进行 GC 工作

内存优化：尽量减少 GC 次数

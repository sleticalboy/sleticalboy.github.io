---
layout: post
title: Java 数据结构和算法
author: sleticalboy
date: 2021-04-13 21:54:32 +0800
category: arithmetic
tags: [java]
---

## 数据结构

### 数组

ArrayList

### 单链表

### 双链表

LinkedList

### 栈

先进后出

### 队列

## 算法

### 数组排序相关

1、冒泡

2、快排

### 数组其他

1、twosum

- 暴力法
- 借助 HashMap

### 链表相关

1、链表是否有环

- 暴力法
- 借助 HashMap（参考 HashSet 实现）
- 快慢指针法

2、两个链表是否相交

- 暴力法
- 借助 HashMap（参考 HashSet 实现）
- 将其中任一链表头尾相连，然后判断另一个链表是否有环
- 求出两个链表的长度差 n，长链表先走 n 步，然后短链表开始走，如果相交，则 m 步后两者
  指向同一个元素
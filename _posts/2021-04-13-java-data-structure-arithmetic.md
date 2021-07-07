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

3、二分查找

```java
public static int binarySearch(int[] args, int target) {
  if (args == null || args.length == 0) return -1;
  int from = 0, to = args.length - 1, mid = 0;
  while (from <= to) {
    mid = (from + to) / 2;
    if (target > args[mid]) {
      from = mid + 1;
    } else if (target < args[mid]) {
      to = mid - 1;
    } else {
      return mid;
    }
  }
  return -1;
}
```

3、twosum

- 暴力法
- 借助 HashMap

### 链表相关

```java
public class ListNode<T> {
    public ListNode<T> next;
    public final T value;

    public ListNode(T value) {
        this.value = value;
    }
}
```

1、链表是否有环

- 暴力法
- 借助 HashMap（参考 HashSet 实现）

- 快慢指针法

```java
public static <T> boolean hasCycle(ListNode<T> head) {
    if (head == null || head.next == null) return false;
    ListNode<T> slow = head, fast = head;
    while (fast != null && fast.next != null) {
        slow = slow.next;
        fast = fast.next.next;
        if (fast == slow) return true;
    }
    return false;
}
```

2、两个链表是否相交

- 暴力法
- 借助 HashMap（参考 HashSet 实现）
- 将其中任一链表头尾相连，然后判断另一个链表是否有环
- 求出两个链表的长度差 n，长链表先走 n 步，然后短链表开始走，如果相交，则 m 步后两者
  指向同一个元素

3、反转链表

- 借助 ArrayList 存储元素，之后倒序遍历构建链表

```java
public static <T> ListNode<T> reverse(ListNode<T> head) {
    if (head == null || head.next == null) return head;
    List<ListNode<T> temp = new ArrayList<>();
    for (ListNode<T> h = head; h != null; h = h.next) {
        temp.add(h);
    }
    // 倒叙遍历所有的节点，构建链表
    ListNode h = null, cur = null;
    for (int i = temp.size() - 1; i >= 0; i--) {
        ListNode<T> ln = temp.get(i);
        ln.next = null;
        if (h == null && cur == null) {
            h = cur = ln;
        } else {
            cur.next = ln;
            cur = ln;
            cur.next = null;
        }
    }
    return h;   
}
```

- 双指针法

```java
public static <T> ListNode<T> reverse(ListNode<T> head) {
    if (head == null || head.next == null) return head;
    ListNode<T> newHead, removed;
    do {
        removed = head;
        head = removed.next;
        removed.next = newHead;
        newHead = removed;
    } while(head != null);
    return newHead;
}
```

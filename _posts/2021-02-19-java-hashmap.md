---
layout: post
title: Java 容器之 HashMap
author: sleticalboy
date: 2021-02-19 21:17:56 +0800
category: java
tags: [java]
---


## HashMap.put() 方法

```java
public V put(K key, V value) {
    // 首先计算 key 的 hash 值，然后调用 putVal() 存值
    return putVal(hash(key), key, value, false, true);
}

final V putVal(int hash, K key, V value, boolean onlyIfAbsent, boolean evict) {
    // table 表示原始数组
    // tab 表示本地数组，即原始数组的本地拷贝
    // p 表示 key 在原数组中对应的 Node<K, V>
    // n 表示数组长度
    // i 表示 key 对应的数组下标
    Node<K,V>[] tab; Node<K,V> p; int n, i;
    // 如果原数组为空或原数组长度为 0，则调用 resize() 初始化数组
    if ((tab = table) == null || (n = tab.length) == 0)
        n = (tab = resize()).length;
    // 如果 key 对应数组中元素为 null，则调用 newNode() 创建一个 Node<K, V> 元素
    if ((p = tab[i = (n - 1) & hash]) == null)
        tab[i] = newNode(hash, key, value, null);
    // key 对应数组中的元素不为 null
    else {
        // e 表示 key 对应当前数组中的 node
        // k 表示 key
        Node<K,V> e; K k;
        // 如果 key 的 hash 值相同并且 key 的地址和内容相同（找到了）
        if (p.hash == hash && ((k = p.key) == key || (key != null && key.equals(k))))
            e = p;
        else if (p instanceof TreeNode)
            // 如果当前节点是红黑树，则将元素存储在 tree 中
            e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);
        else {
            // 如果当前元素是链表，则将元素存储在 list 中，同时检查是否需要将 
            // list 装换为 tree
            for (int binCount = 0; ; ++binCount) { // binCount 表示链表长度
                if ((e = p.next) == null) {
                    // 如果当前链表只有一个元素，则将新元素存到链表的下一个位置
                    p.next = newNode(hash, key, value, null);
                    if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st
                        // 如果 binCount 大于等于阈值，则把链表转换成红黑树
                        treeifyBin(tab, hash);
                    break;
                }
                // 如果 key 的 hash 值相同并且 key 的地址和内容相同（找到了）
                if (e.hash == hash && ((k = e.key) == key || (key != null && key.equals(k))))
                    break;
                p = e;
            }
        }
        // key 对应的 node 存在
        if (e != null) { // existing mapping for key
            V oldValue = e.value;
            // 当且仅当 e.value 为空时，才将旧值替换为新
            if (!onlyIfAbsent || oldValue == null)
                e.value = value;
            // 为 LinkedHashMap 保留的回调接口
            afterNodeAccess(e);
            // 返回旧值
            return oldValue;
        }
    }
    ++modCount;
    // 如果插入后数组长度大于 threshold，则调用 resize() 重新生成数组
    if (++size > threshold)
        resize();
    // 为 LinkedHashMap 保留的回调接口
    afterNodeInsertion(evict);
    return null;
}
```

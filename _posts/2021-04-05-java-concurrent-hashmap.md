---
layout: post
title: Java 并发容器之 ConcurrentHashMap（java 8）
author: sleticalboy
date: 2021-04-05 22:50:35 +0800
category: java
tags: [java]
---

## `#put()` 方法

```java
public V put(K key, V value) {
    // 插入数据
    return putVal(key, value, false);
}

final V putVal(K key, V value, boolean onlyIfAbsent) {
    // key 和 value 均不能为 null，HashMap key 和 value 均可为 null
    if (key == null || value == null) throw new NullPointerException();
    // 计算 hash 值，比 HashMap 多了一步
    int hash = spread(key.hashCode());
    int binCount = 0; // 节点数，用于控制链表进化为 tree 或者 tree 退化为链表
    for (Node<K,V>[] tab = table;;) { // 遍历数组
        // n 表示数组长度，i 表示 (n - 1) & hash
        // f 表示 table[i] 对应的元素，fh 表示 table[i].hash
        Node<K,V> f; int n, i, fh;
        // 首次用到时才初始化数组，initTable()
        if (tab == null || (n = tab.length) == 0) {tab = initTable();}
        // 检查数组中对应位置是否有元素，tabAt() 用于获取 table[i] 元素，内部实现为 Unsafe 操作
        // 可以简单理解为 f = tab[i = (n - 1) & hash]
        else if ((f = tabAt(tab, i = (n - 1) & hash)) == null) {
            // 若数组中该位置元素为 null，则使用 cas 操作插入新元素到该位置
            if (casTabAt(tab, i, null, new Node<K,V>(hash, key, value, null)))
                break;// no lock when adding to empty bin
        } else if ((fh = f.hash) == MOVED)
            // 数组此时正在扩容，则并发进行元素复制
            tab = helpTransfer(tab, f);
        else {
            V oldVal = null; // key 对应的旧值
            synchronized (f) { // 锁对象为数组中的当前行
                if (tabAt(tab, i) == f) { // 再次取出 table[i] 与 f 进行比较
                    if (fh >= 0) { // 链表
                        binCount = 1;
                        for (Node<K,V> e = f;; ++binCount) {
                            K ek;
                            if (e.hash == hash && // 若 key 相同，则覆盖 value
                                    ((ek = e.key) == key || (ek != null && key.equals(ek)))) {
                                oldVal = e.val;
                                if (!onlyIfAbsent) e.val = value;
                                break;
                            }
                            Node<K,V> pred = e;
                            if ((e = e.next) == null) { // 插入到链表尾部
                                pred.next = new Node<K,V>(hash, key, value, null);
                                break;
                            }
                        }
                    } else if (f instanceof TreeBin) { // tree
                        Node<K,V> p;
                        binCount = 2;
                        // 插入到 tree 中
                        if ((p = ((TreeBin<K,V>)f).putTreeVal(hash, key, value)) != null) {
                            oldVal = p.val;
                            if (!onlyIfAbsent) p.val = value;
                        }
                    } else if (f instanceof ReservationNode)
                        throw new IllegalStateException("Recursive update");
                }
            }
            if (binCount != 0) {
                // 节点数目 >= 8 时，链表进化为 tree
                if (binCount >= TREEIFY_THRESHOLD/*tree*/) treeifyBin(tab, i);
                if (oldVal != null) return oldVal;
                break;
            }
        }
    }
    addCount(1L, binCount);
    return null;
}
```
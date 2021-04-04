---
layout: post
title: Java 容器之 HashMap（java 8）
author: sleticalboy
date: 2021-02-19 21:17:56 +0800
category: java
tags: [java]
---

## 重要的字段

### `transient Node<K,V>[] table`

首次使用时才初始化，在 resize() 中重新初始化，数组长度为 0 或 2 的 n 次方

### `transient int size`

map 的大小即键值对的个数

### `final float loadFactor`

加载因子，用于 hash 表扩容

### `transient int threshold`

下次数组扩容时的临界值，当达到此临界值时需要对 hash 表进行扩容（capacity * loadFactor）

## HashMap#put() 方法

作用：添加元素

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
                    // 如果当前链表只有一个元素，则将新元素存到链表的尾部（尾插法）
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

## HashMap#get() 方法

作用：根据 key 获取 value

```java
public V get(Object key) {
    Node<K,V> e;
    // 通过 key 的 hash 值获取到存储节点，从而获取 value
    return (e = getNode(hash(key), key)) == null ? null : e.value;
}

final Node<K,V> getNode(int hash, Object key) {
    // table 表示原始数组
    // tab 表示本地数组，即原始数组的本地拷贝
    // p 表示 key 在原数组中对应的 Node<K, V>
    // n 表示数组长度
    // i 表示 key 对应的数组下标
    Node<K,V>[] tab; Node<K,V> first, e; int n; K k;
    // tab 不为 null 且 tab.length 大于 0 并且 key 有对应的节点
    if ((tab = table) != null && (n = tab.length) > 0 &&
        (first = tab[(n - 1) & hash]) != null) {
        // 如果第一个节点就命中，则直接返回该节点
        if (first.hash == hash && ((k = first.key) == key || (key != null && key.equals(k))))
            return first;
        if ((e = first.next) != null) {
            // 如果第一个节点是红黑树，则从树中查询
            if (first instanceof TreeNode)
                return ((TreeNode<K,V>)first).getTreeNode(hash, key);
            // 如果第一个节点是链表，则从链表中查询
            do {
                if (e.hash == hash && ((k = e.key) == key || (key != null && key.equals(k))))
                    return e;
            } while ((e = e.next) != null);
        }
    }
    // 否则直接返回 null
    return null;
}
```

## HashMap#treeifyBin() 方法

作用：将链表转换成红黑树

```java
final void treeifyBin(Node<K,V>[] tab, int hash) {
    // n 表示数组长度
    // index = (tab.length - 1) & hash
    // e 表示 key 对应当前的 node 节点
    int n, index; Node<K,V> e;
    // 数组为空或数组长度小于 64，则扩容
    if (tab == null || (n = tab.length) < MIN_TREEIFY_CAPACITY/*64*/)
        resize();
    // 根据 key 的 hash 值找节点，如果节点存在则执行
    else if ((e = tab[index = (n - 1) & hash]) != null) {
        // hd 表示树根节点
        // tl 表示红黑树的左子叶节点
        TreeNode<K,V> hd = null, tl = null;
        // 循环整个链表，将其转换成红黑树树
        do {
            // 将链表节点替换成树节点
            TreeNode<K,V> p = replacementTreeNode(e, null);
            // 如果 tl 为 null（首次进入循环，即链表的头结点）则将 p 赋值给 hd
            if (tl == null) hd = p;
            else {
                p.prev = tl;
                tl.next = p;
            }
            tl = p;
        } while ((e = e.next) != null);
        if ((tab[index] = hd) != null) hd.treeify(tab);
    }
}
```

## HashMap#resize() 方法

作用：扩容

```java
final Node<K, V>[] resize() {
    // oldTab 表示原始数组，oldCap 表示原始容量
    Node<K,V>[] oldTab = table;
    int oldCap = (oldTab == null) ? 0 : oldTab.length;
    // 原阈值（threshold 默认为 DEFAULT_INITIAL_CAPACITY 即 16）
    int oldThr = threshold;
    int newCap, newThr = 0; // 新容量和新阈值
    if (oldCap > 0) { // 原始容量大于 0
        // 原始容量大于 1 << 30，将 threshold 置为 Integer.MAX_VALUE 并返回原始数组
        if (oldCap >= MAXIMUM_CAPACITY/*1 << 30*/) {
            threshold = Integer.MAX_VALUE;
            return oldTab;
        }
        // 新容量扩展为原始容量的 2 倍后，如果小于 1 << 30 且原容量大于等于 16
        else if ((newCap = oldCap << 1) < MAXIMUM_CAPACITY/*1 << 30*/ &&
                 oldCap >= DEFAULT_INITIAL_CAPACITY/*16*/)
            // 将新阈值扩展为原阈值的 2 倍
            newThr = oldThr << 1; // double threshold
    }
    // 原容量等于 0 且原阈值大于 0
    else if (oldThr > 0) // initial capacity was placed in threshold
        newCap = oldThr; // 将新容量置为原阈值大小，默认为 16
    // 原阈值等于 0，即第一次调用 resize() 方法
    else {               // zero initial threshold signifies using defaults
        newCap = DEFAULT_INITIAL_CAPACITY/*16*/;
        newThr = (int)(DEFAULT_LOAD_FACTOR * DEFAULT_INITIAL_CAPACITY)/*12*/;
    }
    if (newThr == 0) { // 如果新阈值仍等于 0 时，执行兜底操作
        float ft = (float)newCap * loadFactor;
        newThr = (newCap < MAXIMUM_CAPACITY && ft < (float)MAXIMUM_CAPACITY ?
                  (int)ft : Integer.MAX_VALUE);
    }
    threshold = newThr; // 将新阈值赋值给 threshold
    @SuppressWarnings({"rawtypes", "unchecked"})
    Node<K, V>[] newTab = (Node<K, V>[]) new Node[newCap]; // 根据新容量重新生成数组
    table = newTab; // 将新数组赋值给 table
    if (oldTab != null) { // 将原数组中的元素转存到新数组中，并将原数组中的元素置空
        for (int j = 0; j < oldCap; ++j) {
            Node<K,V> e; // 临时变量用于存储从原数组取出的元素
            if ((e = oldTab[j]) != null) {
                oldTab[j] = null; // 置空原数组原色
                if (e.next == null) // key 对应只有一个 node
                    newTab[e.hash & (newCap - 1)] = e;
                else if (e instanceof TreeNode) // key 对应的是一个 tree
                    // 操作 tree
                    ((TreeNode<K,V>)e).split(this, newTab, j, oldCap);
                else { // preserve order
                    // key 对应的是一个 list，保留原始顺序存储
                    Node<K,V> loHead = null, loTail = null;
                    Node<K,V> hiHead = null, hiTail = null;
                    Node<K,V> next;
                    // 操作 list
                    do {
                        next = e.next;
                        if ((e.hash & oldCap) == 0) {
                            if (loTail == null) loHead = e;
                            else loTail.next = e;
                            loTail = e;
                        } else {
                            if (hiTail == null) hiHead = e;
                            else hiTail.next = e;
                            hiTail = e;
                        }
                    } while ((e = next) != null);
                    if (loTail != null) {
                        loTail.next = null;
                        newTab[j] = loHead;
                    }
                    if (hiTail != null) {
                        hiTail.next = null;
                        newTab[j + oldCap] = hiHead;
                    }
                }
            }
        }
    }
    // 返回新数组
    return newTab;
}
```

## HashMap#TreeNode

### 性质

1、红黑树数据结构，有如下 4 个特点：

- 1、每个节点必然是红色或者黑色；
- 2、根节点必然为黑色；
- 3、若一个节点为红色，则其两个子节点必然是是黑色；
- 4、对任意节点，从该节点到其子孙节点的所有路径上的黑色节点的数目必然相同

2、所有树共同的性质：

- 1、只有一个根节点；
- 2、除了根节点，其他节点都有且只有一个父节点；
- 3、无环，即：以任意节点作为起始节点，从不存在回到该节点的路径（此性质由前两个性质保证）

3、二叉查找树的性质，对于任意一个节点 n：

- 1、其左子树下的每个后代节点的值都小于节点 n 的值；
- 2、其右子树下的每个后代节点的值都大于节点 n 的值；


```java
static final class TreeNode<K,V> extends LinkedHashMap.LinkedHashMapEntry<K,V> {
    // 树根、左子叶、右子叶
    TreeNode<K,V> parent;  // red-black tree links
    TreeNode<K,V> left;
    TreeNode<K,V> right;
    // 表示当前节点是红色还是黑色
    boolean red;
    TreeNode<K,V> prev;    // needed to unlink next upon deletion
}
```

### 红黑树插入 `TreeNode#putTreeVal()`

```java
final TreeNode<K,V> putTreeVal(HashMap<K,V> map, Node<K,V>[] tab, int h, K k, V v) {
    // h 为要插入节点 key 的 hash 值
    Class<?> kc = null;
    boolean searched = false;
    // 从根节点插入，因此要先确定根节点
    TreeNode<K,V> root = (parent != null) ? root() : this;
    // p 表示当前节点，ph 表示当前节点的 hash 值，pk 表示当前节点的 value 值
    // dir 可取值为 -1/1/0，含义与 Comparable#compareTo() 返回值一致，猜测是
    // 用来确定插入时是插入到左子叶(-1/0)还是右子叶(1)
    for (TreeNode<K,V> p = root;;) {
        int dir, ph; K pk;
        if ((ph = p.hash) > h)
            dir = -1;
        else if (ph < h)
            dir = 1;
        else if ((pk = p.key) == k || (k != null && k.equals(pk)))
            return p;
        else if ((kc == null && (kc = comparableClassFor(k)) == null) ||
                 (dir = compareComparables(kc, k, pk)) == 0) {
            // 只查找一次，如果查过则无论是否找到都不再查找
            if (!searched) {
                TreeNode<K,V> q, ch;
                searched = true;
                // 以 ch 为根节点在子树中查找节点，找到则返回，put 结束
                if (((ch = p.left) != null && (q = ch.find(h, k, kc)) != null) ||
                    ((ch = p.right) != null && (q = ch.find(h, k, kc)) != null))
                    return q;
            }
            dir = tieBreakOrder(k, pk);
        }

        TreeNode<K,V> xp = p; // xp 表示待插入节点的 parent 点
        // 左子叶或右子叶为 null 时，才执行插入操作，否则一直查找
        if ((p = (dir <= 0) ? p.left : p.right) == null) {
            Node<K,V> xpn = xp.next; // 待插入节点的 parent 节点的 next 节点
            // 创建待插入节点 x，默认为黑色
            TreeNode<K,V> x = map.newTreeNode(h, k, v, xpn/*x.next*/);
            // dir <= 0 时将 x 赋值给 xp 的左子叶；反之将 x 赋值给 xp 的右子叶
            if (dir <= 0) xp.left = x; else xp.right = x;
            xp.next = x;
            x.parent = x.prev = xp;
            if (xpn != null) ((TreeNode<K,V>)xpn).prev = x;
            // 确保 root == tab[(tab.length - 1) & root.hash]
            moveRootToFront(tab, balanceInsertion(root, x));
            return null;
        }
    }
}
```

### 移动根节点 `TreeNode#moveRootToFront()`

```java
static <K,V> void moveRootToFront(Node<K,V>[] tab, TreeNode<K,V> root) {
    int n; // 数组长度
    if (root != null && tab != null && (n = tab.length) > 0) {
        // 根据给定 root 节点计算该节点在数组中的下标并获取下标对应的元素后与 root 比较
        int index = (n - 1) & root.hash;
        TreeNode<K,V> first = (TreeNode<K,V>)tab[index];
        if (root != first) { // 不是同一个节点，需要把 root 放到第一个
            Node<K,V> rn; // rn 表示 root.next
            tab[index] = root; // 把 root 放到数组的 index 位置
            TreeNode<K,V> rp = root.prev; // rp 表示 root.prev
            // root.next.prev 指向 root.prev
            if ((rn = root.next) != null) ((TreeNode<K,V>)rn).prev = rp;
            if (rp != null) rp.next = rn; // root.prev 指向 root.next
            if (first != null) first.prev = root; // first.prev 指向 root
            root.next = first; // 把 root.next 指向 first
            root.prev = null; // root.prev 为 null
        }
        assert checkInvariants(root);
    }
}
```


# Handler 机制
> Handler 与 Message、Looper 和 MessageQueue 及他们之间的相互关系称之为 `Handler 机制`

## Handler

### 使用方式
- 方式一
```java
final Handler mHandler = new Handler(new Handler.Callback() {
    @Override
    public boolean handleMessage(Message msg) {
        // 根据实际的业务逻辑决定返回值
        return false;
    }
});
```
- 方式二
```java
final Handler mHandler = new Handler() {
    // 此种方式肯能存在内存泄露问题，解决方式有两种
    // 1，在页面销毁时调用 Handler.removeCallbacksAndMessages(null);
    // 2，使用静态内部类 + 弱引用的方式
    @Override
    public void handleMessage(Message msg) {
        // 业务逻辑
    }
};
```
- 方式三
```java
final Handler mHandler = new Handler();
mHandler.post(new Runnable() {
    @Override
    public void run() {
        // 业务逻辑
    }
});
```

### dispatchMessage() 消息分发
```java
// 源码分析: 消息分发有三个优先级
public void dispatchMessage(Message msg) {
    // 1, callback 是 Runnable 对象，其来源为 mHandler.postxxx(Runnable r, xxx);
    if (msg.callback != null) {
        handleCallback(msg);
    } else {
        // 2, mCallback 是 Handler.Callback 对象，其来源为实例化 Handler 时的构造参数
        if (mCallback != null) {
            if (mCallback.handleMessage(msg)) {
                return;
            }
        }
        // 3, 子类重写的 handlerMessage() 方法
        handleMessage(msg);
    }
}
```

### 产生内存泄露的原因
```java
//////////////////// java 源码
public class Leak {
    // 非静态内部类
    class NonStaticInner {}
    // 静态内部类
    static class StaticInner {}
}
//////////////////// 编译之后的字节码
// 非静态内部类
class Leak$NonStaticInner {
    // 持有外部类 Leak 的引用 this$0，如果有耗时操作没有执行完毕，会一直持有此引用，
    // 从而使外部类的实例在生命周期结束时无法及时释放而造成内存泄露
    Leak$NonStaticInner(Leak this$0) {
        this.this$0 = this$0;
    }
}
// 静态内部类
class Leak$StaticInner {
    // 不持有外部类的引用，从而不会导致泄露
    Leak$StaticInner() {}
}
```

---
## Looper
```java
// sThreadLocal.get() will return null unless you've called prepare().
// 每个线程的 Looper 都存储在此变量中
static final ThreadLocal<Looper> sThreadLocal = new ThreadLocal<>();
// 主线程 Looper
private static Looper sMainLooper;  // guarded by Looper.class
// 消息队列
final MessageQueue mQueue;
// 当前线程的引用，即实例化 Looper 时所在的线程
final Thread mThread;

private Looper(boolean quitAllowed) {
    // 实例化 Looper 对象时，创建消息队列；同时保存当前线程的引用
    mQueue = new MessageQueue(quitAllowed);
    mThread = Thread.currentThread();
}
```

### prepare() 准备 Looper
```java
/*
 * @param quitAllowed 是否允许退出消息循环
 */
private static void prepare(boolean quitAllowed) {
    // 每个线程只可调用一次 prepare() 方法
    if (sThreadLocal.get() != null) {
        throw new RuntimeException("Only one Looper may be created per thread");
    }
    // 创建 Looper 对象并保存到 ThreadLocal 中
    sThreadLocal.set(new Looper(quitAllowed));
}
```

### prepareMainLooper() 初始化主线程 Looper
```java
public static void prepareMainLooper() {
    // 主线程不允许退出消息循环
    prepare(false);
    synchronized (Looper.class) {
        // 主线程 Looper 不允许被多次初始化
        if (sMainLooper != null) {
            throw new IllegalStateException("The main Looper has already been prepared.");
        }
        sMainLooper = myLooper();
    }
}
```

### loop() 开启消息循环
```java
public static void loop() {
    // 取出当前线程的 Looper
    final Looper me = myLooper();
    // 检查是否调用了 Looper.prepare() 方法
    if (me == null) {
        throw new RuntimeException("No Looper; Looper.prepare() wasn't called on this thread.");
    }
    // 当前线程的消息循环
    final MessageQueue queue = me.mQueue;
    for (;;) {
        // 从消息队列中取出下一条消息
        Message msg = queue.next(); // might block
        if (msg == null) {
            // No message indicates that the message queue is quitting.
            return;
        }
        try {
            // 调用 Handler.dispatchMessage() 进行消息分发
            msg.target.dispatchMessage(msg);
        } finally { }
        // 回收消息
        msg.recycleUnchecked();
    }
}
```

### quit() 和 quitSafely() 退出消息循环
```java
// 立即退出消息循环，调用此方法后在向队列中添加消息时会失败
public void quit() {
    mQueue.quit(false);
}

// 等队列中的消息执行完毕才退出消息循环，调用此方法后在向队列中添加消息时会失败
public void quitSafely() {
    mQueue.quit(true);
}

```

---
## Message
```java
// 缓存池锁对象
private static final Object sPoolSync = new Object();
// 缓存池链表表头指针
private static Message sPool;
// 当前缓存池大小
private static int sPoolSize = 0;
// 缓存池大小限制
private static final int MAX_POOL_SIZE = 50;
// 指向下一个元素的指针
/*package*/ Message next;
```

### sPool: 缓存池
- 单链表数据结构
- sPool: 头指针

### obtain(): 从缓存池取消息
```java
public static Message obtain() {
    synchronized (sPoolSync) {
        // 如果表头元素不为空，则返回表头元素
        if (sPool != null) {
            // 取表头元素
            Message m = sPool;
            // 重置表头
            sPool = m.next;
            m.next = null;
            m.flags = 0; // clear in-use flag
            // 更新缓存池大小
            sPoolSize--;
            return m;
        }
    }
    // 缓存池中无消息，生成一个新的
    return new Message();
}
```

### recycle(): 回收消息
```java
public void recycle() {
    if (isInUse()) {
        if (gCheckRecycle) {
            throw new IllegalStateException("This message cannot be recycled because it "
                    + "is still in use.");
        }
        return;
    }
    recycleUnchecked();
}

void recycleUnchecked() {
    // Mark the message as in use while it remains in the recycled object pool.
    // Clear out all other details.
    flags = FLAG_IN_USE;
    what = 0;
    arg1 = 0;
    arg2 = 0;
    obj = null;
    replyTo = null;
    sendingUid = -1;
    when = 0;
    target = null;
    callback = null;
    data = null;

    synchronized (sPoolSync) {
        if (sPoolSize < MAX_POOL_SIZE) {
            // 表头后移
            next = sPool;
            // 重置表头指针
            sPool = this;
            // 更新缓存池大小
            sPoolSize++;
        }
    }
}
```

---
## MessageQueue
```java
// True if the message queue can be quit.
private final boolean mQuitAllowed;
// 消息队列，单链表数据结构
Message mMessages;
// 是否已退出
private boolean mQuitting;
```

### 消息池
### 消息入队
```java
// 根据消息执行的时间进行排序：越早执行的排在越前面
boolean enqueueMessage(Message msg, long when) {
    if (msg.target == null) {
        throw new IllegalArgumentException("Message must have a target.");
    }
    if (msg.isInUse()) {
        throw new IllegalStateException(msg + " This message is already in use.");
    }

    synchronized (this) {
        if (mQuitting) {
            // 如消息循环已退出，则之后的消息不能再入队
            IllegalStateException e = new IllegalStateException(
                    msg.target + " sending message to a Handler on a dead thread");
            Log.w(TAG, e.getMessage(), e);
            msg.recycle();
            return false;
        }

        msg.markInUse();
        msg.when = when;
        Message p = mMessages;
        boolean needWake;
        if (p == null || when == 0 || when < p.when) {
            // New head, wake up the event queue if blocked.
            msg.next = p;
            mMessages = msg;
            needWake = mBlocked;
        } else {
            // Inserted within the middle of the queue.  Usually we don't have to wake
            // up the event queue unless there is a barrier at the head of the queue
            // and the message is the earliest asynchronous message in the queue.
            needWake = mBlocked && p.target == null && msg.isAsynchronous();
            Message prev;
            for (;;) {
                prev = p;
                p = p.next;
                if (p == null || when < p.when) {
                    break;
                }
                if (needWake && p.isAsynchronous()) {
                    needWake = false;
                }
            }
            msg.next = p; // invariant: p == prev.next
            prev.next = msg;
        }

        // We can assume mPtr != 0 because mQuitting is false.
        if (needWake) {
            nativeWake(mPtr);
        }
    }
    return true;
}
```

### next() 从消息队列取消息
```java
Message next() {
    // Return here if the message loop has already quit and been disposed.
    // This can happen if the application tries to restart a looper after quit
    // which is not supported.
    final long ptr = mPtr;
    if (ptr == 0) {
        return null;
    }

    int pendingIdleHandlerCount = -1; // -1 only during first iteration
    int nextPollTimeoutMillis = 0;
    for (;;) {
        if (nextPollTimeoutMillis != 0) {
            Binder.flushPendingCommands();
        }

        nativePollOnce(ptr, nextPollTimeoutMillis);

        synchronized (this) {
            // Try to retrieve the next message.  Return if found.
            final long now = SystemClock.uptimeMillis();
            Message prevMsg = null;
            // 取出消息头
            Message msg = mMessages;
            if (msg != null && msg.target == null) {
                // Stalled by a barrier.  Find the next asynchronous message in the queue.
                do {
                    prevMsg = msg;
                    msg = msg.next;
                } while (msg != null && !msg.isAsynchronous());
            }
            if (msg != null) {
                if (now < msg.when) {
                    // Next message is not ready.  Set a timeout to wake up when it is ready.
                    nextPollTimeoutMillis = (int) Math.min(msg.when - now, Integer.MAX_VALUE);
                } else {
                    // Got a message.
                    mBlocked = false;
                    if (prevMsg != null) {
                        prevMsg.next = msg.next;
                    } else {
                        mMessages = msg.next;
                    }
                    msg.next = null;
                    if (DEBUG) Log.v(TAG, "Returning message: " + msg);
                    msg.markInUse();
                    return msg;
                }
            } else {
                // No more messages.
                nextPollTimeoutMillis = -1;
            }

            // Process the quit message now that all pending messages have been handled.
            if (mQuitting) {
                dispose();
                return null;
            }

            // If first time idle, then get the number of idlers to run.
            // Idle handles only run if the queue is empty or if the first message
            // in the queue (possibly a barrier) is due to be handled in the future.
            if (pendingIdleHandlerCount < 0
                    && (mMessages == null || now < mMessages.when)) {
                pendingIdleHandlerCount = mIdleHandlers.size();
            }
            if (pendingIdleHandlerCount <= 0) {
                // No idle handlers to run.  Loop and wait some more.
                mBlocked = true;
                continue;
            }

            if (mPendingIdleHandlers == null) {
                mPendingIdleHandlers = new IdleHandler[Math.max(pendingIdleHandlerCount, 4)];
            }
            mPendingIdleHandlers = mIdleHandlers.toArray(mPendingIdleHandlers);
        }

        // Run the idle handlers.
        // We only ever reach this code block during the first iteration.
        for (int i = 0; i < pendingIdleHandlerCount; i++) {
            final IdleHandler idler = mPendingIdleHandlers[i];
            mPendingIdleHandlers[i] = null; // release the reference to the handler

            boolean keep = false;
            try {
                keep = idler.queueIdle();
            } catch (Throwable t) {
                Log.wtf(TAG, "IdleHandler threw exception", t);
            }

            if (!keep) {
                synchronized (this) {
                    mIdleHandlers.remove(idler);
                }
            }
        }

        // Reset the idle handler count to 0 so we do not run them again.
        pendingIdleHandlerCount = 0;

        // While calling an idle handler, a new message could have been delivered
        // so go back and look again for a pending message without waiting.
        nextPollTimeoutMillis = 0;
    }
}
```

### quit() 退出
```java
void quit(boolean safe) {
    // 主线程不允许退出消息循环
    if (!mQuitAllowed) {
        throw new IllegalStateException("Main thread not allowed to quit.");
    }
    synchronized (this) {
        if (mQuitting) {
            return;
        }
        mQuitting = true;

        if (safe) {
            // 调用 Looper.quitSafely()
            // 移除比当前时间之后的所有消息，即尚未触发的消息
            removeAllFutureMessagesLocked();
        } else {
            // 调用 Looper.quit()
            // 直接移除消息队列中的所有消息
            removeAllMessagesLocked();
        }

        // We can assume mPtr != 0 because mQuitting was previously false.
        nativeWake(mPtr);
    }
}

private void removeAllFutureMessagesLocked() {
    final long now = SystemClock.uptimeMillis();
    Message p = mMessages;
    if (p != null) {
        if (p.when > now) {
            removeAllMessagesLocked();
        } else {
            Message n;
            for (;;) {
                n = p.next;
                if (n == null) {
                    return;
                }
                if (n.when > now) {
                    break;
                }
                p = n;
            }
            p.next = null;
            do {
                p = n;
                n = p.next;
                p.recycleUnchecked();
            } while (n != null);
        }
    }
}

private void removeAllMessagesLocked() {
    Message p = mMessages;
    while (p != null) {
        Message n = p.next;
        p.recycleUnchecked();
        p = n;
    }
    mMessages = null;
}
```

---
## HandlerThread
> 在子线程使用消息循环

---
## ThreadLocal
> 线程本地存储区（Thread Local Storage，简称为TLS），每个线程都有自己的私有的本地存储区域，不同线程之间彼此不能访问对方的TLS区域。
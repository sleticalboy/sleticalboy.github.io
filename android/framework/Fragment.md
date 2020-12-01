# Fragment

---
## 生命周期 [参考文章](https://www.cnblogs.com/fajieyefu/p/6092465.html)

### 生命周期顺序
```java
public void onAttach(Context context) {
    // 执行此方法时，Fragment 已与 Activity 完成绑定
    // context 即为 Activity 对象
}
public void onCreate(Bundle savedInstanceState) {
    // Fragment 初始化
}
public void onCreateView(LayoutInflater li, ViewGroup container, Bundle savedInstanceState) {
    // 初始化 Fragment 布局
}
public void onActivityCreated(Bundle savedInstanceState) {
    // 执行此方法时，与此 Fragment 绑定的 Activity 的 onCreate() 方法已执行完毕
    // 在此方法内可执行与 Activity 相关的 UI 交互逻辑
}
public void onstart() {
    // 执行此方法时，Fragment 由不可见变为可见，但用户不可与之交互
}
public void onResume() {
    // 执行此方法时，Fragment 处于活动状态，用户可与之交互
}
public void onPause() {
    // 执行此方法时，Fragment 处于暂停状态依然可见，但用户不可与之交互
}
public void onStop() {
    // 执行此方法时，Fragment 完全不可见
}
public void onDestroyView() {
    // 销毁与 Fragment 相关的 View，但未与 Activity 解除绑定，依然可以通过 onCreateView() 方法重建视图
}
public void onDestroy() {
    // 按下 back 键或者 Fragment 被回收时会回调此方法
}
public void onDetach() {
    // 解除与 Activity 的绑定，生命周期方法的最后一个执行
}
```

### Fragment 初始化时生命周期方法调用顺序
```java
setUserVisibleHint() -> onAttach() -> onCreate() -> onCreateView() -> 
onActivityCreated() -> onStart() -> onResume()
```

### Fragment 变为不可见状态（前台切后台、锁屏、被其他页面覆盖）
```java
onPause() -> onStop() -> onSaveInstanceState()
```

### Fragment 由不可见变为活动状态
```java
onStart() -> onResume()
```

### Fragment 由可见变为部分可见
```java
onPause() -> onSaveInstanceState()
```

### Fragment 由部分可见变为活动状态
```java
onResume()
```

### Fragment 被销毁或者回收时
```java
onPause() -> onStop() -> onDestroyView() -> onDestroy() -> onDetach()
// 因为是认为退出，所以此时不会调用 onSaveInstanceState() 方法
```

### Fragment 重建
```java
onAttach() -> onCreate() -> onCreateView() -> onActivityCreated() -> 
onStart() -> onResume() -> setUserVisibleHint()
```
### 竖屏切换横屏
- 销毁
    ```java
    onPause() -> onStop() -> onSaveInstanceState() -> onDestroyView() -> onDestroy() -> onDetach()
    ```
- 重建
    ```java
    onAttach() -> onCreate() -> onCreateView() -> onActivityCreated() -> onStart() -> onResume()
    ```
---
## 与 Activity 交互

### 向 Activity 中添加一个 Fragment 
- 向 Activity 中添加一个 Fragment，都涉及到了哪些操作
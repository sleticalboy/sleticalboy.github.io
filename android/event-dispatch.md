# 事件分发机制

## KeyEvent
- Activity.dispatchKeyEvent():  Windown.Callback.dispatchKeyEvent()
- activity.getWindow().superDispatchKeyEvent(): PhoneWindow.superDispatchKeyEvent()
- mDecor.superDispatchKeyEvent() -> DecorView.dispatchKeyEvent() -> ViewGroup.dispatchKeyEvent()

## TouchEvent
- Activity.dispatchTouchEvent(): Window.Callback.dispatchTouchEvent()
- activity.getWindow().superDispatchTouchEvent(): PhoneWindow.superDispatchTouchEvent()
- mDecor.superDispatchTouchEvent() -> DecorView.superDispatchTouchEvent() -> ViewGroup.dispatchTouchEvent()
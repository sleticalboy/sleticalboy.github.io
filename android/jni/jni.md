# android JNI

##  char* to jcharArray
```cpp
jcharArray data = env->NewCharArray(len);
jchar *temp = (jchar *) calloc(len, sizeof(jchar));
for(int i = 0; i < len; i+=2) {
    *(temp + i) = *(rx_ctrl.rxbuf + i);
    *(temp + i + 1) = *(rx_ctrl.rxbuf + i + 1);
}
env->SetCharArrayRegion(data, 0, len, temp);
```

## jstring to char*
```cpp
const char* _data = env->GetStringUTFChars(data, 0);
LOGI("send cmd to Nrf channels pipe: %s\n", _data);	
```
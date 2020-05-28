# android JNI

##  char* to jcharArray
```cpp
static jcharArray getData_native(JNIEnv *env, jobject clazz) {
	struct nrf_ctrl tx_ctrl;
	tx_ctrl.tx_ctrl = {'D', 'A', 'T', 'A'};
	int len = 4;
	jcharArray data = env->NewCharArray(len);
	jchar *temp = (jchar *) calloc(len, sizeof(jchar));
	for(int i = 0; i < len; i+=2) {
	    *(temp + i) = *(rx_ctrl.rxbuf + i);
	    *(temp + i + 1) = *(rx_ctrl.rxbuf + i + 1);
	}
	env->SetCharArrayRegion(data, 0, len, temp);
	return data;
}
```

## jstring to char*
```cpp
static void sendData_native(JNIEnv *env, jobject clazz, jstring data) {
	const char* _data = env->GetStringUTFChars(data, 0);
	LOGI("send cmd to Nrf channels pipe: %s\n", _data);	
}
```

## jcharArray to char*
```cpp
static void sendCommand_native(JNIEnv *env, jobject clazz, jcharArray cmd) {
    int fd = open("/dev/nrf_ctrl", O_RDWR);
    if (fd <= 0) {
        LOGE("send cmd to Nrf failed with fd: %d", fd);
        return;
    }
    struct nrf_ctrl tx_ctrl;
    tx_ctrl.length = 6;
    tx_ctrl.txbuf = new char[tx_ctrl.length];
    jchar* _cmd = env->GetCharArrayElements(cmd, nullptr);
    for (int i = 0; i < tx_ctrl.length; i++) {
        tx_ctrl.txbuf[i] = *(_cmd + i);
        LOGI("send cmd to Nrf %d: j: %02x, c: %02x", i, *(_cmd + i), tx_ctrl.txbuf[i]);
    }
    int ret = ioctl(fd, NRF_IOCTL_SET_DEVICE_GMDCMD, &tx_ctrl);
    if (ret < 0) {
        LOGE("send cmd to Nrf failed with ret: %d", ret);
    }
    close(fd);
}
```
# Android 中的 uevent
> Uevent 是内核通知 android 有状态变化的一种方法，比如USB线插入、拔出，电池电量变化等等。其本质是内核发送（可以通过 socket）一个字符串，应用层（android）接收并解释该字符串，获取相应信息。

## Kernel
- uevent 的发起在 linux 内核中，通过函数 `int kobject_uevent_env(struct kobject *kobj, enum kobject_action action, char *envp_ext[])` 发送事件

## Android
- android 中通过 UEventObserver 来接收 uevent 事件

## 相关源码
- frameworks/base/core/java/android/os/UEventObserver.java
- frameworks/base/core/jni/android_os_UEventObserver.cpp
- hardware/libhardware_legacy/uevent.c
- hardware/libhardware_legacy/include/hardware_legacy/uevent.h

## 代码实例
```java
// UEventObserver 使用
final UEventObserver observer = new UEventObserver() {
    @Override
    public void onUEvent(UEvent event) {
        final String value = event.get("WIRELESS_MICROPHONE_CHANNEL");
        Log.d(TAG, "onUEvent() event: " + event + ", value: " + value);
        if (value != null && !"ff".equals(value)) {
            final String[] arr = value.split(" ");
            for (int i = 0; i < arr.length; i += 2) {
                if (i + 1 < arr.length) {
                    final GmdChannels.Table table = GmdChannels.resolveTable(null, arr[i] + arr[i + 1]);
                    Log.d(TAG, "onUEvent() table: " + table);
                }
            }
        }
    }
};
observer.startObserving("WIRELESS_MICROPHONE_CHANNEL");
```

## 扩展
- linux 获取热插拔事件： `udevadm monitor --env`
```shell
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[439851.722529] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0/tty/ttyUSB0 (tty)
ACTION=remove
DEVNAME=/dev/ttyUSB0
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0/tty/ttyUSB0
MAJOR=188
MINOR=0
SEQNUM=4609
SUBSYSTEM=tty

KERNEL[439851.722652] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0 (usb-serial)
ACTION=unbind
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0
SEQNUM=4610
SUBSYSTEM=usb-serial

KERNEL[439851.722738] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0 (usb-serial)
ACTION=remove
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0
SEQNUM=4611
SUBSYSTEM=usb-serial

KERNEL[439851.722821] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0 (usb)
ACTION=unbind
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0
DEVTYPE=usb_interface
INTERFACE=255/0/0
PRODUCT=67b/2303/300
SEQNUM=4612
SUBSYSTEM=usb
TYPE=0/0/0

KERNEL[439851.722950] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0 (usb)
ACTION=remove
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0
DEVTYPE=usb_interface
INTERFACE=255/0/0
MODALIAS=usb:v067Bp2303d0300dc00dsc00dp00icFFisc00ip00in00
PRODUCT=67b/2303/300
SEQNUM=4613
SUBSYSTEM=usb
TYPE=0/0/0

KERNEL[439851.723224] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4 (usb)
ACTION=unbind
BUSNUM=001
DEVNAME=/dev/bus/usb/001/007
DEVNUM=007
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4
DEVTYPE=usb_device
MAJOR=189
MINOR=6
PRODUCT=67b/2303/300
SEQNUM=4614
SUBSYSTEM=usb
TYPE=0/0/0

KERNEL[439851.723412] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4 (usb)
ACTION=remove
BUSNUM=001
DEVNAME=/dev/bus/usb/001/007
DEVNUM=007
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4
DEVTYPE=usb_device
MAJOR=189
MINOR=6
PRODUCT=67b/2303/300
SEQNUM=4615
SUBSYSTEM=usb
TYPE=0/0/0

UDEV  [439851.742306] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0/tty/ttyUSB0 (tty)
ACTION=remove
DEVLINKS=/dev/serial/by-path/pci-0000:00:14.0-usb-0:4:1.0-port0 /dev/serial/by-id/usb-Prolific_Technology_Inc._USB-Serial_Controller-if00-port0
DEVNAME=/dev/ttyUSB0
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0/tty/ttyUSB0
ID_BUS=usb
ID_MM_CANDIDATE=1
ID_MODEL=USB-Serial_Controller
ID_MODEL_ENC=USB-Serial\x20Controller
ID_MODEL_FROM_DATABASE=PL2303 Serial Port
ID_MODEL_ID=2303
ID_PATH=pci-0000:00:14.0-usb-0:4:1.0
ID_PATH_TAG=pci-0000_00_14_0-usb-0_4_1_0
ID_PCI_CLASS_FROM_DATABASE=Serial bus controller
ID_PCI_INTERFACE_FROM_DATABASE=XHCI
ID_PCI_SUBCLASS_FROM_DATABASE=USB controller
ID_REVISION=0300
ID_SERIAL=Prolific_Technology_Inc._USB-Serial_Controller
ID_TYPE=generic
ID_USB_DRIVER=pl2303
ID_USB_INTERFACES=:ff0000:
ID_USB_INTERFACE_NUM=00
ID_VENDOR=Prolific_Technology_Inc.
ID_VENDOR_ENC=Prolific\x20Technology\x20Inc.
ID_VENDOR_FROM_DATABASE=Prolific Technology, Inc.
ID_VENDOR_ID=067b
MAJOR=188
MINOR=0
SEQNUM=4609
SUBSYSTEM=tty
TAGS=:systemd:
USEC_INITIALIZED=383000322005

UDEV  [439851.745929] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0 (usb-serial)
ACTION=unbind
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0
SEQNUM=4610
SUBSYSTEM=usb-serial
USEC_INITIALIZED=439851745784

UDEV  [439851.748056] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0 (usb-serial)
ACTION=remove
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/ttyUSB0
SEQNUM=4611
SUBSYSTEM=usb-serial
USEC_INITIALIZED=439851738136

UDEV  [439851.750135] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0 (usb)
ACTION=unbind
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0
DEVTYPE=usb_interface
INTERFACE=255/0/0
PRODUCT=67b/2303/300
SEQNUM=4612
SUBSYSTEM=usb
TYPE=0/0/0
USEC_INITIALIZED=383000318053

UDEV  [439851.752553] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0 (usb)
ACTION=remove
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0
DEVTYPE=usb_interface
INTERFACE=255/0/0
MODALIAS=usb:v067Bp2303d0300dc00dsc00dp00icFFisc00ip00in00
PRODUCT=67b/2303/300
SEQNUM=4613
SUBSYSTEM=usb
TYPE=0/0/0
USEC_INITIALIZED=439851738527

UDEV  [439851.755089] unbind   /devices/pci0000:00/0000:00:14.0/usb1/1-4 (usb)
ACTION=unbind
BUSNUM=001
DEVNAME=/dev/bus/usb/001/007
DEVNUM=007
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4
DEVTYPE=usb_device
MAJOR=189
MINOR=6
PRODUCT=67b/2303/300
SEQNUM=4614
SUBSYSTEM=usb
TYPE=0/0/0
USEC_INITIALIZED=383000316424

UDEV  [439851.756934] remove   /devices/pci0000:00/0000:00:14.0/usb1/1-4 (usb)
ACTION=remove
BUSNUM=001
DEVNAME=/dev/bus/usb/001/007
DEVNUM=007
DEVPATH=/devices/pci0000:00/0000:00:14.0/usb1/1-4
DEVTYPE=usb_device
MAJOR=189
MINOR=6
PRODUCT=67b/2303/300
SEQNUM=4615
SUBSYSTEM=usb
TYPE=0/0/0
USEC_INITIALIZED=439851738953
```

## 参考资料
- [android & Linux uevent机制](http://blog.sina.com.cn/s/blog_6100a4f101015uwh.html)
- [Linux kernel -- Uevent发送（热插拔）事件到用户空间](https://blog.csdn.net/u012066426/article/details/51917369)
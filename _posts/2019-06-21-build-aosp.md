---
layout: post
title: build-aosp
author: sleticalboy
date: 2019-06-21 12:15:26
category: android
tags: [aosp]
---

```shell
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt-get install libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev g++-multilib 
[sudo] password for sleticalboy: 
Sorry, try again.
[sudo] password for sleticalboy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 g++-multilib : Depends: gcc-multilib (>= 4:5.3.1-1ubuntu1) but it is not going to be installed
                Depends: g++ (>= 4:5.3.1-1ubuntu1) but it is not going to be installed
                Depends: g++-5-multilib (>= 5.3.1-3~) but it is not going to be installed
 libgl1-mesa-dev : Depends: mesa-common-dev (= 11.2.0-1ubuntu2) but it is not going to be installed
                   Depends: libgl1-mesa-glx (= 11.2.0-1ubuntu2) but 18.0.5-0ubuntu0~16.04.1 is to be installed
                   Depends: libdrm-dev (>= 2.4.65) but it is not going to be installed
                   Depends: libx11-dev but it is not going to be installed
                   Depends: libx11-xcb-dev but it is not going to be installed
                   Depends: libxdamage-dev but it is not going to be installed
                   Depends: libxext-dev but it is not going to be installed
                   Depends: libxfixes-dev but it is not going to be installed
                   Depends: libxxf86vm-dev but it is not going to be installed
 libx11-dev:i386 : Depends: libx11-6:i386 (= 2:1.6.3-1ubuntu2) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ ls
Android.bp      cts          external         Makefile          system
art             dalvik       frameworks       packages          test
bionic          developers   hardware         pdk               toolchain
bootable        development  kernel           platform_testing  tools
bootstrap.bash  device       libcore          prebuilts
build           docs         libnativehelper  sdk
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ ls
Android.bp      cts          external         Makefile          system
art             dalvik       frameworks       packages          test
bionic          developers   hardware         pdk               toolchain
bootable        development  kernel           platform_testing  tools
bootstrap.bash  device       libcore          prebuilts
build           docs         libnativehelper  sdk
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev g++-multilib -y git flex bison gperf build-essential libncurses5-dev:i386 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 dpkg-dev libsdl1.2-dev libesd0-dev git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip m4 lib32z-dev ccache
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'lib32z1-dev' instead of 'lib32z-dev'
curl is already the newest version (7.47.0-1ubuntu2).
unzip is already the newest version (6.0-20ubuntu1).
zip is already the newest version (3.0-11).
x11proto-core-dev is already the newest version (7.0.31-1~ubuntu16.04.2).
x11proto-core-dev set to manually installed.
gnupg is already the newest version (1.4.20-1ubuntu3.3).
dpkg-dev is already the newest version (1.18.4ubuntu1.4).
libx11-dev is already the newest version (2:1.6.3-1ubuntu2.1).
libx11-dev set to manually installed.
git is already the newest version (1:2.7.4-0ubuntu1.4).
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 build-essential : Depends: g++ (>= 4:5.2) but it is not going to be installed
 g++-multilib : Depends: g++ (>= 4:5.3.1-1ubuntu1) but it is not going to be installed
                Depends: g++-5-multilib (>= 5.3.1-3~) but it is not going to be installed
 gcc-multilib : Depends: gcc-5-multilib (>= 5.3.1-3~) but it is not going to be installed
 libgl1-mesa-dev : Depends: mesa-common-dev (= 11.2.0-1ubuntu2) but it is not going to be installed
                   Depends: libgl1-mesa-glx (= 11.2.0-1ubuntu2) but 18.0.5-0ubuntu0~16.04.1 is to be installed
                   Depends: libdrm-dev (>= 2.4.65) but it is not going to be installed
                   Depends: libx11-xcb-dev but it is not going to be installed
 libncurses5-dev:i386 : Depends: libc6-dev:i386 but it is not going to be installed or
                                 libc-dev:i386
 libsdl1.2-dev : Depends: libcaca-dev but it is not going to be installed
                 Depends: libpulse-dev but it is not going to be installed
 libx11-dev : Breaks: libx11-dev:i386 (!= 2:1.6.3-1ubuntu2.1) but 2:1.6.3-1ubuntu2 is to be installed
 libx11-dev:i386 : Depends: libx11-6:i386 (= 2:1.6.3-1ubuntu2) but it is not going to be installed
                   Breaks: libx11-dev (!= 2:1.6.3-1ubuntu2) but 2:1.6.3-1ubuntu2.1 is to be installed
 zlib1g-dev : Depends: zlib1g (= 1:1.2.8.dfsg-2ubuntu4) but 1:1.2.8.dfsg-2ubuntu4.1 is to be installed
 zlib1g-dev:i386 : Depends: zlib1g:i386 (= 1:1.2.8.dfsg-2ubuntu4) but it is not going to be installed
                   Depends: libc6-dev:i386 but it is not going to be installed or
                            libc-dev:i386
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ source build/envsetup.sh 
including device/asus/fugu/vendorsetup.sh
including device/generic/car/car-arm64/vendorsetup.sh
including device/generic/car/car-armv7-a-neon/vendorsetup.sh
including device/generic/car/car-x86_64/vendorsetup.sh
including device/generic/car/car-x86/vendorsetup.sh
including device/generic/mini-emulator-arm64/vendorsetup.sh
including device/generic/mini-emulator-armv7-a-neon/vendorsetup.sh
including device/generic/mini-emulator-mips64/vendorsetup.sh
including device/generic/mini-emulator-mips/vendorsetup.sh
including device/generic/mini-emulator-x86_64/vendorsetup.sh
including device/generic/mini-emulator-x86/vendorsetup.sh
including device/google/dragon/vendorsetup.sh
including device/google/marlin/vendorsetup.sh
including device/huawei/angler/vendorsetup.sh
including device/lge/bullhead/vendorsetup.sh
including device/linaro/hikey/vendorsetup.sh
including sdk/bash_completion/adb.bash
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ lunch aosp_
aosp_angler-userdebug           aosp_bullhead_svelte-userdebug  aosp_dragon-userdebug           aosp_marlin-userdebug           aosp_sailfish-userdebug         
aosp_arm64-eng                  aosp_bullhead-userdebug         aosp_fugu-userdebug             aosp_mips64-eng                 aosp_x86_64-eng                 
aosp_arm-eng                    aosp_dragon-eng                 aosp_marlin_svelte-userdebug    aosp_mips-eng                   aosp_x86-eng                    
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ lunch aosp_arm64-eng 

============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_PLATFORM_VERSION=OPR1
TARGET_BUILD_APPS=
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
AUX_OS_VARIANT_LIST=
============================================
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ lunch 

You're building on Linux

Lunch menu... pick a combo:
     1. aosp_arm-eng
     2. aosp_arm64-eng
     3. aosp_mips-eng
     4. aosp_mips64-eng
     5. aosp_x86-eng
     6. aosp_x86_64-eng
     7. full_fugu-userdebug
     8. aosp_fugu-userdebug
     9. car_emu_arm64-userdebug
     10. car_emu_arm-userdebug
     11. car_emu_x86_64-userdebug
     12. car_emu_x86-userdebug
     13. mini_emulator_arm64-userdebug
     14. m_e_arm-userdebug
     15. m_e_mips64-eng
     16. m_e_mips-userdebug
     17. mini_emulator_x86_64-userdebug
     18. mini_emulator_x86-userdebug
     19. aosp_dragon-userdebug
     20. aosp_dragon-eng
     21. aosp_marlin-userdebug
     22. aosp_marlin_svelte-userdebug
     23. aosp_sailfish-userdebug
     24. aosp_angler-userdebug
     25. aosp_bullhead-userdebug
     26. aosp_bullhead_svelte-userdebug
     27. hikey-userdebug

Which would you like? [aosp_arm-eng] 2  	

============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_PLATFORM_VERSION=OPR1
TARGET_BUILD_APPS=
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
AUX_OS_VARIANT_LIST=
============================================
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ make -j8
============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
============================================
[38/38] bootstrap out/soong/.minibootstrap/build.ninja.in
[4/4] out/soong/.bootstrap/bin/minibp out/soong/.bootstrap/build.ninja
[621/622] glob vendor/*/*/Android.bp
[40/40] out/soong/.bootstrap/bin/soong_build out/soong/build.ninja
out/build-aosp_arm64.ninja is missing, regenerating...
Checking build tools versions...
[9/974] including ./cts/Android.mk ...
cts/apps/CtsVerifier/Android.mk:72: warning: FindEmulator: find: `cts/apps/CtsVerifier/src/com/android/cts/verifier/backup': No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/res: No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/backup/assets: No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/src': No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/src': No such file or directory
cts/tests/tests/contactsproviderwipe/Android.mk:33: warning: FindEmulator: find: `cts/tests/tests/contactsproviderwipe/common/src': No such file or directory
cts/tests/tests/telecom3/Android.mk:37: warning: FindEmulator: find: `cts/tests/tests/telecom/src/android/telecom/cts/MockDialerActivity.java': No such file or directory
[323/974] including ./external/toybox/Android.mk ...
awk: line 1: syntax error at or near ,
[355/974] including ./frameworks/av/media/libaaudio/Android.mk ...
frameworks/av/media/libaaudio/examples/input_monitor/static/Android.mk: warning: input_monitor: unusual tags examples 
frameworks/av/media/libaaudio/examples/write_sine/static/Android.mk: warning: write_sine: unusual tags examples 
[389/974] including ./frameworks/base/Android.mk ...
./frameworks/base/Android.mk:865: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:874: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:879: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:884: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
[717/974] including ./system/sepolicy/Android.mk ...
./system/sepolicy/Android.mk:107: warning: BOARD_SEPOLICY_VERS not specified, assuming current platform version
[974/974] including ./tools/tradefederation/core/Android.mk ...
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module perf-setup.sh 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RecyclerViewTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module LauncherFunctionalTests 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module perf-setup.sh 
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
build/core/base_rules.mk:466: warning: overriding commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
./test/vts/utils/python/archive/Android.mk:28: warning: overriding commands for target `default'
./test/vts/runners/host/tcp_server/Android.mk:19: warning: ignoring old commands for target `default'
./test/vts/utils/python/coverage/Android.mk:28: warning: overriding commands for target `default'
./test/vts/utils/python/archive/Android.mk:28: warning: ignoring old commands for target `default'
[ 99% 1097/1098] glob vendor/*/*/Android.bp
[  0% 90/80636] host Java: jarjar (out/host/common/obj/JAVA_LIBRARIES/jarjar_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[  0% 98/80636] host Java: tagsouplib (out/host/common/obj/JAVA_LIBRARIES/tagsouplib_intermediates/classes)
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  0% 102/80636] host Java: antlr-runtime (out/host/common/obj/JAVA_LIBRARIES/antlr-runtime_intermediates/classes)
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  0% 235/80636] host Java: guavalib (out/host/common/obj/JAVA_LIBRARIES/guavalib_intermediates/classes)
warning: [options] bootstrap class path not set in conjunction with -source 1.7
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
1 warning
[  0% 399/80636] host C: libf2fs_fmt_host_dyn <= external/f2fs-tools/lib/libf2fs.c
external/f2fs-tools/lib/libf2fs.c:472:32: warning: taking address of packed member 'total_sectors' of class or structure 'f2fs_configuration' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
                                             ^~~~~~~~~~~~~~~~
1 warning generated.
[  0% 404/80636] host C: fsck.f2fs <= external/f2fs-tools/lib/libf2fs.c
external/f2fs-tools/lib/libf2fs.c:472:32: warning: taking address of packed member 'total_sectors' of class or structure 'f2fs_configuration' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
                                             ^~~~~~~~~~~~~~~~
1 warning generated.
[  0% 437/80636] host Java: jsilver (out/host/common/obj/JAVA_LIBRARIES/jsilver_intermediates/classes)
Note: external/jsilver/src/org/clearsilver/FactoryLoader.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  0% 448/80636] host C: mdnsd <= external/mdnsresponder/mDNSCore/uDNS.c
external/mdnsresponder/mDNSCore/uDNS.c:724:45: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLJumbo(msg, ptr, &msg->h.numAdditionals, opt, 0);
                                                   ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/uDNS.c:904:106: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (opt && q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Event && mDNSSameOpaque64(&opt->u.llq.id, &q->id))
                                                                                                                                     ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:36: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                   ^
external/mdnsresponder/mDNSCore/uDNS.c:904:106: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (opt && q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Event && mDNSSameOpaque64(&opt->u.llq.id, &q->id))
                                                                                                                                     ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:62: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                                             ^
external/mdnsresponder/mDNSCore/uDNS.c:909:50: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        ackEnd = putLLQ(&m->omsg, m->omsg.data, q, &opt->u.llq);
                                                                                    ^~~~~~~~~~
external/mdnsresponder/mDNSCore/uDNS.c:918:97: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        if (q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Refresh && mDNSSameOpaque64(&opt->u.llq.id, &q->id) && msg->h.numAdditionals && !msg->h.numAnswers)
                                                                                                                                   ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:36: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                   ^
external/mdnsresponder/mDNSCore/uDNS.c:918:97: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        if (q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Refresh && mDNSSameOpaque64(&opt->u.llq.id, &q->id) && msg->h.numAdditionals && !msg->h.numAnswers)
                                                                                                                                   ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:62: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                                             ^
external/mdnsresponder/mDNSCore/uDNS.c:928:27: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        SetLLQTimer(m, q, &opt->u.llq);
                                                                           ^~~~~~~~~~
external/mdnsresponder/mDNSCore/uDNS.c:938:71: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                recvSetupResponse(m, msg->h.flags.b[1] & kDNSFlag1_RC_Mask, q, &opt->u.llq);
                                                                                                                ^~~~~~~~~~
8 warnings generated.
[  0% 466/80636] host C: mdnsd <= external/mdnsresponder/mDNSCore/DNSCommon.c
external/mdnsresponder/mDNSCore/DNSCommon.c:1885:48: warning: taking address of packed member 'numAnswers' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        return putEmptyResourceRecord(msg, ptr, end, &msg->h.mDNS_numPrereqs, &prereq);
                                                      ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1894:45: warning: taking address of packed member 'numAuthorities' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLJumbo(msg, ptr, &msg->h.mDNS_numUpdates, rr, 0);
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1905:49: warning: taking address of packed member 'numAuthorities' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLWithLimit(msg, ptr, &msg->h.mDNS_numUpdates, rr, 0, limit);
                                                       ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1957:45: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        end = PutResourceRecordTTLJumbo(msg, end, &msg->h.numAdditionals, &rr.resrec, 0);
                                                   ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1972:49: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        end = PutResourceRecordTTLWithLimit(msg, end, &msg->h.numAdditionals, &rr.resrec, 0, limit);
                                                       ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1994:53: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                newptr = PutResourceRecordTTLWithLimit(msg, end, &msg->h.numAdditionals, &hinfo.resrec, 0, limit);
                                                                  ^~~~~~~~~~~~~~~~~~~~~
6 warnings generated.
[  0% 516/80636] host C: mdnsd <= external/mdnsresponder/mDNSCore/mDNS.c
external/mdnsresponder/mDNSCore/mDNS.c:5462:61: warning: taking address of packed member 'numAnswers' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                        mDNSu8 *p = PutResourceRecordTTL(response, responseptr, &response->h.numAnswers, &rr->resrec,
                                                                                 ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:198:47: note: expanded from macro 'PutResourceRecordTTL'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AllowedRRSpace(msg))
                                                     ^~~~~
external/mdnsresponder/mDNSCore/mDNS.c:5474:61: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                        mDNSu8 *p = PutResourceRecordTTL(response, responseptr, &response->h.numAdditionals, &rr->resrec,
                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:198:47: note: expanded from macro 'PutResourceRecordTTL'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AllowedRRSpace(msg))
                                                     ^~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10220:37: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                       ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10220:48: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                                  ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10223:46: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendARP(m, 2, rr, &arp->tpa, &arp->sha, &arp->spa, &arp->sha);
                                                                         ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10223:68: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendARP(m, 2, rr, &arp->tpa, &arp->sha, &arp->spa, &arp->sha);
                                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10248:20: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, ARDisplayString(m, rr));
                                                                    ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10248:31: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, ARDisplayString(m, rr));
                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10252:20: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                    ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10252:31: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10305:36: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, sha, spa, &ndp->target, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                      ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10312:67: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendNDP(m, NDP_Adv, NDP_Solicited, rr, &ndp->target, mDNSNULL, spa,          sha             );
                                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10313:67: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg5) SendNDP(m, NDP_Adv, 0,             rr, &ndp->target, mDNSNULL, &AllHosts_v6, &AllHosts_v6_Eth);
                                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10326:36: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ndp->type == NDP_Adv) spa = &ndp->target;
                                                 ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10335:77: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        ndp->type == NDP_Sol ? "Solicitation " : "Advertisement", sha, spa, &ndp->target, ARDisplayString(m, rr));
                                                                                                                             ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10339:19: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        sha, spa, &ndp->target, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                   ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
16 warnings generated.
[  0% 544/80636] host Java: ahat (out/host/common/obj/JAVA_LIBRARIES/ahat_intermediates/classes)
warning: [options] bootstrap class path not set in conjunction with -source 1.7
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
1 warning
[  0% 547/80636] host Java: doclava (out/host/common/obj/JAVA_LIBRARIES/doclava_intermediates/classes)
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  0% 548/80636] host C: sqlite3 <= external/sqlite/dist/shell.c
external/sqlite/dist/shell.c:4264:7: warning: unused parameter 'nVal' [-Wunused-parameter]
  int nVal, 
      ^
1 warning generated.
[  1% 1088/80636] target Java: core-all (out/target/common/obj/JAVA_LIBRARIES/core-all_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  1% 1122/80636] target Java: libprotobuf-java-nano (out/target/common/obj/JAVA_LIBRARIES/libprotobuf-java-nano_intermediates/classes)
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  1% 1388/80636] target Java: core-libart (out/target/common/obj/JAVA_LIBRARIES/core-libart_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  1% 1432/80636] target Java: core-oj (out/target/common/obj/JAVA_LIBRARIES/core-oj_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  1% 1494/80636] target Java: okhttp (out/target/common/obj/JAVA_LIBRARIES/okhttp_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  1% 1548/80636] target Java: apache-xml (out/target/common/obj/JAVA_LIBRARIES/apache-xml_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  2% 1620/80636] target Java: ext (out/target/common/obj/JAVA_LIBRARIES/ext_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[  2% 1913/80636] build out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf
FAILED: out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf 
/bin/bash -c "(m4  		-D mls_num_sens=1 -D mls_num_cats=1024 		-D target_build_variant=eng 		-D target_with_dexpreopt=true 		-D target_arch=arm64 		-D target_with_asan=false 		-D target_full_treble=false 		-s system/sepolicy/private/security_classes system/sepolicy/private/initial_sids system/sepolicy/private/access_vectors system/sepolicy/public/global_macros system/sepolicy/public/neverallow_macros system/sepolicy/private/mls_macros system/sepolicy/private/mls_decl system/sepolicy/private/mls system/sepolicy/private/policy_capabilities system/sepolicy/public/te_macros system/sepolicy/public/attributes system/sepolicy/private/attributes system/sepolicy/public/ioctl_defines system/sepolicy/public/ioctl_macros system/sepolicy/public/adbd.te system/sepolicy/public/asan_extract.te system/sepolicy/public/audioserver.te system/sepolicy/public/blkid.te system/sepolicy/public/blkid_untrusted.te system/sepolicy/public/bluetooth.te system/sepolicy/public/bootanim.te system/sepolicy/public/bootstat.te system/sepolicy/public/bufferhubd.te system/sepolicy/public/cameraserver.te system/sepolicy/public/charger.te system/sepolicy/public/clatd.te system/sepolicy/public/cppreopts.te system/sepolicy/public/crash_dump.te system/sepolicy/public/device.te system/sepolicy/public/dex2oat.te system/sepolicy/public/dhcp.te system/sepolicy/public/display_service_server.te system/sepolicy/public/dnsmasq.te system/sepolicy/public/domain.te system/sepolicy/public/drmserver.te system/sepolicy/public/dumpstate.te system/sepolicy/public/ephemeral_app.te system/sepolicy/public/file.te system/sepolicy/public/fingerprintd.te system/sepolicy/public/fsck.te system/sepolicy/public/fsck_untrusted.te system/sepolicy/public/gatekeeperd.te system/sepolicy/public/hal_allocator.te system/sepolicy/public/hal_audio.te system/sepolicy/public/hal_bluetooth.te system/sepolicy/public/hal_bootctl.te system/sepolicy/public/hal_camera.te system/sepolicy/public/hal_configstore.te system/sepolicy/public/hal_contexthub.te system/sepolicy/public/hal_drm.te system/sepolicy/public/hal_dumpstate.te system/sepolicy/public/hal_fingerprint.te system/sepolicy/public/hal_gatekeeper.te system/sepolicy/public/hal_gnss.te system/sepolicy/public/hal_graphics_allocator.te system/sepolicy/public/hal_graphics_composer.te system/sepolicy/public/hal_health.te system/sepolicy/public/hal_ir.te system/sepolicy/public/hal_keymaster.te system/sepolicy/public/hal_light.te system/sepolicy/public/hal_memtrack.te system/sepolicy/public/hal_neverallows.te system/sepolicy/public/hal_nfc.te system/sepolicy/public/hal_oemlock.te system/sepolicy/public/hal_power.te system/sepolicy/public/hal_sensors.te system/sepolicy/public/hal_telephony.te system/sepolicy/public/hal_tetheroffload.te system/sepolicy/public/hal_thermal.te system/sepolicy/public/hal_tv_cec.te system/sepolicy/public/hal_tv_input.te system/sepolicy/public/hal_usb.te system/sepolicy/public/hal_vibrator.te system/sepolicy/public/hal_vr.te system/sepolicy/public/hal_weaver.te system/sepolicy/public/hal_wifi.te system/sepolicy/public/hal_wifi_offload.te system/sepolicy/public/hal_wifi_supplicant.te system/sepolicy/public/healthd.te system/sepolicy/public/hwservice.te system/sepolicy/public/hwservicemanager.te system/sepolicy/public/idmap.te system/sepolicy/public/incident.te system/sepolicy/public/incidentd.te system/sepolicy/public/init.te system/sepolicy/public/inputflinger.te system/sepolicy/public/install_recovery.te system/sepolicy/public/installd.te system/sepolicy/public/isolated_app.te system/sepolicy/public/kernel.te system/sepolicy/public/keystore.te system/sepolicy/public/lmkd.te system/sepolicy/public/logd.te system/sepolicy/public/logpersist.te system/sepolicy/public/mdnsd.te system/sepolicy/public/mediacodec.te system/sepolicy/public/mediadrmserver.te system/sepolicy/public/mediaextractor.te system/sepolicy/public/mediametrics.te system/sepolicy/public/mediaserver.te system/sepolicy/public/modprobe.te system/sepolicy/public/mtp.te system/sepolicy/public/net.te system/sepolicy/public/netd.te system/sepolicy/public/netutils_wrapper.te system/sepolicy/public/nfc.te system/sepolicy/public/otapreopt_chroot.te system/sepolicy/public/otapreopt_slot.te system/sepolicy/public/performanced.te system/sepolicy/public/perfprofd.te system/sepolicy/public/platform_app.te system/sepolicy/public/postinstall.te system/sepolicy/public/postinstall_dexopt.te system/sepolicy/public/ppp.te system/sepolicy/public/preopt2cachename.te system/sepolicy/public/priv_app.te system/sepolicy/public/profman.te system/sepolicy/public/property.te system/sepolicy/public/racoon.te system/sepolicy/public/radio.te system/sepolicy/public/recovery.te system/sepolicy/public/recovery_persist.te system/sepolicy/public/recovery_refresh.te system/sepolicy/public/rild.te system/sepolicy/public/runas.te system/sepolicy/public/sdcardd.te system/sepolicy/public/service.te system/sepolicy/public/servicemanager.te system/sepolicy/public/sgdisk.te system/sepolicy/public/shared_relro.te system/sepolicy/public/shell.te system/sepolicy/public/slideshow.te system/sepolicy/public/su.te system/sepolicy/public/surfaceflinger.te system/sepolicy/public/system_app.te system/sepolicy/public/system_server.te system/sepolicy/public/tee.te system/sepolicy/public/tombstoned.te system/sepolicy/public/toolbox.te system/sepolicy/public/tzdatacheck.te system/sepolicy/public/ueventd.te system/sepolicy/public/uncrypt.te system/sepolicy/public/untrusted_app.te system/sepolicy/public/untrusted_app_25.te system/sepolicy/public/untrusted_v2_app.te system/sepolicy/public/update_engine.te system/sepolicy/public/update_engine_common.te system/sepolicy/public/update_verifier.te system/sepolicy/public/vdc.te system/sepolicy/public/vendor_shell.te system/sepolicy/public/vendor_toolbox.te system/sepolicy/public/virtual_touchpad.te system/sepolicy/public/vndservice.te system/sepolicy/public/vndservicemanager.te system/sepolicy/public/vold.te system/sepolicy/public/vr_hwc.te system/sepolicy/public/watchdogd.te system/sepolicy/public/webview_zygote.te system/sepolicy/public/wificond.te system/sepolicy/public/zygote.te system/sepolicy/private/adbd.te system/sepolicy/private/app.te system/sepolicy/private/app_neverallows.te system/sepolicy/private/asan_extract.te system/sepolicy/private/atrace.te system/sepolicy/private/audioserver.te system/sepolicy/private/binder_in_vendor_violators.te system/sepolicy/private/binderservicedomain.te system/sepolicy/private/blkid.te system/sepolicy/private/blkid_untrusted.te system/sepolicy/private/bluetooth.te system/sepolicy/private/bluetoothdomain.te system/sepolicy/private/bootanim.te system/sepolicy/private/bootstat.te system/sepolicy/private/bufferhubd.te system/sepolicy/private/cameraserver.te system/sepolicy/private/charger.te system/sepolicy/private/clatd.te system/sepolicy/private/cppreopts.te system/sepolicy/private/crash_dump.te system/sepolicy/private/dex2oat.te system/sepolicy/private/dexoptanalyzer.te system/sepolicy/private/dhcp.te system/sepolicy/private/dnsmasq.te system/sepolicy/private/domain.te system/sepolicy/private/domain_deprecated.te system/sepolicy/private/drmserver.te system/sepolicy/private/dumpstate.te system/sepolicy/private/ephemeral_app.te system/sepolicy/private/file.te system/sepolicy/private/fingerprintd.te system/sepolicy/private/fsck.te system/sepolicy/private/fsck_untrusted.te system/sepolicy/private/gatekeeperd.te system/sepolicy/private/hal_allocator_default.te system/sepolicy/private/halclientdomain.te system/sepolicy/private/halserverdomain.te system/sepolicy/private/healthd.te system/sepolicy/private/hwservicemanager.te system/sepolicy/private/idmap.te system/sepolicy/private/incident.te system/sepolicy/private/incidentd.te system/sepolicy/private/init.te system/sepolicy/private/inputflinger.te system/sepolicy/private/install_recovery.te system/sepolicy/private/installd.te system/sepolicy/private/isolated_app.te system/sepolicy/private/kernel.te system/sepolicy/private/keystore.te system/sepolicy/private/lmkd.te system/sepolicy/private/logd.te system/sepolicy/private/logpersist.te system/sepolicy/private/mdnsd.te system/sepolicy/private/mediadrmserver.te system/sepolicy/private/mediaextractor.te system/sepolicy/private/mediametrics.te system/sepolicy/private/mediaserver.te system/sepolicy/private/modprobe.te system/sepolicy/private/mtp.te system/sepolicy/private/net.te system/sepolicy/private/netd.te system/sepolicy/private/netutils_wrapper.te system/sepolicy/private/nfc.te system/sepolicy/private/otapreopt_chroot.te system/sepolicy/private/otapreopt_slot.te system/sepolicy/private/performanced.te system/sepolicy/private/perfprofd.te system/sepolicy/private/platform_app.te system/sepolicy/private/postinstall.te system/sepolicy/private/postinstall_dexopt.te system/sepolicy/private/ppp.te system/sepolicy/private/preopt2cachename.te system/sepolicy/private/priv_app.te system/sepolicy/private/profman.te system/sepolicy/private/racoon.te system/sepolicy/private/radio.te system/sepolicy/private/recovery.te system/sepolicy/private/recovery_persist.te system/sepolicy/private/recovery_refresh.te system/sepolicy/private/runas.te system/sepolicy/private/sdcardd.te system/sepolicy/private/servicemanager.te system/sepolicy/private/sgdisk.te system/sepolicy/private/shared_relro.te system/sepolicy/private/shell.te system/sepolicy/private/slideshow.te system/sepolicy/private/storaged.te system/sepolicy/private/su.te system/sepolicy/private/surfaceflinger.te system/sepolicy/private/system_app.te system/sepolicy/private/system_server.te system/sepolicy/private/tombstoned.te system/sepolicy/private/toolbox.te system/sepolicy/private/tzdatacheck.te system/sepolicy/private/ueventd.te system/sepolicy/private/uncrypt.te system/sepolicy/private/untrusted_app.te system/sepolicy/private/untrusted_app_25.te system/sepolicy/private/untrusted_app_all.te system/sepolicy/private/untrusted_v2_app.te system/sepolicy/private/update_engine.te system/sepolicy/private/update_engine_common.te system/sepolicy/private/update_verifier.te system/sepolicy/private/vdc.te system/sepolicy/private/virtual_touchpad.te system/sepolicy/private/vold.te system/sepolicy/private/vr_hwc.te system/sepolicy/private/watchdogd.te system/sepolicy/private/webview_zygote.te system/sepolicy/private/wificond.te system/sepolicy/private/zygote.te system/sepolicy/private/roles_decl system/sepolicy/public/roles system/sepolicy/private/users system/sepolicy/private/initial_sid_contexts system/sepolicy/private/fs_use system/sepolicy/private/genfs_contexts system/sepolicy/private/port_contexts > out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf ) && (sed '/dontaudit/d' out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf > out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf.dontaudit )"
/bin/bash: m4: command not found
[  2% 1914/80636] Yacc: checkpolicy <= external/selinux/checkpolicy/policy_parse.y
FAILED: out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c 
/bin/bash -c "prebuilts/misc/linux-x86/bison/bison -d -v --defines=out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.h -o out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c external/selinux/checkpolicy/policy_parse.y"
prebuilts/misc/linux-x86/bison/bison: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory
[  2% 1916/80636] Lex: checkpolicy <= external/selinux/checkpolicy/policy_scan.l
FAILED: out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_scan.c 
/bin/bash -c "prebuilts/misc/linux-x86/flex/flex-2.5.39 -oout/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_scan.c external/selinux/checkpolicy/policy_scan.l"
flex-2.5.39: fatal internal error, exec of /usr/bin/m4 failed
[  2% 1920/80636] target  C++: libtrunks_test <= system/tpm/trunks/mock_tpm.cc
ninja: build stopped: subcommand failed.
18:52:41 ninja failed with: exit status 1
build/core/main.mk:21: recipe for target 'run_soong_ui' failed
make: *** [run_soong_ui] Error 1

#### make failed to build some targets (08:52 (mm:ss)) ####

sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ which m4
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install m4
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libsigsegv2
The following NEW packages will be installed:
  libsigsegv2 m4
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 209 kB of archives.
After this operation, 409 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libsigsegv2 amd64 2.10-4 [14.1 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 m4 amd64 1.4.17-5 [195 kB]
Fetched 209 kB in 3s (68.5 kB/s)
Selecting previously unselected package libsigsegv2:amd64.
(Reading database ... 229291 files and directories currently installed.)
Preparing to unpack .../libsigsegv2_2.10-4_amd64.deb ...
Unpacking libsigsegv2:amd64 (2.10-4) ...
Selecting previously unselected package m4.
Preparing to unpack .../archives/m4_1.4.17-5_amd64.deb ...
Unpacking m4 (1.4.17-5) ...
Processing triggers for install-info (6.1.0.dfsg.1-5) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libsigsegv2:amd64 (2.10-4) ...
Setting up m4 (1.4.17-5) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ which ccache
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install ccache
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  distcc
The following NEW packages will be installed:
  ccache
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 83.7 kB of archives.
After this operation, 261 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 ccache amd64 3.2.4-1 [83.7 kB]
Fetched 83.7 kB in 1s (54.2 kB/s) 
Selecting previously unselected package ccache.
(Reading database ... 229359 files and directories currently installed.)
Preparing to unpack .../ccache_3.2.4-1_amd64.deb ...
Unpacking ccache (3.2.4-1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Processing triggers for man-db (2.7.5-1) ...
Setting up ccache (3.2.4-1) ...
Updating symlinks in /usr/lib/ccache ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install xsltproc 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  xsltproc
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 13.4 kB of archives.
After this operation, 148 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 xsltproc amd64 1.1.28-2.1 [13.4 kB]
Fetched 13.4 kB in 0s (22.2 kB/s)   
Selecting previously unselected package xsltproc.
(Reading database ... 229374 files and directories currently installed.)
Preparing to unpack .../xsltproc_1.1.28-2.1_amd64.deb ...
Unpacking xsltproc (1.1.28-2.1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up xsltproc (1.1.28-2.1) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libxml
Display all 174 possibilities? (y or n)
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libxml2-utils
libxml2-utils      libxml2-utils-dbg  
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libxml2-utils
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  libxml2-utils
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 35.0 kB of archives.
After this operation, 180 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libxml2-utils amd64 2.9.3+dfsg1-1 [35.0 kB]
Fetched 35.0 kB in 1s (19.3 kB/s)        
Selecting previously unselected package libxml2-utils.
(Reading database ... 229384 files and directories currently installed.)
Preparing to unpack .../libxml2-utils_2.9.3+dfsg1-1_amd64.deb ...
Unpacking libxml2-utils (2.9.3+dfsg1-1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libxml2-utils (2.9.3+dfsg1-1) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libgl1-mesa-d
libgl1-mesa-dev                 libgl1-mesa-dev-lts-vivid       libgl1-mesa-dri                 libgl1-mesa-dri-lts-utopic-dbg  libgl1-mesa-dri-lts-vivid-dbg   libgl1-mesa-dri-lts-wily-dbg
libgl1-mesa-dev-lts-utopic      libgl1-mesa-dev-lts-wily        libgl1-mesa-dri-lts-utopic      libgl1-mesa-dri-lts-vivid       libgl1-mesa-dri-lts-wily        
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libgl1-mesa-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libgl1-mesa-dev : Depends: mesa-common-dev (= 11.2.0-1ubuntu2) but it is not going to be installed
                   Depends: libgl1-mesa-glx (= 11.2.0-1ubuntu2) but 18.0.5-0ubuntu0~16.04.1 is to be installed
                   Depends: libdrm-dev (>= 2.4.65) but it is not going to be installed
                   Depends: libx11-xcb-dev but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libgl1-mesa-
libgl1-mesa-dev                 libgl1-mesa-dev-lts-wily        libgl1-mesa-dri-lts-utopic-dbg  libgl1-mesa-dri-lts-wily        libgl1-mesa-glx-lts-utopic      libgl1-mesa-glx-lts-vivid-dbg
libgl1-mesa-dev-lts-utopic      libgl1-mesa-dri                 libgl1-mesa-dri-lts-vivid       libgl1-mesa-dri-lts-wily-dbg    libgl1-mesa-glx-lts-utopic-dbg  libgl1-mesa-glx-lts-wily
libgl1-mesa-dev-lts-vivid       libgl1-mesa-dri-lts-utopic      libgl1-mesa-dri-lts-vivid-dbg   libgl1-mesa-glx                 libgl1-mesa-glx-lts-vivid       libgl1-mesa-glx-lts-wily-dbg
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libgl1-mesa-glx
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libgl1-mesa-glx is already the newest version (18.0.5-0ubuntu0~16.04.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install mesa-common-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 mesa-common-dev : Depends: libdrm-dev (>= 2.4.65) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libdrm-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libdrm-dev : Depends: libdrm2 (= 2.4.67-1) but 2.4.91-2~16.04.1 is to be installed
              Depends: libdrm-intel1 (= 2.4.67-1) but 2.4.91-2~16.04.1 is to be installed
              Depends: libdrm-radeon1 (= 2.4.67-1) but 2.4.91-2~16.04.1 is to be installed
              Depends: libdrm-nouveau2 (= 2.4.67-1) but 2.4.91-2~16.04.1 is to be installed
              Depends: libdrm-amdgpu1 (= 2.4.67-1) but 2.4.91-2~16.04.1 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libdrm2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libdrm2 is already the newest version (2.4.91-2~16.04.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libdrm-
libdrm-amdgpu1       libdrm-amdgpu1-dbg   libdrm-common        libdrm-dev           libdrm-intel1        libdrm-intel1-dbg    libdrm-nouveau2      libdrm-nouveau2-dbg  libdrm-radeon1       libdrm-radeon1-dbg
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libx11-dev:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libx11-dev:i386 : Depends: libx11-6:i386 (= 2:1.6.3-1ubuntu2) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ source build/envsetup.sh 
including device/asus/fugu/vendorsetup.sh
including device/generic/car/car-arm64/vendorsetup.sh
including device/generic/car/car-armv7-a-neon/vendorsetup.sh
including device/generic/car/car-x86_64/vendorsetup.sh
including device/generic/car/car-x86/vendorsetup.sh
including device/generic/mini-emulator-arm64/vendorsetup.sh
including device/generic/mini-emulator-armv7-a-neon/vendorsetup.sh
including device/generic/mini-emulator-mips64/vendorsetup.sh
including device/generic/mini-emulator-mips/vendorsetup.sh
including device/generic/mini-emulator-x86_64/vendorsetup.sh
including device/generic/mini-emulator-x86/vendorsetup.sh
including device/google/dragon/vendorsetup.sh
including device/google/marlin/vendorsetup.sh
including device/huawei/angler/vendorsetup.sh
including device/lge/bullhead/vendorsetup.sh
including device/linaro/hikey/vendorsetup.sh
including sdk/bash_completion/adb.bash
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ make -j8
============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
============================================
ninja: no work to do.
ninja: no work to do.
wildcard(out/target/product/generic_arm64/clean_steps.mk) was changed, regenerating...
[9/974] including ./cts/Android.mk ...
cts/apps/CtsVerifier/Android.mk:72: warning: FindEmulator: find: `cts/apps/CtsVerifier/src/com/android/cts/verifier/backup': No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/res: No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/backup/assets: No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/src': No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/src': No such file or directory
cts/tests/tests/contactsproviderwipe/Android.mk:33: warning: FindEmulator: find: `cts/tests/tests/contactsproviderwipe/common/src': No such file or directory
cts/tests/tests/telecom3/Android.mk:37: warning: FindEmulator: find: `cts/tests/tests/telecom/src/android/telecom/cts/MockDialerActivity.java': No such file or directory
[323/974] including ./external/toybox/Android.mk ...
awk: line 1: syntax error at or near ,
[355/974] including ./frameworks/av/media/libaaudio/Android.mk ...
frameworks/av/media/libaaudio/examples/input_monitor/static/Android.mk: warning: input_monitor: unusual tags examples 
frameworks/av/media/libaaudio/examples/write_sine/static/Android.mk: warning: write_sine: unusual tags examples 
[389/974] including ./frameworks/base/Android.mk ...
./frameworks/base/Android.mk:865: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:874: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:879: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:884: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
[717/974] including ./system/sepolicy/Android.mk ...
./system/sepolicy/Android.mk:107: warning: BOARD_SEPOLICY_VERS not specified, assuming current platform version
[974/974] including ./tools/tradefederation/core/Android.mk ...
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module perf-setup.sh 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RecyclerViewTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module LauncherFunctionalTests 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module perf-setup.sh 
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
build/core/base_rules.mk:466: warning: overriding commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
./test/vts/utils/python/archive/Android.mk:28: warning: overriding commands for target `default'
./test/vts/runners/host/tcp_server/Android.mk:19: warning: ignoring old commands for target `default'
./test/vts/utils/python/coverage/Android.mk:28: warning: overriding commands for target `default'
./test/vts/utils/python/archive/Android.mk:28: warning: ignoring old commands for target `default'
[  0% 1/78719] Yacc: checkpolicy <= external/selinux/checkpolicy/policy_parse.y
FAILED: out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c 
/bin/bash -c "prebuilts/misc/linux-x86/bison/bison -d -v --defines=out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.h -o out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c external/selinux/checkpolicy/policy_parse.y"
prebuilts/misc/linux-x86/bison/bison: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory
[  0% 8/78719] target StaticLib: libtrunks_test_32 (out/target/product/generic_arm64/obj_arm/STATIC_LIBRARIES/libtrunks_test_intermediates/libtrunks_test.a)
ninja: build stopped: subcommand failed.
18:59:59 ninja failed with: exit status 1
build/core/main.mk:21: recipe for target 'run_soong_ui' failed
make: *** [run_soong_ui] Error 1

#### make failed to build some targets (41 seconds) ####

sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libc6-dev-i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Recommended packages:
  gcc-multilib
The following NEW packages will be installed:
  libc6-dev-i386
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,265 kB of archives.
After this operation, 6,940 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libc6-dev-i386 amd64 2.23-0ubuntu3 [1,265 kB]
Fetched 1,265 kB in 3s (403 kB/s)         
Selecting previously unselected package libc6-dev-i386.
(Reading database ... 229395 files and directories currently installed.)
Preparing to unpack .../libc6-dev-i386_2.23-0ubuntu3_amd64.deb ...
Unpacking libc6-dev-i386 (2.23-0ubuntu3) ...
Setting up libc6-dev-i386 (2.23-0ubuntu3) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install zlib1g-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 zlib1g-dev : Depends: zlib1g (= 1:1.2.8.dfsg-2ubuntu4) but 1:1.2.8.dfsg-2ubuntu4.1 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install gcc-multilib
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 gcc-multilib : Depends: gcc-5-multilib (>= 5.3.1-3~) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libreadline6-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libtinfo-dev
Suggested packages:
  readline-doc
The following NEW packages will be installed:
  libreadline6-dev libtinfo-dev
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 201 kB of archives.
After this operation, 1,087 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libtinfo-dev amd64 6.0+20160213-1ubuntu1 [77.4 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libreadline6-dev amd64 6.3-8ubuntu2 [124 kB]
Fetched 201 kB in 2s (86.1 kB/s)           
Selecting previously unselected package libtinfo-dev:amd64.
(Reading database ... 229529 files and directories currently installed.)
Preparing to unpack .../libtinfo-dev_6.0+20160213-1ubuntu1_amd64.deb ...
Unpacking libtinfo-dev:amd64 (6.0+20160213-1ubuntu1) ...
Selecting previously unselected package libreadline6-dev:amd64.
Preparing to unpack .../libreadline6-dev_6.3-8ubuntu2_amd64.deb ...
Unpacking libreadline6-dev:amd64 (6.3-8ubuntu2) ...
Processing triggers for install-info (6.1.0.dfsg.1-5) ...
Setting up libtinfo-dev:amd64 (6.0+20160213-1ubuntu1) ...
Setting up libreadline6-dev:amd64 (6.3-8ubuntu2) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libgl1-mesa-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libgl1-mesa-dev : Depends: mesa-common-dev (= 11.2.0-1ubuntu2) but it is not going to be installed
                   Depends: libgl1-mesa-glx (= 11.2.0-1ubuntu2) but 18.0.5-0ubuntu0~16.04.1 is to be installed
                   Depends: libdrm-dev (>= 2.4.65) but it is not going to be installed
                   Depends: libx11-xcb-dev but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install g++-multilib
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 g++-multilib : Depends: gcc-multilib (>= 4:5.3.1-1ubuntu1) but it is not going to be installed
                Depends: g++ (>= 4:5.3.1-1ubuntu1) but it is not going to be installed
                Depends: g++-5-multilib (>= 5.3.1-3~) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libx11-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libx11-dev is already the newest version (2:1.6.3-1ubuntu2.1).
libx11-dev set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt-get install -y git flex bison gperf build-essential libncurses5-dev:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
git is already the newest version (1:2.7.4-0ubuntu1.4).
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 build-essential : Depends: g++ (>= 4:5.2) but it is not going to be installed
 libncurses5-dev:i386 : Depends: libc6-dev:i386 but it is not going to be installed or
                                 libc-dev:i386
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install flex
flex          flexbackup    flexbar       flexc++       flexdll       flex-doc      flexloader    flexml        flex-old      flex-old-doc  flexpart      flextra       
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install flex
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libfl-dev
Suggested packages:
  bison build-essential
The following NEW packages will be installed:
  flex libfl-dev
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 302 kB of archives.
After this operation, 897 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libfl-dev amd64 2.6.0-11 [12.5 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 flex amd64 2.6.0-11 [290 kB]
Fetched 302 kB in 1s (163 kB/s)
Selecting previously unselected package libfl-dev:amd64.
(Reading database ... 229553 files and directories currently installed.)
Preparing to unpack .../libfl-dev_2.6.0-11_amd64.deb ...
Unpacking libfl-dev:amd64 (2.6.0-11) ...
Selecting previously unselected package flex.
Preparing to unpack .../flex_2.6.0-11_amd64.deb ...
Unpacking flex (2.6.0-11) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Processing triggers for install-info (6.1.0.dfsg.1-5) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Processing triggers for man-db (2.7.5-1) ...
Setting up libfl-dev:amd64 (2.6.0-11) ...
Setting up flex (2.6.0-11) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install bison gper
gperf      gperf-ace  gperiodic  
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install bison gperf
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libbison-dev
Suggested packages:
  bison-doc
The following NEW packages will be installed:
  bison gperf libbison-dev
0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 699 kB of archives.
After this operation, 2,086 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libbison-dev amd64 2:3.0.4.dfsg-1 [338 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 bison amd64 2:3.0.4.dfsg-1 [259 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial/universe amd64 gperf amd64 3.0.4-2 [102 kB]
Fetched 699 kB in 3s (195 kB/s)
Selecting previously unselected package libbison-dev:amd64.
(Reading database ... 229645 files and directories currently installed.)
Preparing to unpack .../libbison-dev_2%3a3.0.4.dfsg-1_amd64.deb ...
Unpacking libbison-dev:amd64 (2:3.0.4.dfsg-1) ...
Selecting previously unselected package bison.
Preparing to unpack .../bison_2%3a3.0.4.dfsg-1_amd64.deb ...
Unpacking bison (2:3.0.4.dfsg-1) ...
Selecting previously unselected package gperf.
Preparing to unpack .../gperf_3.0.4-2_amd64.deb ...
Unpacking gperf (3.0.4-2) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Processing triggers for install-info (6.1.0.dfsg.1-5) ...
Setting up libbison-dev:amd64 (2:3.0.4.dfsg-1) ...
Setting up bison (2:3.0.4.dfsg-1) ...
update-alternatives: using /usr/bin/bison.yacc to provide /usr/bin/yacc (yacc) in auto mode
Setting up gperf (3.0.4-2) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 


sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install build-essential 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 build-essential : Depends: g++ (>= 4:5.2) but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libncurses
libncurses5         libncurses5-dev     libncursesada3-dev  libncursesada-doc   libncursesw5        libncursesw5-dev    
libncurses5-dbg     libncursesada3      libncursesada-dbg   libncurses-gst      libncursesw5-dbg    
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libncurses-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'libncurses5-dev' instead of 'libncurses-dev'
Suggested packages:
  ncurses-doc
The following NEW packages will be installed:
  libncurses5-dev
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 175 kB of archives.
After this operation, 1,060 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 libncurses5-dev amd64 6.0+20160213-1ubuntu1 [175 kB]
Fetched 175 kB in 1s (105 kB/s)           
Selecting previously unselected package libncurses5-dev:amd64.
(Reading database ... 229711 files and directories currently installed.)
Preparing to unpack .../libncurses5-dev_6.0+20160213-1ubuntu1_amd64.deb ...
Unpacking libncurses5-dev:amd64 (6.0+20160213-1ubuntu1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libncurses5-dev:amd64 (6.0+20160213-1ubuntu1) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install tofrodos python-mar
python-marisa          python-markdown        python-markdown-doc    python-markupsafe      python-markupsafe-dbg  python-martian         
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install tofrodos python-markdown
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python-chardet python-pkg-resources python-pygments python-yaml
Suggested packages:
  python-markdown-doc python-setuptools ttf-bitstream-vera
The following NEW packages will be installed:
  python-chardet python-markdown python-pkg-resources python-pygments python-yaml tofrodos
0 upgraded, 6 newly installed, 0 to remove and 0 not upgraded.
Need to get 905 kB of archives.
After this operation, 4,632 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 python-pkg-resources all 20.7.0-1 [108 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 python-chardet all 2.3.0-2 [96.3 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial/universe amd64 python-markdown all 2.6.6-1 [53.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial/main amd64 python-pygments all 2.1+dfsg-1 [522 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial/main amd64 python-yaml amd64 3.11-3build1 [105 kB]
Get:6 http://archive.ubuntu.com/ubuntu xenial/universe amd64 tofrodos amd64 1.7.13+ds-2ubuntu1 [19.9 kB]
Fetched 905 kB in 6s (151 kB/s)                                                                                                                                                                                    
Selecting previously unselected package python-pkg-resources.
(Reading database ... 229750 files and directories currently installed.)
Preparing to unpack .../python-pkg-resources_20.7.0-1_all.deb ...
Unpacking python-pkg-resources (20.7.0-1) ...
Selecting previously unselected package python-chardet.
Preparing to unpack .../python-chardet_2.3.0-2_all.deb ...
Unpacking python-chardet (2.3.0-2) ...
Selecting previously unselected package python-markdown.
Preparing to unpack .../python-markdown_2.6.6-1_all.deb ...
Unpacking python-markdown (2.6.6-1) ...
Selecting previously unselected package python-pygments.
Preparing to unpack .../python-pygments_2.1+dfsg-1_all.deb ...
Unpacking python-pygments (2.1+dfsg-1) ...
Selecting previously unselected package python-yaml.
Preparing to unpack .../python-yaml_3.11-3build1_amd64.deb ...
Unpacking python-yaml (3.11-3build1) ...
Selecting previously unselected package tofrodos.
Preparing to unpack .../tofrodos_1.7.13+ds-2ubuntu1_amd64.deb ...
Unpacking tofrodos (1.7.13+ds-2ubuntu1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for doc-base (0.10.7) ...
Processing 1 added doc-base file...
Setting up python-pkg-resources (20.7.0-1) ...
Setting up python-chardet (2.3.0-2) ...
Setting up python-markdown (2.6.6-1) ...
Setting up python-pygments (2.1+dfsg-1) ...
Setting up python-yaml (3.11-3build1) ...
Setting up tofrodos (1.7.13+ds-2ubuntu1) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 


sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install zlib1g-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 zlib1g-dev : Depends: zlib1g (= 1:1.2.8.dfsg-2ubuntu4) but 1:1.2.8.dfsg-2ubuntu4.1 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install dpkg-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
dpkg-dev is already the newest version (1.18.4ubuntu1.4).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libsdl1.2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 libsdl1.2-dev : Depends: libcaca-dev but it is not going to be installed
                 Depends: libglu1-mesa-dev but it is not going to be installed or
                          libglu-dev
                 Depends: libpulse-dev but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libesd0-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  esound-common libaudiofile-dev libaudiofile1 libesd0
Suggested packages:
  pulseaudio-esound-compat
The following NEW packages will be installed:
  esound-common libaudiofile-dev libaudiofile1 libesd0 libesd0-dev
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
Need to get 180 kB of archives.
After this operation, 721 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/universe amd64 libaudiofile1 amd64 0.3.6-2ubuntu0.15.10.1 [94.2 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/universe amd64 esound-common all 0.2.41-11 [9,558 B]
Get:3 http://archive.ubuntu.com/ubuntu xenial/universe amd64 libesd0 amd64 0.2.41-11 [16.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial/universe amd64 libaudiofile-dev amd64 0.3.6-2ubuntu0.15.10.1 [35.2 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial/universe amd64 libesd0-dev amd64 0.2.41-11 [24.4 kB]
Fetched 180 kB in 1s (99.2 kB/s)    
Selecting previously unselected package libaudiofile1:amd64.
(Reading database ... 230100 files and directories currently installed.)
Preparing to unpack .../libaudiofile1_0.3.6-2ubuntu0.15.10.1_amd64.deb ...
Unpacking libaudiofile1:amd64 (0.3.6-2ubuntu0.15.10.1) ...
Selecting previously unselected package esound-common.
Preparing to unpack .../esound-common_0.2.41-11_all.deb ...
Unpacking esound-common (0.2.41-11) ...
Selecting previously unselected package libesd0:amd64.
Preparing to unpack .../libesd0_0.2.41-11_amd64.deb ...
Unpacking libesd0:amd64 (0.2.41-11) ...
Selecting previously unselected package libaudiofile-dev:amd64.
Preparing to unpack .../libaudiofile-dev_0.3.6-2ubuntu0.15.10.1_amd64.deb ...
Unpacking libaudiofile-dev:amd64 (0.3.6-2ubuntu0.15.10.1) ...
Selecting previously unselected package libesd0-dev.
Preparing to unpack .../libesd0-dev_0.2.41-11_amd64.deb ...
Unpacking libesd0-dev (0.2.41-11) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libaudiofile1:amd64 (0.3.6-2ubuntu0.15.10.1) ...
Setting up esound-common (0.2.41-11) ...
Setting up libesd0:amd64 (0.2.41-11) ...
Setting up libaudiofile-dev:amd64 (0.3.6-2ubuntu0.15.10.1) ...
Setting up libesd0-dev (0.2.41-11) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install gnupg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
gnupg is already the newest version (1.4.20-1ubuntu3.3).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install zlib1g-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 zlib1g-dev : Depends: zlib1g (= 1:1.2.8.dfsg-2ubuntu4) but 1:1.2.8.dfsg-2ubuntu4.1 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ source build/envsetup.sh 
including device/asus/fugu/vendorsetup.sh
including device/generic/car/car-arm64/vendorsetup.sh
including device/generic/car/car-armv7-a-neon/vendorsetup.sh
including device/generic/car/car-x86_64/vendorsetup.sh
including device/generic/car/car-x86/vendorsetup.sh
including device/generic/mini-emulator-arm64/vendorsetup.sh
including device/generic/mini-emulator-armv7-a-neon/vendorsetup.sh
including device/generic/mini-emulator-mips64/vendorsetup.sh
including device/generic/mini-emulator-mips/vendorsetup.sh
including device/generic/mini-emulator-x86_64/vendorsetup.sh
including device/generic/mini-emulator-x86/vendorsetup.sh
including device/google/dragon/vendorsetup.sh
including device/google/marlin/vendorsetup.sh
including device/huawei/angler/vendorsetup.sh
including device/lge/bullhead/vendorsetup.sh
including device/linaro/hikey/vendorsetup.sh
including sdk/bash_completion/adb.bash
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ make -j8
============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
============================================
ninja: no work to do.
ninja: no work to do.
out/target/product/generic_arm64/clean_steps.mk was modified, regenerating...
[9/974] including ./cts/Android.mk ...
cts/apps/CtsVerifier/Android.mk:72: warning: FindEmulator: find: `cts/apps/CtsVerifier/src/com/android/cts/verifier/backup': No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/cts/hostsidetests/appsecurity/test-apps/WriteExternalStorageApp/res: No such file or directory
build/core/java_common.mk:88: warning: FindEmulator: cd: cts/hostsidetests/backup/assets: No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider/src': No such file or directory
cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/Android.mk:23: warning: FindEmulator: find: `cts/hostsidetests/os/test-apps/StaticSharedNativeLibProvider1/src': No such file or directory
cts/tests/tests/contactsproviderwipe/Android.mk:33: warning: FindEmulator: find: `cts/tests/tests/contactsproviderwipe/common/src': No such file or directory
cts/tests/tests/telecom3/Android.mk:37: warning: FindEmulator: find: `cts/tests/tests/telecom/src/android/telecom/cts/MockDialerActivity.java': No such file or directory
[323/974] including ./external/toybox/Android.mk ...
awk: line 1: syntax error at or near ,
[355/974] including ./frameworks/av/media/libaaudio/Android.mk ...
frameworks/av/media/libaaudio/examples/input_monitor/static/Android.mk: warning: input_monitor: unusual tags examples 
frameworks/av/media/libaaudio/examples/write_sine/static/Android.mk: warning: write_sine: unusual tags examples 
[389/974] including ./frameworks/base/Android.mk ...
./frameworks/base/Android.mk:865: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:874: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:879: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
./frameworks/base/Android.mk:884: warning: FindEmulator: find: `frameworks/opt/telephony/src/java/android/provider': No such file or directory
[717/974] including ./system/sepolicy/Android.mk ...
./system/sepolicy/Android.mk:107: warning: BOARD_SEPOLICY_VERS not specified, assuming current platform version
[974/974] including ./tools/tradefederation/core/Android.mk ...
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module perf-setup.sh 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RecyclerViewTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module LauncherFunctionalTests 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module perf-setup.sh 
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
build/core/base_rules.mk:466: warning: overriding commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/host/linux-x86/cts/android-cts/testcases/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/libcrash-jni/libcrash-jni.so'
build/core/base_rules.mk:466: warning: overriding commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
build/core/base_rules.mk:466: warning: ignoring old commands for target `out/target/product/generic_arm64/testcases/hello_world_test/hello_world_test'
./test/vts/utils/python/archive/Android.mk:28: warning: overriding commands for target `default'
./test/vts/runners/host/tcp_server/Android.mk:19: warning: ignoring old commands for target `default'
./test/vts/utils/python/coverage/Android.mk:28: warning: overriding commands for target `default'
./test/vts/utils/python/archive/Android.mk:28: warning: ignoring old commands for target `default'
[  0% 1/78712] Yacc: checkpolicy <= external/selinux/checkpolicy/policy_parse.y
FAILED: out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c 
/bin/bash -c "prebuilts/misc/linux-x86/bison/bison -d -v --defines=out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.h -o out/host/linux-x86/obj/EXECUTABLES/checkpolicy_intermediates/policy_parse.c external/selinux/checkpolicy/policy_parse.y"
prebuilts/misc/linux-x86/bison/bison: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory
[  0% 8/78712] Check module type: out/host/linux-x86/obj/EXECUTABLES/version_policy_intermediates/link_type
ninja: build stopped: subcommand failed.
19:09:28 ninja failed with: exit status 1
build/core/main.mk:21: recipe for target 'run_soong_ui' failed
make: *** [run_soong_ui] Error 1

#### make failed to build some targets (37 seconds) ####

sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install libstdc++6 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libstdc++6 is already the newest version (5.4.0-6ubuntu1~16.04.10).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install lib32stdc++6
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 lib32stdc++6 : Depends: gcc-5-base (= 5.3.1-14ubuntu2) but 5.4.0-6ubuntu1~16.04.10 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install gcc-5-base 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
gcc-5-base is already the newest version (5.4.0-6ubuntu1~16.04.10).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install gcc-5-base:5.3.1-14ubuntu2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
E: Unable to locate package gcc-5-base:5.3.1-14ubuntu2
E: Couldn't find any package by glob 'gcc-5-base:5.3.1-14ubuntu2'
E: Couldn't find any package by regex 'gcc-5-base:5.3.1-14ubuntu2'
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo aptitude -f install lib32stdc++6
sudo: aptitude: command not found
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt -f install lib32stdc++6
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 lib32stdc++6 : Depends: gcc-5-base (= 5.3.1-14ubuntu2) but 5.4.0-6ubuntu1~16.04.10 is to be installed
E: Unable to correct problems, you have held broken packages.
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install lib32bz2-1.0
Reading package lists... Done
Building dependency tree       
Reading state information... Done
E: Unable to locate package lib32bz2-1.0
E: Couldn't find any package by glob 'lib32bz2-1.0'
E: Couldn't find any package by regex 'lib32bz2-1.0'
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ which aptitude
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ aptitude
The program 'aptitude' is currently not installed. You can install it by typing:
sudo apt install aptitude
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo apt install aptitude
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  aptitude-common libcwidget3v5
Suggested packages:
  apt-xapian-index aptitude-doc-en | aptitude-doc debtags tasksel libcwidget-dev
The following NEW packages will be installed:
  aptitude aptitude-common libcwidget3v5
0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 2,345 kB of archives.
After this operation, 9,865 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 aptitude-common all 0.7.4-2ubuntu2 [747 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial/main amd64 libcwidget3v5 amd64 0.5.17-4ubuntu2 [292 kB]
Get:3 http://archive.ubuntu.com/ubuntu xenial/main amd64 aptitude amd64 0.7.4-2ubuntu2 [1,306 kB]
Fetched 2,345 kB in 3s (632 kB/s)   
Selecting previously unselected package aptitude-common.
(Reading database ... 230193 files and directories currently installed.)
Preparing to unpack .../aptitude-common_0.7.4-2ubuntu2_all.deb ...
Unpacking aptitude-common (0.7.4-2ubuntu2) ...
Selecting previously unselected package libcwidget3v5:amd64.
Preparing to unpack .../libcwidget3v5_0.5.17-4ubuntu2_amd64.deb ...
Unpacking libcwidget3v5:amd64 (0.5.17-4ubuntu2) ...
Selecting previously unselected package aptitude.
Preparing to unpack .../aptitude_0.7.4-2ubuntu2_amd64.deb ...
Unpacking aptitude (0.7.4-2ubuntu2) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Setting up aptitude-common (0.7.4-2ubuntu2) ...
Setting up libcwidget3v5:amd64 (0.5.17-4ubuntu2) ...
Setting up aptitude (0.7.4-2ubuntu2) ...
update-alternatives: using /usr/bin/aptitude-curses to provide /usr/bin/aptitude (aptitude) in auto mode
Processing triggers for libc-bin (2.23-0ubuntu10) ...
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ sudo aptitude -f install lib32stdc++6
The following NEW packages will be installed:
  lib32stdc++6{b} 
0 packages upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 404 kB of archives. After unpacking 1,901 kB will be used.
The following packages have unmet dependencies:
 lib32stdc++6 : Depends: gcc-5-base (= 5.3.1-14ubuntu2) but 5.4.0-6ubuntu1~16.04.10 is installed.
The following actions will resolve these dependencies:

     Keep the following packages at their current version:
1)     lib32stdc++6 [Not Installed]                       



Accept this solution? [Y/n/q/?] n
The following actions will resolve these dependencies:

      Downgrade the following packages:                                         
1)      cpp-5 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]       
2)      gcc-5 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]       
3)      gcc-5-base [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]  
4)      libasan2 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]    
5)      libatomic1 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]  
6)      libcc1-0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]    
7)      libcilkrts5 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)] 
8)      libgcc-5-dev [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]
9)      libgomp1 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]    
10)     libitm1 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]     
11)     liblsan0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]    
12)     libmpx0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]     
13)     libquadmath0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]
14)     libstdc++6 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]  
15)     libtsan0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]    
16)     libubsan0 [5.4.0-6ubuntu1~16.04.10 (now) -> 5.3.1-14ubuntu2 (xenial)]   



Accept this solution? [Y/n/q/?] y
The following packages will be DOWNGRADED:
  cpp-5 gcc-5 gcc-5-base libasan2 libatomic1 libcc1-0 libcilkrts5 libgcc-5-dev libgomp1 libitm1 liblsan0 libmpx0 libquadmath0 libstdc++6 libtsan0 libubsan0 
The following NEW packages will be installed:
  lib32stdc++6 
0 packages upgraded, 1 newly installed, 16 downgraded, 0 to remove and 0 not upgraded.
Need to get 20.4 MB of archives. After unpacking 1,972 kB will be used.
Do you want to continue? [Y/n/?] y
Get: 1 http://archive.ubuntu.com/ubuntu xenial/main amd64 gcc-5 amd64 5.3.1-14ubuntu2 [8,549 kB]
Get: 2 http://archive.ubuntu.com/ubuntu xenial/main amd64 cpp-5 amd64 5.3.1-14ubuntu2 [7,788 kB]                                                                                                                    
Get: 3 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgcc-5-dev amd64 5.3.1-14ubuntu2 [2,235 kB]                                                                                                             
Get: 4 http://archive.ubuntu.com/ubuntu xenial/main amd64 libitm1 amd64 5.3.1-14ubuntu2 [27.4 kB]                                                                                                                   
Get: 5 http://archive.ubuntu.com/ubuntu xenial/main amd64 libquadmath0 amd64 5.3.1-14ubuntu2 [131 kB]                                                                                                               
Get: 6 http://archive.ubuntu.com/ubuntu xenial/main amd64 liblsan0 amd64 5.3.1-14ubuntu2 [110 kB]                                                                                                                   
Get: 7 http://archive.ubuntu.com/ubuntu xenial/main amd64 libasan2 amd64 5.3.1-14ubuntu2 [269 kB]                                                                                                                   
Get: 8 http://archive.ubuntu.com/ubuntu xenial/main amd64 libtsan0 amd64 5.3.1-14ubuntu2 [248 kB]                                                                                                                   
Get: 9 http://archive.ubuntu.com/ubuntu xenial/main amd64 libubsan0 amd64 5.3.1-14ubuntu2 [100 kB]                                                                                                                  
Get: 10 http://archive.ubuntu.com/ubuntu xenial/main amd64 libcilkrts5 amd64 5.3.1-14ubuntu2 [40.1 kB]                                                                                                              
Get: 11 http://archive.ubuntu.com/ubuntu xenial/main amd64 libmpx0 amd64 5.3.1-14ubuntu2 [9,762 B]                                                                                                                  
Get: 12 http://archive.ubuntu.com/ubuntu xenial/main amd64 libcc1-0 amd64 5.3.1-14ubuntu2 [38.8 kB]                                                                                                                 
Get: 13 http://archive.ubuntu.com/ubuntu xenial/main amd64 libatomic1 amd64 5.3.1-14ubuntu2 [8,888 B]                                                                                                               
Get: 14 http://archive.ubuntu.com/ubuntu xenial/main amd64 libgomp1 amd64 5.3.1-14ubuntu2 [55.0 kB]                                                                                                                 
Get: 15 http://archive.ubuntu.com/ubuntu xenial/main amd64 gcc-5-base amd64 5.3.1-14ubuntu2 [16.8 kB]                                                                                                               
Get: 16 http://archive.ubuntu.com/ubuntu xenial/main amd64 libstdc++6 amd64 5.3.1-14ubuntu2 [393 kB]                                                                                                                
Get: 17 http://archive.ubuntu.com/ubuntu xenial/main amd64 lib32stdc++6 amd64 5.3.1-14ubuntu2 [404 kB]                                                                                                              
Fetched 20.4 MB in 27s (731 kB/s)                                                                                                                                                                                   
dpkg: warning: downgrading gcc-5 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
(Reading database ... 230322 files and directories currently installed.)
Preparing to unpack .../gcc-5_5.3.1-14ubuntu2_amd64.deb ...
Unpacking gcc-5 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading cpp-5 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../cpp-5_5.3.1-14ubuntu2_amd64.deb ...
Unpacking cpp-5 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libgcc-5-dev:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libgcc-5-dev_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libgcc-5-dev:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libitm1:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libitm1_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libitm1:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libquadmath0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libquadmath0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libquadmath0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading liblsan0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../liblsan0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking liblsan0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libasan2:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libasan2_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libasan2:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libtsan0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libtsan0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libtsan0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libubsan0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libubsan0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libubsan0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libcilkrts5:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libcilkrts5_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libcilkrts5:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libmpx0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libmpx0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libmpx0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libcc1-0:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libcc1-0_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libcc1-0:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libatomic1:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libatomic1_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libatomic1:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading libgomp1:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../libgomp1_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libgomp1:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
dpkg: warning: downgrading gcc-5-base:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
Preparing to unpack .../gcc-5-base_5.3.1-14ubuntu2_amd64.deb ...
Unpacking gcc-5-base:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
Processing triggers for ccache (3.2.4-1) ...
Updating symlinks in /usr/lib/ccache ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Setting up gcc-5-base:amd64 (5.3.1-14ubuntu2) ...
dpkg: warning: downgrading libstdc++6:amd64 from 5.4.0-6ubuntu1~16.04.10 to 5.3.1-14ubuntu2
(Reading database ... 230322 files and directories currently installed.)
Preparing to unpack .../libstdc++6_5.3.1-14ubuntu2_amd64.deb ...
Unpacking libstdc++6:amd64 (5.3.1-14ubuntu2) over (5.4.0-6ubuntu1~16.04.10) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Setting up libstdc++6:amd64 (5.3.1-14ubuntu2) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Selecting previously unselected package lib32stdc++6.
(Reading database ... 230322 files and directories currently installed.)
Preparing to unpack .../lib32stdc++6_5.3.1-14ubuntu2_amd64.deb ...
Unpacking lib32stdc++6 (5.3.1-14ubuntu2) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
Setting up cpp-5 (5.3.1-14ubuntu2) ...
Setting up libcc1-0:amd64 (5.3.1-14ubuntu2) ...
Setting up libgomp1:amd64 (5.3.1-14ubuntu2) ...
Setting up libitm1:amd64 (5.3.1-14ubuntu2) ...
Setting up libatomic1:amd64 (5.3.1-14ubuntu2) ...
Setting up libasan2:amd64 (5.3.1-14ubuntu2) ...
Setting up liblsan0:amd64 (5.3.1-14ubuntu2) ...
Setting up libtsan0:amd64 (5.3.1-14ubuntu2) ...
Setting up libubsan0:amd64 (5.3.1-14ubuntu2) ...
Setting up libcilkrts5:amd64 (5.3.1-14ubuntu2) ...
Setting up libmpx0:amd64 (5.3.1-14ubuntu2) ...
Setting up libquadmath0:amd64 (5.3.1-14ubuntu2) ...
Setting up libgcc-5-dev:amd64 (5.3.1-14ubuntu2) ...
Setting up gcc-5 (5.3.1-14ubuntu2) ...
Setting up lib32stdc++6 (5.3.1-14ubuntu2) ...
Processing triggers for libc-bin (2.23-0ubuntu10) ...
                                         
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ source build/envsetup.sh 
including device/asus/fugu/vendorsetup.sh
including device/generic/car/car-arm64/vendorsetup.sh
including device/generic/car/car-armv7-a-neon/vendorsetup.sh
including device/generic/car/car-x86_64/vendorsetup.sh
including device/generic/car/car-x86/vendorsetup.sh
including device/generic/mini-emulator-arm64/vendorsetup.sh
including device/generic/mini-emulator-armv7-a-neon/vendorsetup.sh
including device/generic/mini-emulator-mips64/vendorsetup.sh
including device/generic/mini-emulator-mips/vendorsetup.sh
including device/generic/mini-emulator-x86_64/vendorsetup.sh
including device/generic/mini-emulator-x86/vendorsetup.sh
including device/google/dragon/vendorsetup.sh
including device/google/marlin/vendorsetup.sh
including device/huawei/angler/vendorsetup.sh
including device/lge/bullhead/vendorsetup.sh
including device/linaro/hikey/vendorsetup.sh
including sdk/bash_completion/adb.bash
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ make -j8
============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm64
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_ARCH=arm64
TARGET_ARCH_VARIANT=armv8-a
TARGET_CPU_VARIANT=generic
TARGET_2ND_ARCH=arm
TARGET_2ND_ARCH_VARIANT=armv7-a-neon
TARGET_2ND_CPU_VARIANT=cortex-a15
HOST_ARCH=x86_64
HOST_2ND_ARCH=x86
HOST_OS=linux
HOST_OS_EXTRA=Linux-4.15.0-34-generic-x86_64-with-Ubuntu-16.04-xenial
HOST_CROSS_OS=windows
HOST_CROSS_ARCH=x86
HOST_CROSS_2ND_ARCH=x86_64
HOST_BUILD_TYPE=release
BUILD_ID=OPR4.170623.009
OUT_DIR=out
============================================
ninja: no work to do.
ninja: no work to do.
No need to regenerate ninja file
[  0% 100/78705] target  C: toybox <= external/toybox/lib/linestack.c
external/toybox/lib/linestack.c:46:22: warning: field 'ls' with variable sized type 'struct linestack' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
    struct linestack ls;
                     ^
1 warning generated.
[  0% 106/78705] target  C: toybox <= external/toybox/toys/android/getprop.c
external/toybox/toys/android/getprop.c:56:39: warning: incompatible pointer types passing 'void (void *, const char *, const char *)' to parameter of type 'void (*)(void *, const char *, const char *, uint32_t)' (aka 'void (*)(void *, const char *, const char *, unsigned int)') [-Wincompatible-pointer-types]
  __system_property_read_callback(pi, read_callback, NULL);
                                      ^~~~~~~~~~~~~
bionic/libc/include/sys/system_properties.h:60:12: note: passing argument to parameter 'callback' here
    void (*callback)(void* cookie, const char *name, const char *value, uint32_t serial),
           ^
1 warning generated.
[  0% 186/78705] target  C: toybox <= external/toybox/toys/pending/expr.c
external/toybox/toys/pending/expr.c:116:28: warning: field precision should have type 'int', but argument has type 'long' [-Wformat]
      ret->s = xmprintf("%.*s", m[1].rm_eo-m[1].rm_so, target+m[1].rm_so);
                         ~~^~   ~~~~~~~~~~~~~~~~~~~~~
external/toybox/toys/pending/expr.c:247:24: warning: missing field 'i' initializer [-Wmissing-field-initializers]
  struct value ret = {0};
                       ^
2 warnings generated.
[  0% 437/78705] Target buildinfo: out/target/product/generic_arm64/obj/ETC/system_build_prop_intermediates/build.prop
Target buildinfo from: build/target/board/generic_arm64/system.prop
[  1% 793/78705] Ensuring Jack server is installed and started
Writing client settings in /home/sleticalboy/.jack-settings
Installing jack server in "/home/sleticalboy/.jack-server"

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore /home/sleticalboy/.jack-server/server.jks -destkeystore /home/sleticalboy/.jack-server/server.jks -deststoretype pkcs12".

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore /home/sleticalboy/.jack-server/client.jks -destkeystore /home/sleticalboy/.jack-server/client.jks -deststoretype pkcs12".
Launching Jack server java -XX:MaxJavaStackTraceDepth=-1 -Djava.io.tmpdir=/tmp -Dfile.encoding=UTF-8 -XX:+TieredCompilation -cp /home/sleticalboy/.jack-server/launcher.jar com.android.jack.launcher.ServerLauncher
[  1% 799/78705] target  C++: libbluetooth_jni <= packages/apps/Bluetooth/jni/com_android_bluetooth_avrcp.cpp
packages/apps/Bluetooth/jni/com_android_bluetooth_avrcp.cpp:816:9: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        uid);
        ^~~
system/core/liblog/include/log/log_main.h:184:28: note: expanded from macro 'ALOGV'
#define ALOGV(...) __ALOGV(__VA_ARGS__)
                           ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
1 warning generated.
[  1% 805/78705] host Java: bouncycastle-host (out/host/common/obj/JAVA_LIBRARIES/bouncycastle-host_intermediates/classes)
warning: [options] bootstrap class path not set in conjunction with -source 1.7
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
1 warning
[  1% 844/78705] host Java: bouncycastle-bcpkix-host (out/host/common/obj/JAVA_LIBRARIES/bouncycastle-bcpkix-host_intermediates/classes)
warning: [options] bootstrap class path not set in conjunction with -source 1.7
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
1 warning
[  1% 1555/78705] Check Java library module types: out/target/common/obj/APPS/Browser2_intermediates/link_type
packages/apps/Browser2/Android.mk: warning: Browser2 (java:sdk) should not link to legacy-android-test (java:platform)
[  3% 3133/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picoacph.c
external/svox/pico/lib/picoacph.c:279:69: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t acphTerminate(register picodata_ProcessingUnit this)
                                                                    ^
external/svox/pico/lib/picoacph.c:286:8: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
    mm = mm;        /* avoid warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picoacph.c:328:69: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 acphGetNrSylls(register picodata_ProcessingUnit this,
                                                                    ^
external/svox/pico/lib/picoacph.c:361:39: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picoacph.c:361:39: note: remove extraneous parentheses around the comparison to silence this warning
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
            ~                         ^                        ~
external/svox/pico/lib/picoacph.c:361:39: note: use '=' to turn this equality comparison into an assignment
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
                                      ^~
                                      =
external/svox/pico/lib/picoacph.c:352:79: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 acphPhrItemSeqGetPosLeft(register picodata_ProcessingUnit this,
                                                                              ^
external/svox/pico/lib/picoacph.c:626:39: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picoacph.c:626:39: note: remove extraneous parentheses around the comparison to silence this warning
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
            ~                         ^                        ~
external/svox/pico/lib/picoacph.c:626:39: note: use '=' to turn this equality comparison into an assignment
        if ((acph->headx[i].head.type == PICODATA_ITEM_WORDPHON)) {
                                      ^~
                                      =
external/svox/pico/lib/picoacph.c:617:79: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 acphAccItemSeqGetPosLeft(register picodata_ProcessingUnit this,
                                                                              ^
external/svox/pico/lib/picoacph.c:637:73: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 acphAccNrSyllParts(register picodata_ProcessingUnit this,
                                                                        ^
external/svox/pico/lib/picoacph.c:767:78: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 acphIsWordWithoutStress(register picodata_ProcessingUnit this,
                                                                             ^
external/svox/pico/lib/picoacph.c:1062:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
10 warnings generated.
[  3% 3136/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picoctrl.c
external/svox/pico/lib/picoctrl.c:271:8: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
    mm = mm;        /* fix warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picoctrl.c:297:21: warning: unused parameter 'levelAwareCbOut' [-Wunused-parameter]
        picoos_bool levelAwareCbOut,
                    ^
2 warnings generated.
[  3% 3137/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picodbg.c
external/svox/pico/lib/picodbg.c:427:33: warning: all paths through this function will call itself [-Winfinite-recursion]
static void picodbg_dummy(void) {
                                ^
1 warning generated.
[  3% 3138/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picoextapi.c
external/svox/pico/lib/picoextapi.c:116:10: warning: explicitly assigning value of variable of type 'const pico_Char *' (aka 'const unsigned char *') to itself [-Wself-assign]
    name = name;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~ ^ ~~~~
external/svox/pico/lib/picoextapi.c:130:10: warning: explicitly assigning value of variable of type 'const pico_Char *' (aka 'const unsigned char *') to itself [-Wself-assign]
    name = name;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~ ^ ~~~~
2 warnings generated.
[  3% 3139/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picokdbg.c
external/svox/pico/lib/picokdbg.c:161:34: warning: all paths through this function will call itself [-Winfinite-recursion]
static void picokdbg_dummy(void) {
                                 ^
1 warning generated.
[  3% 3140/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picodata.c
external/svox/pico/lib/picodata.c:577:75: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t puSimpleInitialize (register picodata_ProcessingUnit this, picoos_int32 resetMode) {
                                                                          ^
external/svox/pico/lib/picodata.c:577:94: warning: unused parameter 'resetMode' [-Wunused-parameter]
static pico_status_t puSimpleInitialize (register picodata_ProcessingUnit this, picoos_int32 resetMode) {
                                                                                             ^
external/svox/pico/lib/picodata.c:581:74: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t puSimpleTerminate (register picodata_ProcessingUnit this) {
                                                                         ^
external/svox/pico/lib/picodata.c:590:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~ ^ ~~~~
4 warnings generated.
[  3% 3142/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picocep.c
external/svox/pico/lib/picocep.c:374:68: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t cepTerminate(register picodata_ProcessingUnit this)
                                                                   ^
external/svox/pico/lib/picocep.c:392:8: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
    mm = mm; /* avoid warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picocep.c:1495:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode; /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
3 warnings generated.
[  3% 3143/78705] target thumb C++: libttspico_32 <= external/svox/pico/tts/com_svox_picottsengine.cpp
external/svox/pico/tts/com_svox_picottsengine.cpp:756:61: warning: unused parameter 'length' [-Wunused-parameter]
extern char * createPhonemeString( const char * xsampa, int length )
                                                            ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1072:28: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'int' [-Wsign-compare]
        if (strlen(config) >= max_filename_length) {
            ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
external/svox/pico/tts/com_svox_picottsengine.cpp:1119:48: warning: unused parameter 'lang' [-Wunused-parameter]
tts_result TtsEngine::loadLanguage(const char *lang, const char *country, const char *variant)
                                               ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1119:66: warning: unused parameter 'country' [-Wunused-parameter]
tts_result TtsEngine::loadLanguage(const char *lang, const char *country, const char *variant)
                                                                 ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1119:87: warning: unused parameter 'variant' [-Wunused-parameter]
tts_result TtsEngine::loadLanguage(const char *lang, const char *country, const char *variant)
                                                                                      ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1133:90: warning: unused parameter 'variant' [-Wunused-parameter]
tts_result TtsEngine::setLanguage( const char * lang, const char * country, const char * variant )
                                                                                         ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1212:25: warning: unused parameter 'variant' [-Wunused-parameter]
            const char *variant) {
                        ^
external/svox/pico/tts/com_svox_picottsengine.cpp:1316:92: warning: unused parameter 'size' [-Wunused-parameter]
tts_result TtsEngine::setProperty( const char * property, const char * value, const size_t size )
                                                                                           ^
8 warnings generated.
[  4% 3149/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picokpr.c
external/svox/pico/lib/picokpr.c:286:12: warning: explicitly assigning value of variable of type 'picoos_int32' (aka 'int') to itself [-Wself-assign]
    len__9 = len__9;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~~~ ^ ~~~~~~
external/svox/pico/lib/picokpr.c:296:13: warning: explicitly assigning value of variable of type 'picoos_int32' (aka 'int') to itself [-Wself-assign]
    len__10 = len__10;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~~~~ ^ ~~~~~~~
external/svox/pico/lib/picokpr.c:306:13: warning: explicitly assigning value of variable of type 'picoos_int32' (aka 'int') to itself [-Wself-assign]
    len__11 = len__11;        /*PP 13.10.08 : fix warning "var not used in this function"*/
    ~~~~~~~ ^ ~~~~~~~
external/svox/pico/lib/picokpr.c:317:13: warning: explicitly assigning value of variable of type 'picoos_int32' (aka 'int') to itself [-Wself-assign]
    len__12 = len__12;        /* avoid warning "var not used in this function"*/
    ~~~~~~~ ^ ~~~~~~~
4 warnings generated.
[  4% 3150/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picopal.c
external/svox/pico/lib/picopal.c:416:10: warning: explicitly assigning value of variable of type 'picopal_objsize_t' (aka 'unsigned int') to itself [-Wself-assign]
    size = size;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
external/svox/pico/lib/picopal.c:452:10: warning: explicitly assigning value of variable of type 'void *' to itself [-Wself-assign]
    addr = addr;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
external/svox/pico/lib/picopal.c:453:9: warning: explicitly assigning value of variable of type 'picopal_objsize_t' (aka 'unsigned int') to itself [-Wself-assign]
    len = len;            /* avoid warning "var not used in this function"*/
    ~~~ ^ ~~~
external/svox/pico/lib/picopal.c:454:10: warning: explicitly assigning value of variable of type 'picopal_int16' (aka 'short') to itself [-Wself-assign]
    prot = prot;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
4 warnings generated.
[  4% 3152/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picokdt.c
external/svox/pico/lib/picokdt.c:398:65: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t kdtDtCheck(register picoknow_KnowledgeBase this,
                                                                ^
1 warning generated.
[  4% 3154/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picorsrc.c
external/svox/pico/lib/picorsrc.c:464:34: warning: unused parameter 'this' [-Wunused-parameter]
        picorsrc_ResourceManager this,
                                 ^
external/svox/pico/lib/picorsrc.c:484:13: warning: explicitly assigning value of variable of type 'picoos_uint32' (aka 'unsigned int') to itself [-Wself-assign]
    datalen = datalen;
    ~~~~~~~ ^ ~~~~~~~
2 warnings generated.
[  4% 3155/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picoos.c
external/svox/pico/lib/picoos.c:533:18: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
    if ((c->size == (picoos_ptrdiff_t) cellSize)) {
         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picoos.c:533:18: note: remove extraneous parentheses around the comparison to silence this warning
    if ((c->size == (picoos_ptrdiff_t) cellSize)) {
        ~        ^                             ~
external/svox/pico/lib/picoos.c:533:18: note: use '=' to turn this equality comparison into an assignment
    if ((c->size == (picoos_ptrdiff_t) cellSize)) {
                 ^~
                 =
external/svox/pico/lib/picoos.c:1108:18: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
        if ((pos == f->lPos)) {
             ~~~~^~~~~~~~~~
external/svox/pico/lib/picoos.c:1108:18: note: remove extraneous parentheses around the comparison to silence this warning
        if ((pos == f->lPos)) {
            ~    ^         ~
external/svox/pico/lib/picoos.c:1108:18: note: use '=' to turn this equality comparison into an assignment
        if ((pos == f->lPos)) {
                 ^~
                 =
external/svox/pico/lib/picoos.c:1624:34: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
                if ((sdFile->enc == PICOOS_ENC_LIN)) {
                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
external/svox/pico/lib/picoos.c:1624:34: note: remove extraneous parentheses around the comparison to silence this warning
                if ((sdFile->enc == PICOOS_ENC_LIN)) {
                    ~            ^                ~
external/svox/pico/lib/picoos.c:1624:34: note: use '=' to turn this equality comparison into an assignment
                if ((sdFile->enc == PICOOS_ENC_LIN)) {
                                 ^~
                                 =
external/svox/pico/lib/picoos.c:2283:33: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
            if ((string[(*ind)] == sepCh)) {
                 ~~~~~~~~~~~~~~~^~~~~~~~
external/svox/pico/lib/picoos.c:2283:33: note: remove extraneous parentheses around the comparison to silence this warning
            if ((string[(*ind)] == sepCh)) {
                ~               ^       ~
external/svox/pico/lib/picoos.c:2283:33: note: use '=' to turn this equality comparison into an assignment
            if ((string[(*ind)] == sepCh)) {
                                ^~
                                =
4 warnings generated.
[  4% 3156/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picosig.c
external/svox/pico/lib/picosig.c:391:12: warning: explicitly assigning value of variable of type 'picoos_uint16' (aka 'unsigned short') to itself [-Wself-assign]
    numinb = numinb; /* avoid warning "var not used in this function"*/
    ~~~~~~ ^ ~~~~~~
external/svox/pico/lib/picosig.c:762:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode; /* avoid warning "var not used in this function" */
    ~~~~ ^ ~~~~
2 warnings generated.
[  4% 3157/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picosa.c
external/svox/pico/lib/picosa.c:427:67: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t saTerminate(register picodata_ProcessingUnit this) {
                                                                  ^
external/svox/pico/lib/picosa.c:489:79: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 saPosDItemSeqGetPosRight(register picodata_ProcessingUnit this,
                                                                              ^
external/svox/pico/lib/picosa.c:791:67: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_uint8 saGetNrVowel(register picodata_ProcessingUnit this,
                                                                  ^
external/svox/pico/lib/picosa.c:1078:73: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t saExtractPhonemes(register picodata_ProcessingUnit this,
                                                                        ^
external/svox/pico/lib/picosa.c:1204:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
5 warnings generated.
[  4% 3158/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picowa.c
external/svox/pico/lib/picowa.c:146:67: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t waTerminate(register picodata_ProcessingUnit this) {
                                                                  ^
external/svox/pico/lib/picowa.c:155:8: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
    mm = mm;        /* avoid warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picowa.c:387:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
3 warnings generated.
[  4% 3161/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picospho.c
external/svox/pico/lib/picospho.c:289:89: warning: unused parameter 'resetMode' [-Wunused-parameter]
static pico_status_t sphoInitialize(register picodata_ProcessingUnit this, picoos_int32 resetMode)
                                                                                        ^
external/svox/pico/lib/picospho.c:336:69: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t sphoTerminate(register picodata_ProcessingUnit this)
                                                                    ^
external/svox/pico/lib/picospho.c:496:10: warning: explicitly assigning value of variable of type 'spho_subobj_t *' (aka 'struct spho_subobj *') to itself [-Wself-assign]
    spho = spho;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
external/svox/pico/lib/picospho.c:955:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
4 warnings generated.
[  4% 3169/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picopam.c
external/svox/pico/lib/picopam.c:746:12: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
        mm = mm; /* avoid warning "var not used in this function"*/
        ~~ ^ ~~
external/svox/pico/lib/picopam.c:2336:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode; /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
external/svox/pico/lib/picopam.c:2601:33: warning: explicitly assigning value of variable of type 'pico_status_t' (aka 'int') to itself [-Wself-assign]
                        sResult = sResult;
                        ~~~~~~~ ^ ~~~~~~~
external/svox/pico/lib/picopam.c:2893:15: warning: explicitly assigning value of variable of type 'picoos_uint8' (aka 'unsigned char') to itself [-Wself-assign]
    iteminfo1 = iteminfo1; /* avoid warning "var not used in this function"*/
    ~~~~~~~~~ ^ ~~~~~~~~~
external/svox/pico/lib/picopam.c:3536:37: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
                    if ((event_type == PICOPAM_EVENT_P_BOUND)) {
                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picopam.c:3536:37: note: remove extraneous parentheses around the comparison to silence this warning
                    if ((event_type == PICOPAM_EVENT_P_BOUND)) {
                        ~           ^                       ~
external/svox/pico/lib/picopam.c:3536:37: note: use '=' to turn this equality comparison into an assignment
                    if ((event_type == PICOPAM_EVENT_P_BOUND)) {
                                    ^~
                                    =
5 warnings generated.
[  4% 3176/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picotok.c
external/svox/pico/lib/picotok.c:444:26: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
        if ((tok->utfpos == tok->utflen)) {
             ~~~~~~~~~~~~^~~~~~~~~~~~~~
external/svox/pico/lib/picotok.c:444:26: note: remove extraneous parentheses around the comparison to silence this warning
        if ((tok->utfpos == tok->utflen)) {
            ~            ^             ~
external/svox/pico/lib/picotok.c:444:26: note: use '=' to turn this equality comparison into an assignment
        if ((tok->utfpos == tok->utflen)) {
                         ^~
                         =
external/svox/pico/lib/picotok.c:482:50: warning: unused parameter 'this' [-Wunused-parameter]
static void tok_putItem (picodata_ProcessingUnit this,  tok_subobj_t * tok,
                                                 ^
external/svox/pico/lib/picotok.c:577:51: warning: unused parameter 'this' [-Wunused-parameter]
static void tok_putItem2 (picodata_ProcessingUnit this,  tok_subobj_t * tok,
                                                  ^
external/svox/pico/lib/picotok.c:1342:49: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
            } else if ((tok->utf[tok->utfpos-1] == EOL)) {
                        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
external/svox/pico/lib/picotok.c:1342:49: note: remove extraneous parentheses around the comparison to silence this warning
            } else if ((tok->utf[tok->utfpos-1] == EOL)) {
                       ~                        ^     ~
external/svox/pico/lib/picotok.c:1342:49: note: use '=' to turn this equality comparison into an assignment
            } else if ((tok->utf[tok->utfpos-1] == EOL)) {
                                                ^~
                                                =
external/svox/pico/lib/picotok.c:1402:83: warning: unused parameter 'resetMode' [-Wunused-parameter]
static pico_status_t tokReset(register picodata_ProcessingUnit this, picoos_int32 resetMode)
                                                                                  ^
external/svox/pico/lib/picotok.c:1481:68: warning: unused parameter 'this' [-Wunused-parameter]
static pico_status_t tokTerminate(register picodata_ProcessingUnit this)
                                                                   ^
external/svox/pico/lib/picotok.c:1495:8: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
    mm = mm;        /* avoid warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picotok.c:1542:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
8 warnings generated.
[  4% 3214/78705] target thumb C: libsvoxpico_32 <= external/svox/pico/lib/picopr.c
external/svox/pico/lib/picopr.c:436:11: warning: explicitly assigning value of variable of type 'pr_MemTypes' to itself [-Wself-assign]
    mType = mType;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:448:11: warning: explicitly assigning value of variable of type 'pr_MemTypes' to itself [-Wself-assign]
    mType = mType;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:621:69: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_int32 tok_tokenDigitStrToInt (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_uchar stokenStr[])
                                                                    ^
external/svox/pico/lib/picopr.c:1004:49: warning: unused parameter 'this' [-Wunused-parameter]
static void pr_initItem(picodata_ProcessingUnit this, pr_ioItem * item)
                                                ^
external/svox/pico/lib/picopr.c:1047:57: warning: unused parameter 'this' [-Wunused-parameter]
static void pr_copyItemContent (picodata_ProcessingUnit this, pr_ioItem * inItem, pr_ioItem * outItem)
                                                        ^
external/svox/pico/lib/picopr.c:1087:52: warning: unused parameter 'this' [-Wunused-parameter]
static void pr_appendItem (picodata_ProcessingUnit this, pr_ioItemPtr * firstItem, pr_ioItemPtr * lastItem, pr_ioItemPtr item)
                                                   ^
external/svox/pico/lib/picopr.c:1758:52: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
                                        if ((ltype == PICODATA_ITEMINFO1_TOKTYPE_LETTERV)/* || (ltype == PICODATA_ITEMINFO1_TOKTYPE_DIGIT)*/) {
                                             ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picopr.c:1758:52: note: remove extraneous parentheses around the comparison to silence this warning
                                        if ((ltype == PICODATA_ITEMINFO1_TOKTYPE_LETTERV)/* || (ltype == PICODATA_ITEMINFO1_TOKTYPE_DIGIT)*/) {
                                            ~      ^                                    ~
external/svox/pico/lib/picopr.c:1758:52: note: use '=' to turn this equality comparison into an assignment
                                        if ((ltype == PICODATA_ITEMINFO1_TOKTYPE_LETTERV)/* || (ltype == PICODATA_ITEMINFO1_TOKTYPE_DIGIT)*/) {
                                                   ^~
                                                   =
external/svox/pico/lib/picopr.c:2088:69: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
                    if ((pr->ritems[with__0->ritemid+1]->head.info1 == PICODATA_ITEMINFO1_TOKTYPE_SPACE)) {
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/svox/pico/lib/picopr.c:2088:69: note: remove extraneous parentheses around the comparison to silence this warning
                    if ((pr->ritems[with__0->ritemid+1]->head.info1 == PICODATA_ITEMINFO1_TOKTYPE_SPACE)) {
                        ~                                           ^                                  ~
external/svox/pico/lib/picopr.c:2088:69: note: use '=' to turn this equality comparison into an assignment
                    if ((pr->ritems[with__0->ritemid+1]->head.info1 == PICODATA_ITEMINFO1_TOKTYPE_SPACE)) {
                                                                    ^~
                                                                    =
external/svox/pico/lib/picopr.c:2262:61: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getNextToken (picodata_ProcessingUnit this, pr_subobj_t * pr)
                                                            ^
external/svox/pico/lib/picopr.c:2287:60: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getAltToken (picodata_ProcessingUnit this, pr_subobj_t * pr)
                                                           ^
external/svox/pico/lib/picopr.c:2326:63: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_findProduction (picodata_ProcessingUnit this, pr_subobj_t * pr,
                                                              ^
external/svox/pico/lib/picopr.c:2404:65: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getProdContToken (picodata_ProcessingUnit this, pr_subobj_t * pr)
                                                                ^
external/svox/pico/lib/picopr.c:2429:65: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getTopLevelToken (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_bool firstprod)
                                                                ^
external/svox/pico/lib/picopr.c:2457:57: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getToken (picodata_ProcessingUnit this, pr_subobj_t * pr)
                                                        ^
external/svox/pico/lib/picopr.c:2480:66: warning: unused parameter 'this' [-Wunused-parameter]
static picoos_bool pr_getNextMultiToken (picodata_ProcessingUnit this, pr_subobj_t * pr)
                                                                 ^
external/svox/pico/lib/picopr.c:2516:8: warning: explicitly assigning value of variable of type 'pr_subobj_t *' (aka 'struct pr_subobj *') to itself [-Wself-assign]
    pr = pr;        /* avoid warning "var not used in this function"*/
    ~~ ^ ~~
external/svox/pico/lib/picopr.c:2517:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetNP' (aka 'unsigned int') to itself [-Wself-assign]
    npset = npset;    /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2518:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetWP' (aka 'unsigned int') to itself [-Wself-assign]
    wpset = wpset;    /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2503:66: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchMultiToken (picodata_ProcessingUnit this, pr_subobj_t * pr,
                                                                 ^
external/svox/pico/lib/picopr.c:2523:67: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensSpace (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_int32 cmpres,
                                                                  ^
external/svox/pico/lib/picopr.c:2570:67: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensDigit (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_int32 cmpres,
                                                                  ^
external/svox/pico/lib/picopr.c:2619:65: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensSeq (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_int32 cmpres,
                                                                ^
external/svox/pico/lib/picopr.c:2662:66: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensChar (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_int32 cmpres,
                                                                 ^
external/svox/pico/lib/picopr.c:2682:68: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensLetter (picodata_ProcessingUnit this, pr_subobj_t * pr, picoos_int32 cmpres,
                                                                   ^
external/svox/pico/lib/picopr.c:2767:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetNP' (aka 'unsigned int') to itself [-Wself-assign]
    npset = npset;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2768:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetWP' (aka 'unsigned int') to itself [-Wself-assign]
    wpset = wpset;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2764:67: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensBegin (picodata_ProcessingUnit this, pr_subobj_t * pr,
                                                                  ^
external/svox/pico/lib/picopr.c:2781:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetNP' (aka 'unsigned int') to itself [-Wself-assign]
    npset = npset;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2782:11: warning: explicitly assigning value of variable of type 'picokpr_TokSetWP' (aka 'unsigned int') to itself [-Wself-assign]
    wpset = wpset;        /* avoid warning "var not used in this function"*/
    ~~~~~ ^ ~~~~~
external/svox/pico/lib/picopr.c:2778:65: warning: unused parameter 'this' [-Wunused-parameter]
static pr_MatchState pr_matchTokensEnd (picodata_ProcessingUnit this, pr_subobj_t * pr,
                                                                ^
external/svox/pico/lib/picopr.c:2904:32: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
        if ((pr->ractpath.rlen == 0)) {
             ~~~~~~~~~~~~~~~~~~^~~~
external/svox/pico/lib/picopr.c:2904:32: note: remove extraneous parentheses around the comparison to silence this warning
        if ((pr->ractpath.rlen == 0)) {
            ~                  ^   ~
external/svox/pico/lib/picopr.c:2904:32: note: use '=' to turn this equality comparison into an assignment
        if ((pr->ractpath.rlen == 0)) {
                               ^~
                               =
external/svox/pico/lib/picopr.c:3038:53: warning: unused parameter 'this' [-Wunused-parameter]
static void pr_prepareItem (picodata_ProcessingUnit this, pr_subobj_t * pr, pr_ioItemPtr item)
                                                    ^
external/svox/pico/lib/picopr.c:3258:60: warning: unused parameter 'this' [-Wunused-parameter]
pico_status_t prTerminate(register picodata_ProcessingUnit this)
                                                           ^
external/svox/pico/lib/picopr.c:3272:12: warning: explicitly assigning value of variable of type 'picoos_MemoryManager' (aka 'struct memory_manager *') to itself [-Wself-assign]
        mm = mm;        /* avoid warning "var not used in this function"*/
        ~~ ^ ~~
external/svox/pico/lib/picopr.c:3354:10: warning: explicitly assigning value of variable of type 'picoos_int16' (aka 'short') to itself [-Wself-assign]
    mode = mode;        /* avoid warning "var not used in this function"*/
    ~~~~ ^ ~~~~
35 warnings generated.
[  5% 4071/78705] Yacc: applypatch <= bootable/recovery/edify/parser.yy
bootable/recovery/edify/parser.yy:123.3-9: warning: unused value: $1
[  5% 4473/78705] target  C: fsck.f2fs <= external/f2fs-tools/lib/libf2fs.c
external/f2fs-tools/lib/libf2fs.c:472:32: warning: taking address of packed member 'total_sectors' of class or structure 'f2fs_configuration' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
                                             ^~~~~~~~~~~~~~~~
1 warning generated.
[  6% 5122/78705] target  C: libf2fs_fmt <= external/f2fs-tools/lib/libf2fs.c
external/f2fs-tools/lib/libf2fs.c:472:32: warning: taking address of packed member 'total_sectors' of class or structure 'f2fs_configuration' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ioctl(fd, BLKGETSIZE64, &c->total_sectors) < 0) {
                                             ^~~~~~~~~~~~~~~~
1 warning generated.
[  6% 5161/78705] target  C: mdnsd <= external/mdnsresponder/mDNSCore/uDNS.c
external/mdnsresponder/mDNSCore/uDNS.c:724:45: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLJumbo(msg, ptr, &msg->h.numAdditionals, opt, 0);
                                                   ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/uDNS.c:904:106: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (opt && q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Event && mDNSSameOpaque64(&opt->u.llq.id, &q->id))
                                                                                                                                     ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:36: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                   ^
external/mdnsresponder/mDNSCore/uDNS.c:904:106: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (opt && q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Event && mDNSSameOpaque64(&opt->u.llq.id, &q->id))
                                                                                                                                     ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:62: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                                             ^
external/mdnsresponder/mDNSCore/uDNS.c:909:50: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        ackEnd = putLLQ(&m->omsg, m->omsg.data, q, &opt->u.llq);
                                                                                    ^~~~~~~~~~
external/mdnsresponder/mDNSCore/uDNS.c:918:97: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        if (q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Refresh && mDNSSameOpaque64(&opt->u.llq.id, &q->id) && msg->h.numAdditionals && !msg->h.numAnswers)
                                                                                                                                   ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:36: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                   ^
external/mdnsresponder/mDNSCore/uDNS.c:918:97: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        if (q->state == LLQ_Established && opt->u.llq.llqOp == kLLQOp_Refresh && mDNSSameOpaque64(&opt->u.llq.id, &q->id) && msg->h.numAdditionals && !msg->h.numAnswers)
                                                                                                                                   ^~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSEmbeddedAPI.h:2395:62: note: expanded from macro 'mDNSSameOpaque64'
#define mDNSSameOpaque64(A,B)    ((A)->l[0] == (B)->l[0] && (A)->l[1] == (B)->l[1])
                                                             ^
external/mdnsresponder/mDNSCore/uDNS.c:928:27: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        SetLLQTimer(m, q, &opt->u.llq);
                                                                           ^~~~~~~~~~
external/mdnsresponder/mDNSCore/uDNS.c:938:71: warning: taking address of packed member 'u' of class or structure 'rdataOPT' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                recvSetupResponse(m, msg->h.flags.b[1] & kDNSFlag1_RC_Mask, q, &opt->u.llq);
                                                                                                                ^~~~~~~~~~
8 warnings generated.
[  6% 5191/78705] target  C: mdnsd <= external/mdnsresponder/mDNSCore/DNSCommon.c
external/mdnsresponder/mDNSCore/DNSCommon.c:1885:48: warning: taking address of packed member 'numAnswers' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        return putEmptyResourceRecord(msg, ptr, end, &msg->h.mDNS_numPrereqs, &prereq);
                                                      ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1894:45: warning: taking address of packed member 'numAuthorities' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLJumbo(msg, ptr, &msg->h.mDNS_numUpdates, rr, 0);
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1905:49: warning: taking address of packed member 'numAuthorities' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        ptr = PutResourceRecordTTLWithLimit(msg, ptr, &msg->h.mDNS_numUpdates, rr, 0, limit);
                                                       ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1957:45: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        end = PutResourceRecordTTLJumbo(msg, end, &msg->h.numAdditionals, &rr.resrec, 0);
                                                   ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:201:47: note: expanded from macro 'PutResourceRecordTTLJumbo'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AbsoluteMaxDNSMessageData)
                                                     ^~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1972:49: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
        end = PutResourceRecordTTLWithLimit(msg, end, &msg->h.numAdditionals, &rr.resrec, 0, limit);
                                                       ^~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.c:1994:53: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                newptr = PutResourceRecordTTLWithLimit(msg, end, &msg->h.numAdditionals, &hinfo.resrec, 0, limit);
                                                                  ^~~~~~~~~~~~~~~~~~~~~
6 warnings generated.
[  6% 5341/78705] target  C: mdnsd <= external/mdnsresponder/mDNSCore/mDNS.c
external/mdnsresponder/mDNSCore/mDNS.c:5462:61: warning: taking address of packed member 'numAnswers' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                        mDNSu8 *p = PutResourceRecordTTL(response, responseptr, &response->h.numAnswers, &rr->resrec,
                                                                                 ^~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:198:47: note: expanded from macro 'PutResourceRecordTTL'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AllowedRRSpace(msg))
                                                     ^~~~~
external/mdnsresponder/mDNSCore/mDNS.c:5474:61: warning: taking address of packed member 'numAdditionals' of class or structure 'DNSMessageHeader' may result in an unaligned pointer value [-Waddress-of-packed-member]
                        mDNSu8 *p = PutResourceRecordTTL(response, responseptr, &response->h.numAdditionals, &rr->resrec,
                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
external/mdnsresponder/mDNSCore/DNSCommon.h:198:47: note: expanded from macro 'PutResourceRecordTTL'
        PutResourceRecordTTLWithLimit((msg), (ptr), (count), (rr), (ttl), (msg)->data + AllowedRRSpace(msg))
                                                     ^~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10220:37: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                       ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10220:48: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                                  ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10223:46: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendARP(m, 2, rr, &arp->tpa, &arp->sha, &arp->spa, &arp->sha);
                                                                         ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10223:68: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendARP(m, 2, rr, &arp->tpa, &arp->sha, &arp->spa, &arp->sha);
                                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10248:20: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, ARDisplayString(m, rr));
                                                                    ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10248:31: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, ARDisplayString(m, rr));
                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10252:20: warning: taking address of packed member 'spa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                    ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10252:31: warning: taking address of packed member 'tpa' of class or structure 'ARP_EthIP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        &arp->sha, &arp->spa, &arp->tpa, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                               ^~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10305:36: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                        intf->ifname, msg, sha, spa, &ndp->target, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                      ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10312:67: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg4) SendNDP(m, NDP_Adv, NDP_Solicited, rr, &ndp->target, mDNSNULL, spa,          sha             );
                                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10313:67: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                else if (msg == msg5) SendNDP(m, NDP_Adv, 0,             rr, &ndp->target, mDNSNULL, &AllHosts_v6, &AllHosts_v6_Eth);
                                                                                              ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10326:36: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                if (ndp->type == NDP_Adv) spa = &ndp->target;
                                                 ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10335:77: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        ndp->type == NDP_Sol ? "Solicitation " : "Advertisement", sha, spa, &ndp->target, ARDisplayString(m, rr));
                                                                                                                             ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:100:101: note: expanded from macro 'LogSPS'
                #define LogSPS( ... )           do { if (mDNS_LoggingEnabled) LogMsgWithLevel(MDNS_LOG_SPS,       __VA_ARGS__); } while (0)
                                                                                                                  ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNS.c:10339:19: warning: taking address of packed member 'target' of class or structure 'IPv6NDP' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                        sha, spa, &ndp->target, &rr->WakeUp.HMAC, &rr->WakeUp.IMAC, ARDisplayString(m, rr));
                                                                   ^~~~~~~~~~~
external/mdnsresponder/mDNSCore/mDNSDebug.h:98:65: note: expanded from macro 'LogMsg'
                #define LogMsg( ... )           LogMsgWithLevel(MDNS_LOG_MSG, __VA_ARGS__)
                                                                              ^~~~~~~~~~~
16 warnings generated.
[  6% 5369/78705] target  C: qemu-props <= device/generic/goldfish/qemu-props/qemu-props.c
In file included from device/generic/goldfish/qemu-props/qemu-props.c:38:
device/generic/goldfish/qemu-props/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/qemu-props/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[  6% 5373/78705] target  C: qemud <= device/generic/goldfish/qemud/qemud.c
device/generic/goldfish/qemud/qemud.c:1071:27: warning: unused parameter 's' [-Wunused-parameter]
serial_fd_close( Serial*  s )
                          ^
device/generic/goldfish/qemud/qemud.c:1077:23: warning: unused parameter 'p' [-Wunused-parameter]
serial_dump( Packet*  p, const char*  funcname )
                      ^
device/generic/goldfish/qemud/qemud.c:1077:39: warning: unused parameter 'funcname' [-Wunused-parameter]
serial_dump( Packet*  p, const char*  funcname )
                                      ^
device/generic/goldfish/qemud/qemud.c:1250:23: warning: unused parameter 'c' [-Wunused-parameter]
client_dump( Client*  c, Packet*  p, const char*  funcname )
                      ^
device/generic/goldfish/qemud/qemud.c:1250:35: warning: unused parameter 'p' [-Wunused-parameter]
client_dump( Client*  c, Packet*  p, const char*  funcname )
                                  ^
device/generic/goldfish/qemud/qemud.c:1250:51: warning: unused parameter 'funcname' [-Wunused-parameter]
client_dump( Client*  c, Packet*  p, const char*  funcname )
                                                  ^
device/generic/goldfish/qemud/qemud.c:1517:41: warning: unused parameter 'mult' [-Wunused-parameter]
multiplexer_serial_close( Multiplexer*  mult )
                                        ^
device/generic/goldfish/qemud/qemud.c:1608:42: warning: unused parameter 'm' [-Wunused-parameter]
multiplexer_control_close( Multiplexer*  m )
                                         ^
device/generic/goldfish/qemud/qemud.c:1711:47: warning: field precision should have type 'int', but argument has type 'long' [-Wformat]
        snprintf( buff, sizeof(buff), "/dev/%.*s", q-p, p );
                                            ~~^~   ~~~
9 warnings generated.
[  6% 5474/78705] Yacc: ss <= external/iproute2/misc/ssfilter.y
external/iproute2/misc/ssfilter.y: conflicts: 31 shift/reduce
[  9% 7304/78705] target thumb C++: libOpenglSystemCommon_32 <= device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfishHwc2.cpp
device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfishHwc2.cpp:21:62: warning: unused parameter 'window' [-Wunused-parameter]
extern "C" void surfaceInterface_setAsyncModeForWindow(void* window) { }
                                                             ^
1 warning generated.
[  9% 7309/78705] target thumb C++: libOpenglSystemCommon_32 <= device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfish_dma.cpp
device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfish_dma.cpp:57:29: warning: format specifies type 'unsigned long' but the argument has type 'uint32_t' (aka 'unsigned int') [-Wformat]
              __FUNCTION__, sz, res);
                            ^~
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
1 warning generated.
[  9% 7314/78705] target thumb C++: libOpenglSystemCommon_32 <= device/generic/goldfish-opengl/system/OpenglSystemCommon/ProcessPipe.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ProcessPipe.cpp:17:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[  9% 7323/78705] target thumb C++: libOpenglSystemCommon_32 <= device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:16:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:16:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:21:49: warning: unused parameter 'ptr' [-Wunused-parameter]
static bool sDefaultTlsDestructorCallback(void* ptr) { return true; }
                                                ^
4 warnings generated.
[  9% 7324/78705] target thumb C++: libOpenglCodecCommon_32 <= device/generic/goldfish-opengl/shared/OpenglCodecCommon/ChecksumCalculator.cpp
device/generic/goldfish-opengl/shared/OpenglCodecCommon/ChecksumCalculator.cpp:85:48: warning: unused parameter 'buf' [-Wunused-parameter]
void ChecksumCalculator::addBuffer(const void* buf, size_t packetLen) {
                                               ^
1 warning generated.
[  9% 7325/78705] target thumb C++: lib_renderControl_enc_32 <= device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.cpp
In file included from device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.cpp:8:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[  9% 7328/78705] target thumb C++: libEGL_emulation_32 <= device/generic/goldfish-opengl/system/egl/eglDisplay.cpp
In file included from device/generic/goldfish-opengl/system/egl/eglDisplay.cpp:17:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[  9% 7329/78705] target thumb C++: libEGL_emulation_32 <= device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:17:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:17:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:20:
In file included from device/generic/goldfish-opengl/system/egl/eglContext.h:19:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
4 warnings generated.
[  9% 7333/78705] target thumb C++: libOpenglSystemCommon_32 <= device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:16:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:23:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
8 warnings generated.
[  9% 7340/78705] target thumb C++: libEGL_emulation_32 <= device/generic/goldfish-opengl/system/egl/egl.cpp
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:19:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:27:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:35:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:37:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
device/generic/goldfish-opengl/system/egl/egl.cpp:687:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    getThreadInfo: getEGLThreadInfo,
    ^~~~~~~~~~~~~~
    .getThreadInfo = 
device/generic/goldfish-opengl/system/egl/egl.cpp:688:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    getGLString: getGLString
    ^~~~~~~~~~~~
    .getGLString = 
10 warnings generated.
[  9% 7341/78705] target thumb C++: libGLESv2_enc_32 <= device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
3 warnings generated.
[  9% 7343/78705] target thumb C++: libGLESv1_enc_32 <= device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:12:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:81:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*min == -1 || *ptr < *min) *min = *ptr;
                              ~~~~ ^ ~~~~
device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:606:22: note: in instantiation of function template specialization 'GLUtils::minmax<unsigned int>' requested here
            GLUtils::minmax<unsigned int>((unsigned int *)indices, count, &minIndex, &maxIndex);
                     ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:12:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:82:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*max == -1 || *ptr > *max) *max = *ptr;
                              ~~~~ ^ ~~~~
5 warnings generated.
[  9% 7352/78705] target thumb C++: libGLESv2_enc_32 <= device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.h:27:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.h:27:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:292:38: warning: unused parameter 'format' [-Wunused-parameter]
bool readPixelsFboFormatMatch(GLenum format, GLenum type, GLenum fboTexType) {
                                     ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:589:40: warning: unused parameter 'ctx' [-Wunused-parameter]
bool depthRenderableFormat(GL2Encoder* ctx, GLenum internalformat) {
                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:603:42: warning: unused parameter 'ctx' [-Wunused-parameter]
bool stencilRenderableFormat(GL2Encoder* ctx, GLenum internalformat) {
                                         ^
6 warnings generated.
[  9% 7361/78705] target thumb C++: libGLESv1_enc_32 <= device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
3 warnings generated.
[  9% 7364/78705] target thumb C++: libOpenglCodecCommon_32 <= device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp
In file included from device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:16:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:222:23: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned int') [-Wsign-compare]
    for (int i = 0; i < bindingState.size(); i++) {
                    ~ ^ ~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:547:21: warning: comparison of integers of different signs: 'GLenum' (aka 'unsigned int') and 'int' [-Wsign-compare]
    if (which_state != -1)
        ~~~~~~~~~~~ ^  ~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:802:67: warning: unused parameter 'image' [-Wunused-parameter]
void GLClientState::setBoundEGLImage(GLenum target, GLeglImageOES image) {
                                                                  ^
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1049:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1067:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1345:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1351:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
8 warnings generated.
[  9% 7374/78705] target thumb C++: libGLESv2_enc_32 <= device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.cpp:8:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[  9% 7377/78705] target thumb C++: libGLESv1_enc_32 <= device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.cpp:8:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[  9% 7382/78705] target thumb C++: libGLESv2_enc_32 <= device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:477:17: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    return indx < maxIndex;
           ~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:762:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:775:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:788:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1002:67: warning: format specifies type 'unsigned int' but the argument has type 'GLsizeiptr' (aka 'long') [-Wformat]
                                hasClientArrays, i, bufferObject, buf->m_size, buf != NULL, firstIndex, firstIndex + bufLen);
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:988:67: warning: comparison of integers of different signs: 'unsigned int' and 'const GLsizeiptr' (aka 'const long') [-Wsign-compare]
                if (buf && firstIndex >= 0 && firstIndex + bufLen <= buf->m_size) {
                                              ~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:55: warning: unused parameter 'n' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                      ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:72: warning: unused parameter 'shaders' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:88: warning: unused parameter 'binaryformat' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:114: warning: unused parameter 'binary' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                                                 ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:130: warning: unused parameter 'length' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                                                                 ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1416:27: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned int') [-Wsign-compare]
        for (int i = 0; i < shaderData->sources.size(); i++) {
                        ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1417:58: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
            if (curr_len + shaderData->sources[i].size() < bufsize - 1) {
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1916:86: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, 1, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2005:79: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (state->pboNeededDataSize(width, height, 1, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2677:24: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'int' [-Wsign-compare]
                 index >= state->getMaxIndexedBufferBindings(target),
                 ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2716:24: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'int' [-Wsign-compare]
                 index >= state->getMaxIndexedBufferBindings(target),
                 ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2937:31: warning: comparison of unsigned expression >= 0 is always true [-Wtautological-compare]
        if (uniformIndices[i] >= 0 && needLocationWAR) {
            ~~~~~~~~~~~~~~~~~ ^  ~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2925:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < uniformCount; i++) {
                       ~ ^ ~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3077:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3089:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3194:38: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
        (src - GL_COLOR_ATTACHMENT0) >
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3346:90: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, depth, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3407:90: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, depth, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3807:86: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned int') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, 1, format, type, 1) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4042:23: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(unit >= maxCombinedUnits, GL_INVALID_VALUE);
                 ~~~~ ^  ~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4097:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_TRANSFORM_FEEDBACK_BUFFER_BINDING, GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4098:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_UNIFORM_BUFFER_BINDING, GL_MAX_UNIFORM_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4099:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_ATOMIC_COUNTER_BUFFER_BINDING, GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4100:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_SHADER_STORAGE_BUFFER_BINDING, GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4146:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_TRANSFORM_FEEDBACK_BUFFER_BINDING, GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4147:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_UNIFORM_BUFFER_BINDING, GL_MAX_UNIFORM_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4148:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_ATOMIC_COUNTER_BUFFER_BINDING, GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4149:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_SHADER_STORAGE_BUFFER_BINDING, GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4195:31: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned int') [-Wsign-compare]
            for (int i = 0; i < shaderData->sources.size(); i++) {
                            ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:98:40: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
                if (*min == -1 || *ptr < *min) *min = *ptr;
                                  ~~~~ ^ ~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:817:18: note: in instantiation of function template specialization 'GLUtils::minmaxExcept<unsigned int>' requested here
        GLUtils::minmaxExcept(
                 ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:99:40: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
                if (*max == -1 || *ptr > *max) *max = *ptr;
                                  ~~~~ ^ ~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:81:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*min == -1 || *ptr < *min) *min = *ptr;
                              ~~~~ ^ ~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:91:36: note: in instantiation of function template specialization 'GLUtils::minmax<unsigned int>' requested here
        if (!shouldExclude) return minmax(indices, count, min, max);
                                   ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:817:18: note: in instantiation of function template specialization 'GLUtils::minmaxExcept<unsigned int>' requested here
        GLUtils::minmaxExcept(
                 ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:82:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*max == -1 || *ptr > *max) *max = *ptr;
                              ~~~~ ^ ~~~~
42 warnings generated.
[  9% 7440/78705] target thumb C++: libGLESv1_CM_emulation_32 <= device/generic/goldfish-opengl/system/GLESv1/gl.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:24:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
6 warnings generated.
[  9% 7476/78705] target thumb C: fingerprint.goldfish_32 <= device/generic/goldfish/fingerprint/fingerprint.c
In file included from device/generic/goldfish/fingerprint/fingerprint.c:38:
device/generic/goldfish/fingerprint/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/fingerprint/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[  9% 7477/78705] target thumb C: fingerprint.ranchu_32 <= device/generic/goldfish/fingerprint/fingerprint.c
In file included from device/generic/goldfish/fingerprint/fingerprint.c:38:
device/generic/goldfish/fingerprint/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/fingerprint/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[  9% 7488/78705] target thumb C: gps.goldfish_32 <= device/generic/goldfish/gps/gps_qemu.c
device/generic/goldfish/gps/gps_qemu.c:47:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...)   ((void)0)
           ^
device/generic/goldfish/gps/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[  9% 7489/78705] target thumb C: gps.ranchu_32 <= device/generic/goldfish/gps/gps_qemu.c
device/generic/goldfish/gps/gps_qemu.c:47:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...)   ((void)0)
           ^
device/generic/goldfish/gps/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[  9% 7500/78705] target thumb C++: hwcomposer.goldfish_32 <= device/generic/goldfish/hwcomposer/hwcomposer.cpp
device/generic/goldfish/hwcomposer/hwcomposer.cpp:268:73: warning: format specifies type 'int' but the argument has type 'long long' [-Wformat]
            ALOGD("hw_composer sent %d syncs in %ds", sent - last_sent, rt.tv_sec - last_logged);
                                                ~~                      ^~~~~~~~~~~~~~~~~~~~~~~
                                                %lld
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:342:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: hwc_open,
    ^~~~~
    .open = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:346:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:347:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        tag: HARDWARE_MODULE_TAG,
        ^~~~
        .tag = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:348:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        module_api_version: HWC_MODULE_API_VERSION_0_1,
        ^~~~~~~~~~~~~~~~~~~
        .module_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:349:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        hal_api_version: HARDWARE_HAL_API_VERSION,
        ^~~~~~~~~~~~~~~~
        .hal_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:350:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        id: HWC_HARDWARE_MODULE_ID,
        ^~~
        .id = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:351:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        name: "Android Emulator hwcomposer module",
        ^~~~~
        .name = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:352:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        author: "The Android Open Source Project",
        ^~~~~~~
        .author = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:353:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        methods: &hwc_module_methods,
        ^~~~~~~~
        .methods = 
10 warnings generated.
[  9% 7501/78705] target thumb C++: libGLESv2_emulation_32 <= device/generic/goldfish-opengl/system/GLESv2/gl2.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:24:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
6 warnings generated.
[  9% 7502/78705] target thumb C++: hwcomposer.ranchu_32 <= device/generic/goldfish/hwcomposer/hwcomposer.cpp
device/generic/goldfish/hwcomposer/hwcomposer.cpp:268:73: warning: format specifies type 'int' but the argument has type 'long long' [-Wformat]
            ALOGD("hw_composer sent %d syncs in %ds", sent - last_sent, rt.tv_sec - last_logged);
                                                ~~                      ^~~~~~~~~~~~~~~~~~~~~~~
                                                %lld
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:342:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: hwc_open,
    ^~~~~
    .open = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:346:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:347:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        tag: HARDWARE_MODULE_TAG,
        ^~~~
        .tag = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:348:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        module_api_version: HWC_MODULE_API_VERSION_0_1,
        ^~~~~~~~~~~~~~~~~~~
        .module_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:349:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        hal_api_version: HARDWARE_HAL_API_VERSION,
        ^~~~~~~~~~~~~~~~
        .hal_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:350:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        id: HWC_HARDWARE_MODULE_ID,
        ^~~
        .id = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:351:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        name: "Android Emulator hwcomposer module",
        ^~~~~
        .name = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:352:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        author: "The Android Open Source Project",
        ^~~~~~~
        .author = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:353:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        methods: &hwc_module_methods,
        ^~~~~~~~
        .methods = 
10 warnings generated.
[  9% 7507/78705] target thumb C: lights.goldfish_32 <= device/generic/goldfish/lights/lights_qemu.c
In file included from device/generic/goldfish/lights/lights_qemu.c:42:
device/generic/goldfish/lights/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/lights/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/lights/lights_qemu.c:49:10: warning: 'D' macro redefined [-Wmacro-redefined]
# define D(...) do{}while(0)
         ^
device/generic/goldfish/lights/../include/qemud.h:39:12: note: previous definition is here
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/lights/lights_qemu.c:65:45: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_backlight( struct light_device_t* dev, struct light_state_t const* state )
                                            ^
device/generic/goldfish/lights/lights_qemu.c:101:43: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_buttons( struct light_device_t* dev, struct light_state_t const* state )
                                          ^
device/generic/goldfish/lights/lights_qemu.c:101:76: warning: unused parameter 'state' [-Wunused-parameter]
set_light_buttons( struct light_device_t* dev, struct light_state_t const* state )
                                                                           ^
device/generic/goldfish/lights/lights_qemu.c:110:43: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_battery( struct light_device_t* dev, struct light_state_t const* state )
                                          ^
device/generic/goldfish/lights/lights_qemu.c:110:76: warning: unused parameter 'state' [-Wunused-parameter]
set_light_battery( struct light_device_t* dev, struct light_state_t const* state )
                                                                           ^
device/generic/goldfish/lights/lights_qemu.c:119:44: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_keyboard( struct light_device_t* dev, struct light_state_t const* state )
                                           ^
device/generic/goldfish/lights/lights_qemu.c:119:77: warning: unused parameter 'state' [-Wunused-parameter]
set_light_keyboard( struct light_device_t* dev, struct light_state_t const* state )
                                                                            ^
device/generic/goldfish/lights/lights_qemu.c:128:49: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_notifications( struct light_device_t* dev, struct light_state_t const* state )
                                                ^
device/generic/goldfish/lights/lights_qemu.c:128:82: warning: unused parameter 'state' [-Wunused-parameter]
set_light_notifications( struct light_device_t* dev, struct light_state_t const* state )
                                                                                 ^
device/generic/goldfish/lights/lights_qemu.c:137:45: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_attention( struct light_device_t* dev, struct light_state_t const* state )
                                            ^
device/generic/goldfish/lights/lights_qemu.c:137:78: warning: unused parameter 'state' [-Wunused-parameter]
set_light_attention( struct light_device_t* dev, struct light_state_t const* state )
                                                                             ^
13 warnings generated.
[  9% 7512/78705] target thumb C: power.goldfish_32 <= device/generic/goldfish/power/power_qemu.c
In file included from device/generic/goldfish/power/power_qemu.c:22:
device/generic/goldfish/power/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/power/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/power/power_qemu.c:28:50: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_init(struct power_module *module)
                                                 ^
device/generic/goldfish/power/power_qemu.c:36:61: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_set_interactive(struct power_module *module, int on)
                                                            ^
3 warnings generated.
[  9% 7521/78705] target thumb C: power.ranchu_32 <= device/generic/goldfish/power/power_qemu.c
In file included from device/generic/goldfish/power/power_qemu.c:22:
device/generic/goldfish/power/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/power/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/power/power_qemu.c:28:50: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_init(struct power_module *module)
                                                 ^
device/generic/goldfish/power/power_qemu.c:36:61: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_set_interactive(struct power_module *module, int on)
                                                            ^
3 warnings generated.
[  9% 7526/78705] target thumb C: sensors.ranchu_32 <= device/generic/goldfish/sensors/sensors_qemu.c
device/generic/goldfish/sensors/sensors_qemu.c:621:36: warning: incompatible pointer types passing 'struct sensors_poll_device_1 *' to parameter of type 'struct sensors_poll_device_t *' [-Wincompatible-pointer-types]
    return sensor_device_set_delay(dev, sensor_handle, sampling_period_ns);
                                   ^~~
device/generic/goldfish/sensors/sensors_qemu.c:594:66: note: passing argument to parameter 'dev0' here
static int sensor_device_set_delay(struct sensors_poll_device_t *dev0,
                                                                 ^
device/generic/goldfish/sensors/sensors_qemu.c:618:10: warning: unused parameter 'flags' [-Wunused-parameter]
     int flags,
         ^
device/generic/goldfish/sensors/sensors_qemu.c:620:14: warning: unused parameter 'max_report_latency_ns' [-Wunused-parameter]
     int64_t max_report_latency_ns) {
             ^
3 warnings generated.
[  9% 7527/78705] target thumb C: sensors.goldfish_32 <= device/generic/goldfish/sensors/sensors_qemu.c
device/generic/goldfish/sensors/sensors_qemu.c:621:36: warning: incompatible pointer types passing 'struct sensors_poll_device_1 *' to parameter of type 'struct sensors_poll_device_t *' [-Wincompatible-pointer-types]
    return sensor_device_set_delay(dev, sensor_handle, sampling_period_ns);
                                   ^~~
device/generic/goldfish/sensors/sensors_qemu.c:594:66: note: passing argument to parameter 'dev0' here
static int sensor_device_set_delay(struct sensors_poll_device_t *dev0,
                                                                 ^
device/generic/goldfish/sensors/sensors_qemu.c:618:10: warning: unused parameter 'flags' [-Wunused-parameter]
     int flags,
         ^
device/generic/goldfish/sensors/sensors_qemu.c:620:14: warning: unused parameter 'max_report_latency_ns' [-Wunused-parameter]
     int64_t max_report_latency_ns) {
             ^
3 warnings generated.
[  9% 7570/78705] target thumb C++: gralloc.goldfish_32 <= device/generic/goldfish-opengl/system/gralloc/gralloc.cpp
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:611:73: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
        ALOGD("%s: Creating ashmem region of size %lu\n", __FUNCTION__, ashmem_size);
                                                  ~~~                   ^~~~~~~~~~~
                                                  %d
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1193:53: warning: unused parameter 'usage' [-Wunused-parameter]
                        buffer_handle_t handle, int usage,
                                                    ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1420:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        open: gralloc_device_open
        ^~~~~
        .open = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1424:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    base: {
    ^~~~~
    .base = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1425:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        common: {
        ^~~~~~~
        .common = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1426:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            tag: HARDWARE_MODULE_TAG,
            ^~~~
            .tag = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1428:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            module_api_version: GRALLOC_MODULE_API_VERSION_0_2,
            ^~~~~~~~~~~~~~~~~~~
            .module_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1429:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            hal_api_version: 0,
            ^~~~~~~~~~~~~~~~
            .hal_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1437:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            id: GRALLOC_HARDWARE_MODULE_ID,
            ^~~
            .id = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1438:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            name: "Graphics Memory Allocator Module",
            ^~~~~
            .name = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1439:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            author: "The Android Open Source Project",
            ^~~~~~~
            .author = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1440:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            methods: &gralloc_module_methods,
            ^~~~~~~~
            .methods = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1441:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            dso: NULL,
            ^~~~
            .dso = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1442:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            reserved: {0, }
            ^~~~~~~~~
            .reserved = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1444:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        registerBuffer: gralloc_register_buffer,
        ^~~~~~~~~~~~~~~
        .registerBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1445:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unregisterBuffer: gralloc_unregister_buffer,
        ^~~~~~~~~~~~~~~~~
        .unregisterBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1446:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock: gralloc_lock,
        ^~~~~
        .lock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1447:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unlock: gralloc_unlock,
        ^~~~~~~
        .unlock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1448:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        perform: NULL,
        ^~~~~~~~
        .perform = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1450:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock_ycbcr: gralloc_lock_ycbcr,
        ^~~~~~~~~~~
        .lock_ycbcr = 
22 warnings generated.
[  9% 7571/78705] target thumb C: libFFTEm_32 <= external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c
external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c:678:81: warning: for loop has empty body [-Wempty-body]
                        for( iL = ( sizeL >> 1 ); iL < sizeL && actArrL[ idxArrL[ iL ] ] >= 0; iL++ );
                                                                                                     ^
external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c:678:81: note: put the semicolon on a separate line to silence this warning
1 warning generated.
[  9% 7577/78705] target thumb C++: gralloc.ranchu_32 <= device/generic/goldfish-opengl/system/gralloc/gralloc.cpp
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:611:73: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
        ALOGD("%s: Creating ashmem region of size %lu\n", __FUNCTION__, ashmem_size);
                                                  ~~~                   ^~~~~~~~~~~
                                                  %d
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1193:53: warning: unused parameter 'usage' [-Wunused-parameter]
                        buffer_handle_t handle, int usage,
                                                    ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1420:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        open: gralloc_device_open
        ^~~~~
        .open = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1424:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    base: {
    ^~~~~
    .base = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1425:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        common: {
        ^~~~~~~
        .common = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1426:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            tag: HARDWARE_MODULE_TAG,
            ^~~~
            .tag = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1428:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            module_api_version: GRALLOC_MODULE_API_VERSION_0_2,
            ^~~~~~~~~~~~~~~~~~~
            .module_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1429:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            hal_api_version: 0,
            ^~~~~~~~~~~~~~~~
            .hal_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1437:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            id: GRALLOC_HARDWARE_MODULE_ID,
            ^~~
            .id = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1438:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            name: "Graphics Memory Allocator Module",
            ^~~~~
            .name = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1439:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            author: "The Android Open Source Project",
            ^~~~~~~
            .author = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1440:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            methods: &gralloc_module_methods,
            ^~~~~~~~
            .methods = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1441:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            dso: NULL,
            ^~~~
            .dso = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1442:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            reserved: {0, }
            ^~~~~~~~~
            .reserved = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1444:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        registerBuffer: gralloc_register_buffer,
        ^~~~~~~~~~~~~~~
        .registerBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1445:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unregisterBuffer: gralloc_unregister_buffer,
        ^~~~~~~~~~~~~~~~~
        .unregisterBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1446:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock: gralloc_lock,
        ^~~~~
        .lock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1447:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unlock: gralloc_unlock,
        ^~~~~~~
        .unlock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1448:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        perform: NULL,
        ^~~~~~~~
        .perform = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1450:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock_ycbcr: gralloc_lock_ycbcr,
        ^~~~~~~~~~~
        .lock_ycbcr = 
22 warnings generated.
[  9% 7623/78705] target thumb C: libFFTEm_32 <= external/neven/FaceRecEm/common/src/b_FDSDK/SDK.c
external/neven/FaceRecEm/common/src/b_FDSDK/SDK.c:209:42: warning: implicit conversion from enumeration type 'btk_Status' to different enumeration type 'btk_Error' [-Wenum-conversion]
        if( hsdkA->hidE != btk_HID_SDK )        return btk_STATUS_INVALID_HANDLE;
                                                ~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.
[ 11% 8816/78705] Check module type: out/target/product/generic_arm64/obj_arm/SHARED_LIBRARIES/libreference-ril_intermediates/link_type
hardware/ril/reference-ril/Android.mk: warning: libreference-ril (native:platform) should not link to libril (partition:vendor)
[ 12% 9745/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfishHwc2.cpp
device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfishHwc2.cpp:21:62: warning: unused parameter 'window' [-Wunused-parameter]
extern "C" void surfaceInterface_setAsyncModeForWindow(void* window) { }
                                                             ^
1 warning generated.
[ 12% 9750/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfish_dma.cpp
device/generic/goldfish-opengl/system/OpenglSystemCommon/goldfish_dma.cpp:57:29: warning: format specifies type 'unsigned long' but the argument has type 'uint32_t' (aka 'unsigned int') [-Wformat]
              __FUNCTION__, sz, res);
                            ^~
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
1 warning generated.
[ 12% 9753/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/ProcessPipe.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ProcessPipe.cpp:17:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[ 12% 9755/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/QemuPipeStream.cpp
device/generic/goldfish-opengl/system/OpenglSystemCommon/QemuPipeStream.cpp:75:42: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
            ERR("realloc (%d) failed\n", allocSize);
                          ~~             ^~~~~~~~~
                          %zu
device/generic/goldfish-opengl/shared/OpenglCodecCommon/ErrorLog.h:21:31: note: expanded from macro 'ERR'
#    define ERR(...)    ALOGE(__VA_ARGS__)
                              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/OpenglSystemCommon/QemuPipeStream.cpp:99:46: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                   " lethal error, exiting", len);
                                             ^~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/ErrorLog.h:21:31: note: expanded from macro 'ERR'
#    define ERR(...)    ALOGE(__VA_ARGS__)
                              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
2 warnings generated.
[ 12% 9761/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:16:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:16:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:16:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.cpp:21:49: warning: unused parameter 'ptr' [-Wunused-parameter]
static bool sDefaultTlsDestructorCallback(void* ptr) { return true; }
                                                ^
5 warnings generated.
[ 12% 9763/78705] target  C++: libEGL_emulation <= device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:17:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:17:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:19:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:17:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
In file included from device/generic/goldfish-opengl/system/egl/ClientAPIExts.cpp:20:
In file included from device/generic/goldfish-opengl/system/egl/eglContext.h:19:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
5 warnings generated.
[ 12% 9764/78705] target  C++: libEGL_emulation <= device/generic/goldfish-opengl/system/egl/eglDisplay.cpp
In file included from device/generic/goldfish-opengl/system/egl/eglDisplay.cpp:17:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/eglDisplay.cpp:17:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
3 warnings generated.
[ 12% 9765/78705] target  C++: libOpenglCodecCommon <= device/generic/goldfish-opengl/shared/OpenglCodecCommon/ChecksumCalculator.cpp
device/generic/goldfish-opengl/shared/OpenglCodecCommon/ChecksumCalculator.cpp:85:48: warning: unused parameter 'buf' [-Wunused-parameter]
void ChecksumCalculator::addBuffer(const void* buf, size_t packetLen) {
                                               ^
1 warning generated.
[ 12% 9766/78705] target  C++: lib_renderControl_enc <= device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.cpp
In file included from device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.cpp:8:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[ 12% 9769/78705] target  C++: libOpenglSystemCommon <= device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:16:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:16:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.cpp:23:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
9 warnings generated.
[ 12% 9775/78705] target  C++: libEGL_emulation <= device/generic/goldfish-opengl/system/egl/egl.cpp
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:18:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:19:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:27:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:35:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/egl/egl.cpp:37:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
device/generic/goldfish-opengl/system/egl/egl.cpp:687:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    getThreadInfo: getEGLThreadInfo,
    ^~~~~~~~~~~~~~
    .getThreadInfo = 
device/generic/goldfish-opengl/system/egl/egl.cpp:688:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    getGLString: getGLString
    ^~~~~~~~~~~~
    .getGLString = 
11 warnings generated.
[ 12% 9777/78705] target  C++: libGLESv2_enc <= device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2EncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
3 warnings generated.
[ 12% 9784/78705] target  C++: libGLESv2_enc <= device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.h:27:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.h:27:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:292:38: warning: unused parameter 'format' [-Wunused-parameter]
bool readPixelsFboFormatMatch(GLenum format, GLenum type, GLenum fboTexType) {
                                     ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:589:40: warning: unused parameter 'ctx' [-Wunused-parameter]
bool depthRenderableFormat(GL2Encoder* ctx, GLenum internalformat) {
                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GLESv2Validation.cpp:603:42: warning: unused parameter 'ctx' [-Wunused-parameter]
bool stencilRenderableFormat(GL2Encoder* ctx, GLenum internalformat) {
                                         ^
6 warnings generated.
[ 12% 9792/78705] target  C++: libGLESv1_enc <= device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoderUtils.cpp:18:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
3 warnings generated.
[ 12% 9797/78705] target  C++: libGLESv1_enc <= device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:12:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:81:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*min == -1 || *ptr < *min) *min = *ptr;
                              ~~~~ ^ ~~~~
device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:606:22: note: in instantiation of function template specialization 'GLUtils::minmax<unsigned int>' requested here
            GLUtils::minmax<unsigned int>((unsigned int *)indices, count, &minIndex, &maxIndex);
                     ^
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.cpp:16:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:12:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:82:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*max == -1 || *ptr > *max) *max = *ptr;
                              ~~~~ ^ ~~~~
5 warnings generated.
[ 12% 9802/78705] target  C++: libOpenglCodecCommon <= device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp
In file included from device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:16:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:222:23: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned long') [-Wsign-compare]
    for (int i = 0; i < bindingState.size(); i++) {
                    ~ ^ ~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:547:21: warning: comparison of integers of different signs: 'GLenum' (aka 'unsigned int') and 'int' [-Wsign-compare]
    if (which_state != -1)
        ~~~~~~~~~~~ ^  ~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:802:67: warning: unused parameter 'image' [-Wunused-parameter]
void GLClientState::setBoundEGLImage(GLenum target, GLeglImageOES image) {
                                                                  ^
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1049:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1067:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1345:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.cpp:1351:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < n; i++) {
                       ~ ^ ~
8 warnings generated.
[ 12% 9809/78705] target  C++: libGLESv2_enc <= device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.cpp:8:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[ 12% 9810/78705] target  C++: libGLESv1_enc <= device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.cpp:8:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
2 warnings generated.
[ 12% 9814/78705] target  C++: libGLESv2_enc <= device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:477:17: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    return indx < maxIndex;
           ~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:762:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:775:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:788:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1002:67: warning: format specifies type 'unsigned int' but the argument has type 'GLsizeiptr' (aka 'long') [-Wformat]
                                hasClientArrays, i, bufferObject, buf->m_size, buf != NULL, firstIndex, firstIndex + bufLen);
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:55: warning: unused parameter 'n' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                      ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:72: warning: unused parameter 'shaders' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:88: warning: unused parameter 'binaryformat' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                       ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:114: warning: unused parameter 'binary' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                                                 ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1262:130: warning: unused parameter 'length' [-Wunused-parameter]
void GL2Encoder::s_glShaderBinary(void *self, GLsizei n, const GLuint *shaders, GLenum binaryformat, const void* binary, GLsizei length)
                                                                                                                                 ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1416:27: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned long') [-Wsign-compare]
        for (int i = 0; i < shaderData->sources.size(); i++) {
                        ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1417:58: warning: comparison of integers of different signs: 'unsigned long' and 'int' [-Wsign-compare]
            if (curr_len + shaderData->sources[i].size() < bufsize - 1) {
                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:1916:86: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, 1, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2005:79: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (state->pboNeededDataSize(width, height, 1, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2677:24: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'int' [-Wsign-compare]
                 index >= state->getMaxIndexedBufferBindings(target),
                 ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2716:24: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'int' [-Wsign-compare]
                 index >= state->getMaxIndexedBufferBindings(target),
                 ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2937:31: warning: comparison of unsigned expression >= 0 is always true [-Wtautological-compare]
        if (uniformIndices[i] >= 0 && needLocationWAR) {
            ~~~~~~~~~~~~~~~~~ ^  ~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:2925:26: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizei' (aka 'int') [-Wsign-compare]
    for (size_t i = 0; i < uniformCount; i++) {
                       ~ ^ ~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3077:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3089:26: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(!(index < maxIndex), GL_INVALID_VALUE);
                   ~~~~~ ^ ~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3194:38: warning: comparison of integers of different signs: 'unsigned int' and 'int' [-Wsign-compare]
        (src - GL_COLOR_ATTACHMENT0) >
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3346:90: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, depth, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3407:90: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, depth, format, type, 0) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:3807:86: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'GLsizeiptr' (aka 'long') [-Wsign-compare]
                 (ctx->m_state->pboNeededDataSize(width, height, 1, format, type, 1) >
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4042:23: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    SET_ERROR_IF(unit >= maxCombinedUnits, GL_INVALID_VALUE);
                 ~~~~ ^  ~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4097:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_TRANSFORM_FEEDBACK_BUFFER_BINDING, GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4098:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_UNIFORM_BUFFER_BINDING, GL_MAX_UNIFORM_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4099:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_ATOMIC_COUNTER_BUFFER_BINDING, GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4100:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_SHADER_STORAGE_BUFFER_BINDING, GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4146:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_TRANSFORM_FEEDBACK_BUFFER_BINDING, GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4147:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_UNIFORM_BUFFER_BINDING, GL_MAX_UNIFORM_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4148:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_ATOMIC_COUNTER_BUFFER_BINDING, GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4149:5: warning: comparison of integers of different signs: 'GLuint' (aka 'unsigned int') and 'GLint' (aka 'int') [-Wsign-compare]
    LIMIT_CASE(GL_SHADER_STORAGE_BUFFER_BINDING, GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4087:41: note: expanded from macro 'LIMIT_CASE'
        SET_ERROR_IF(index < 0 || index >= limit, GL_INVALID_VALUE); \
                                  ~~~~~ ^  ~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:42:42: note: expanded from macro 'SET_ERROR_IF'
#define SET_ERROR_IF(condition, err) if((condition)) { \
                                         ^~~~~~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:4195:31: warning: comparison of integers of different signs: 'int' and 'size_type' (aka 'unsigned long') [-Wsign-compare]
            for (int i = 0; i < shaderData->sources.size(); i++) {
                            ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:98:40: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
                if (*min == -1 || *ptr < *min) *min = *ptr;
                                  ~~~~ ^ ~~~~
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:817:18: note: in instantiation of function template specialization 'GLUtils::minmaxExcept<unsigned int>' requested here
        GLUtils::minmaxExcept(
                 ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:99:40: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
                if (*max == -1 || *ptr > *max) *max = *ptr;
                                  ~~~~ ^ ~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:81:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*min == -1 || *ptr < *min) *min = *ptr;
                              ~~~~ ^ ~~~~
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:91:36: note: in instantiation of function template specialization 'GLUtils::minmax<unsigned int>' requested here
        if (!shouldExclude) return minmax(indices, count, min, max);
                                   ^
device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:817:18: note: in instantiation of function template specialization 'GLUtils::minmaxExcept<unsigned int>' requested here
        GLUtils::minmaxExcept(
                 ^
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.cpp:17:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:13:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/glUtils.h:82:36: warning: comparison of integers of different signs: 'const unsigned int' and 'int' [-Wsign-compare]
            if (*max == -1 || *ptr > *max) *max = *ptr;
                              ~~~~ ^ ~~~~
41 warnings generated.
[ 12% 9859/78705] target  C: audio.primary.goldfish_legacy <= device/generic/goldfish/audio/audio_hw_legacy.c
device/generic/goldfish/audio/audio_hw_legacy.c:115:17: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                out_get_buffer_size(stream),
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish/audio/audio_hw_legacy.c:271:17: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                in_get_buffer_size(stream),
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
2 warnings generated.
[ 12% 9862/78705] target  C: audio.primary.goldfish <= device/generic/goldfish/audio/audio_hw.c
device/generic/goldfish/audio/audio_hw.c:295:17: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                out_get_buffer_size(stream),
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish/audio/audio_hw.c:480:15: warning: format specifies type 'long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
              *position, out->frames_written);
              ^~~~~~~~~
system/core/liblog/include/log/log_main.h:228:51: note: expanded from macro 'ALOGW'
#define ALOGW(...) ((void)ALOG(LOG_WARN, LOG_TAG, __VA_ARGS__))
                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/audio/audio_hw.c:480:26: warning: format specifies type 'long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
              *position, out->frames_written);
                         ^~~~~~~~~~~~~~~~~~~
system/core/liblog/include/log/log_main.h:228:51: note: expanded from macro 'ALOGW'
#define ALOGW(...) ((void)ALOG(LOG_WARN, LOG_TAG, __VA_ARGS__))
                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/audio/audio_hw.c:550:83: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
        ALOGW("Hardware backing HAL too slow, could only write %d of %zu frames", frames_written, frames);
                                                               ~~                 ^~~~~~~~~~~~~~
                                                               %zu
system/core/liblog/include/log/log_main.h:228:51: note: expanded from macro 'ALOGW'
#define ALOGW(...) ((void)ALOG(LOG_WARN, LOG_TAG, __VA_ARGS__))
                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/audio/audio_hw.c:804:17: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                in_get_buffer_size(stream),
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
device/generic/goldfish/audio/audio_hw.c:1031:50: warning: comparison of integers of different signs: 'const int64_t' (aka 'const long') and 'const size_t' (aka 'const unsigned long') [-Wsign-compare]
    const size_t frames_wait = (frames_available > frames) ? 0 : frames - frames_available;
                                ~~~~~~~~~~~~~~~~ ^ ~~~~~~
6 warnings generated.
[ 12% 9909/78705] target  C: fingerprint.goldfish <= device/generic/goldfish/fingerprint/fingerprint.c
In file included from device/generic/goldfish/fingerprint/fingerprint.c:38:
device/generic/goldfish/fingerprint/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/fingerprint/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[ 12% 9913/78705] target  C: fingerprint.ranchu <= device/generic/goldfish/fingerprint/fingerprint.c
In file included from device/generic/goldfish/fingerprint/fingerprint.c:38:
device/generic/goldfish/fingerprint/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/fingerprint/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[ 12% 9917/78705] target  C: gps.goldfish <= device/generic/goldfish/gps/gps_qemu.c
device/generic/goldfish/gps/gps_qemu.c:47:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...)   ((void)0)
           ^
device/generic/goldfish/gps/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[ 12% 9924/78705] target  C: gps.ranchu <= device/generic/goldfish/gps/gps_qemu.c
device/generic/goldfish/gps/gps_qemu.c:47:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...)   ((void)0)
           ^
device/generic/goldfish/gps/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
1 warning generated.
[ 12% 9927/78705] target  C++: libGLESv1_CM_emulation <= device/generic/goldfish-opengl/system/GLESv1/gl.cpp
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:18:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:19:
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv1_enc/gl_enc.h:21:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv1_enc/GLEncoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv1/gl.cpp:24:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
7 warnings generated.
[ 12% 9935/78705] target  C++: hwcomposer.goldfish <= device/generic/goldfish/hwcomposer/hwcomposer.cpp
device/generic/goldfish/hwcomposer/hwcomposer.cpp:82:55: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                      "HWC_FRAMEBUFFER_TARGET layer", layer);
                                                      ^~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:268:73: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
            ALOGD("hw_composer sent %d syncs in %ds", sent - last_sent, rt.tv_sec - last_logged);
                                                ~~                      ^~~~~~~~~~~~~~~~~~~~~~~
                                                %ld
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:342:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: hwc_open,
    ^~~~~
    .open = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:346:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:347:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        tag: HARDWARE_MODULE_TAG,
        ^~~~
        .tag = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:348:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        module_api_version: HWC_MODULE_API_VERSION_0_1,
        ^~~~~~~~~~~~~~~~~~~
        .module_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:349:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        hal_api_version: HARDWARE_HAL_API_VERSION,
        ^~~~~~~~~~~~~~~~
        .hal_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:350:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        id: HWC_HARDWARE_MODULE_ID,
        ^~~
        .id = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:351:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        name: "Android Emulator hwcomposer module",
        ^~~~~
        .name = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:352:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        author: "The Android Open Source Project",
        ^~~~~~~
        .author = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:353:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        methods: &hwc_module_methods,
        ^~~~~~~~
        .methods = 
11 warnings generated.
[ 12% 9938/78705] target  C++: hwcomposer.ranchu <= device/generic/goldfish/hwcomposer/hwcomposer.cpp
device/generic/goldfish/hwcomposer/hwcomposer.cpp:82:55: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
                      "HWC_FRAMEBUFFER_TARGET layer", layer);
                                                      ^~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:268:73: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
            ALOGD("hw_composer sent %d syncs in %ds", sent - last_sent, rt.tv_sec - last_logged);
                                                ~~                      ^~~~~~~~~~~~~~~~~~~~~~~
                                                %ld
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish/hwcomposer/hwcomposer.cpp:342:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: hwc_open,
    ^~~~~
    .open = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:346:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:347:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        tag: HARDWARE_MODULE_TAG,
        ^~~~
        .tag = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:348:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        module_api_version: HWC_MODULE_API_VERSION_0_1,
        ^~~~~~~~~~~~~~~~~~~
        .module_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:349:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        hal_api_version: HARDWARE_HAL_API_VERSION,
        ^~~~~~~~~~~~~~~~
        .hal_api_version = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:350:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        id: HWC_HARDWARE_MODULE_ID,
        ^~~
        .id = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:351:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        name: "Android Emulator hwcomposer module",
        ^~~~~
        .name = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:352:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        author: "The Android Open Source Project",
        ^~~~~~~
        .author = 
device/generic/goldfish/hwcomposer/hwcomposer.cpp:353:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        methods: &hwc_module_methods,
        ^~~~~~~~
        .methods = 
11 warnings generated.
[ 12% 9943/78705] target  C: lights.goldfish <= device/generic/goldfish/lights/lights_qemu.c
In file included from device/generic/goldfish/lights/lights_qemu.c:42:
device/generic/goldfish/lights/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/lights/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/lights/lights_qemu.c:49:10: warning: 'D' macro redefined [-Wmacro-redefined]
# define D(...) do{}while(0)
         ^
device/generic/goldfish/lights/../include/qemud.h:39:12: note: previous definition is here
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/lights/lights_qemu.c:65:45: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_backlight( struct light_device_t* dev, struct light_state_t const* state )
                                            ^
device/generic/goldfish/lights/lights_qemu.c:101:43: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_buttons( struct light_device_t* dev, struct light_state_t const* state )
                                          ^
device/generic/goldfish/lights/lights_qemu.c:101:76: warning: unused parameter 'state' [-Wunused-parameter]
set_light_buttons( struct light_device_t* dev, struct light_state_t const* state )
                                                                           ^
device/generic/goldfish/lights/lights_qemu.c:110:43: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_battery( struct light_device_t* dev, struct light_state_t const* state )
                                          ^
device/generic/goldfish/lights/lights_qemu.c:110:76: warning: unused parameter 'state' [-Wunused-parameter]
set_light_battery( struct light_device_t* dev, struct light_state_t const* state )
                                                                           ^
device/generic/goldfish/lights/lights_qemu.c:119:44: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_keyboard( struct light_device_t* dev, struct light_state_t const* state )
                                           ^
device/generic/goldfish/lights/lights_qemu.c:119:77: warning: unused parameter 'state' [-Wunused-parameter]
set_light_keyboard( struct light_device_t* dev, struct light_state_t const* state )
                                                                            ^
device/generic/goldfish/lights/lights_qemu.c:128:49: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_notifications( struct light_device_t* dev, struct light_state_t const* state )
                                                ^
device/generic/goldfish/lights/lights_qemu.c:128:82: warning: unused parameter 'state' [-Wunused-parameter]
set_light_notifications( struct light_device_t* dev, struct light_state_t const* state )
                                                                                 ^
device/generic/goldfish/lights/lights_qemu.c:137:45: warning: unused parameter 'dev' [-Wunused-parameter]
set_light_attention( struct light_device_t* dev, struct light_state_t const* state )
                                            ^
device/generic/goldfish/lights/lights_qemu.c:137:78: warning: unused parameter 'state' [-Wunused-parameter]
set_light_attention( struct light_device_t* dev, struct light_state_t const* state )
                                                                             ^
13 warnings generated.
[ 12% 9944/78705] target  C: power.goldfish <= device/generic/goldfish/power/power_qemu.c
In file included from device/generic/goldfish/power/power_qemu.c:22:
device/generic/goldfish/power/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/power/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/power/power_qemu.c:28:50: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_init(struct power_module *module)
                                                 ^
device/generic/goldfish/power/power_qemu.c:36:61: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_set_interactive(struct power_module *module, int on)
                                                            ^
3 warnings generated.
[ 12% 9951/78705] target  C: power.ranchu <= device/generic/goldfish/power/power_qemu.c
In file included from device/generic/goldfish/power/power_qemu.c:22:
device/generic/goldfish/power/../include/qemud.h:39:12: warning: 'D' macro redefined [-Wmacro-redefined]
#  define  D(...) ((void)0)
           ^
device/generic/goldfish/power/../include/qemu_pipe.h:30:12: note: previous definition is here
#  define  D(...)   do{}while(0)
           ^
device/generic/goldfish/power/power_qemu.c:28:50: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_init(struct power_module *module)
                                                 ^
device/generic/goldfish/power/power_qemu.c:36:61: warning: unused parameter 'module' [-Wunused-parameter]
static void power_qemu_set_interactive(struct power_module *module, int on)
                                                            ^
3 warnings generated.
[ 12% 9958/78705] target  C: sensors.goldfish <= device/generic/goldfish/sensors/sensors_qemu.c
device/generic/goldfish/sensors/sensors_qemu.c:398:39: warning: format specifies type 'long long *' but the argument has type 'int64_t *' (aka 'long *') [-Wformat]
        if (sscanf(buff, "sync:%lld", &event_time) == 1) {
                               ~~~~   ^~~~~~~~~~~
                               %ld
device/generic/goldfish/sensors/sensors_qemu.c:621:36: warning: incompatible pointer types passing 'struct sensors_poll_device_1 *' to parameter of type 'struct sensors_poll_device_t *' [-Wincompatible-pointer-types]
    return sensor_device_set_delay(dev, sensor_handle, sampling_period_ns);
                                   ^~~
device/generic/goldfish/sensors/sensors_qemu.c:594:66: note: passing argument to parameter 'dev0' here
static int sensor_device_set_delay(struct sensors_poll_device_t *dev0,
                                                                 ^
device/generic/goldfish/sensors/sensors_qemu.c:618:10: warning: unused parameter 'flags' [-Wunused-parameter]
     int flags,
         ^
device/generic/goldfish/sensors/sensors_qemu.c:620:14: warning: unused parameter 'max_report_latency_ns' [-Wunused-parameter]
     int64_t max_report_latency_ns) {
             ^
4 warnings generated.
[ 12% 9961/78705] target  C: sensors.ranchu <= device/generic/goldfish/sensors/sensors_qemu.c
device/generic/goldfish/sensors/sensors_qemu.c:398:39: warning: format specifies type 'long long *' but the argument has type 'int64_t *' (aka 'long *') [-Wformat]
        if (sscanf(buff, "sync:%lld", &event_time) == 1) {
                               ~~~~   ^~~~~~~~~~~
                               %ld
device/generic/goldfish/sensors/sensors_qemu.c:621:36: warning: incompatible pointer types passing 'struct sensors_poll_device_1 *' to parameter of type 'struct sensors_poll_device_t *' [-Wincompatible-pointer-types]
    return sensor_device_set_delay(dev, sensor_handle, sampling_period_ns);
                                   ^~~
device/generic/goldfish/sensors/sensors_qemu.c:594:66: note: passing argument to parameter 'dev0' here
static int sensor_device_set_delay(struct sensors_poll_device_t *dev0,
                                                                 ^
device/generic/goldfish/sensors/sensors_qemu.c:618:10: warning: unused parameter 'flags' [-Wunused-parameter]
     int flags,
         ^
device/generic/goldfish/sensors/sensors_qemu.c:620:14: warning: unused parameter 'max_report_latency_ns' [-Wunused-parameter]
     int64_t max_report_latency_ns) {
             ^
4 warnings generated.
[ 12% 9962/78705] target  C++: libGLESv2_emulation <= device/generic/goldfish-opengl/system/GLESv2/gl2.cpp
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:18:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:18:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:19:
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/GLESv2_enc/gl2_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:19:
In file included from device/generic/goldfish-opengl/system/GLESv2_enc/GL2Encoder.h:20:
device/generic/goldfish-opengl/shared/OpenglCodecCommon/GLClientState.h:149:13: warning: field 'element_array_buffer_binding' will be initialized after field 'attribState' [-Wreorder]
            element_array_buffer_binding(ibo),
            ^
In file included from device/generic/goldfish-opengl/system/GLESv2/gl2.cpp:24:
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: warning: struct 'HostConnection' was previously declared as a class [-Wmismatched-tags]
struct HostConnection;
^
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:112:7: note: previous use is here
class HostConnection
      ^
device/generic/goldfish-opengl/system/OpenglSystemCommon/ThreadInfo.h:24:1: note: did you mean class here?
struct HostConnection;
^~~~~~
class
7 warnings generated.
[ 12% 10003/78705] target  C: libFFTEm <= external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c
external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c:678:81: warning: for loop has empty body [-Wempty-body]
                        for( iL = ( sizeL >> 1 ); iL < sizeL && actArrL[ idxArrL[ iL ] ] >= 0; iL++ );
                                                                                                     ^
external/neven/Embedded/common/src/b_BitFeatureEm/LocalScanDetector.c:678:81: note: put the semicolon on a separate line to silence this warning
1 warning generated.
[ 12% 10006/78705] target  C++: gralloc.goldfish <= device/generic/goldfish-opengl/system/gralloc/gralloc.cpp
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:611:73: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
        ALOGD("%s: Creating ashmem region of size %lu\n", __FUNCTION__, ashmem_size);
                                                  ~~~                   ^~~~~~~~~~~
                                                  %d
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1099:18: warning: format specifies type 'int' but the argument has type 'intptr_t' (aka 'long') [-Wformat]
                 postCount, sw_read);
                 ^~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1193:53: warning: unused parameter 'usage' [-Wunused-parameter]
                        buffer_handle_t handle, int usage,
                                                    ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1420:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        open: gralloc_device_open
        ^~~~~
        .open = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1424:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    base: {
    ^~~~~
    .base = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1425:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        common: {
        ^~~~~~~
        .common = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1426:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            tag: HARDWARE_MODULE_TAG,
            ^~~~
            .tag = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1428:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            module_api_version: GRALLOC_MODULE_API_VERSION_0_2,
            ^~~~~~~~~~~~~~~~~~~
            .module_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1429:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            hal_api_version: 0,
            ^~~~~~~~~~~~~~~~
            .hal_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1437:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            id: GRALLOC_HARDWARE_MODULE_ID,
            ^~~
            .id = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1438:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            name: "Graphics Memory Allocator Module",
            ^~~~~
            .name = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1439:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            author: "The Android Open Source Project",
            ^~~~~~~
            .author = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1440:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            methods: &gralloc_module_methods,
            ^~~~~~~~
            .methods = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1441:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            dso: NULL,
            ^~~~
            .dso = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1442:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            reserved: {0, }
            ^~~~~~~~~
            .reserved = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1444:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        registerBuffer: gralloc_register_buffer,
        ^~~~~~~~~~~~~~~
        .registerBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1445:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unregisterBuffer: gralloc_unregister_buffer,
        ^~~~~~~~~~~~~~~~~
        .unregisterBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1446:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock: gralloc_lock,
        ^~~~~
        .lock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1447:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unlock: gralloc_unlock,
        ^~~~~~~
        .unlock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1448:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        perform: NULL,
        ^~~~~~~~
        .perform = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1450:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock_ycbcr: gralloc_lock_ycbcr,
        ^~~~~~~~~~~
        .lock_ycbcr = 
24 warnings generated.
[ 12% 10007/78705] target  C++: gralloc.ranchu <= device/generic/goldfish-opengl/system/gralloc/gralloc.cpp
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
In file included from device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:20:
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:41: warning: unused parameter 'data' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                               ^
device/generic/goldfish-opengl/system/renderControl_enc/renderControl_enc.h:22:56: warning: unused parameter 'sz' [-Wunused-parameter]
        virtual uint64_t lockAndWriteDma(void* data, uint32_t sz) { return 0; }
                                                              ^
In file included from device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:27:
device/generic/goldfish-opengl/system/OpenglSystemCommon/HostConnection.h:98:49: warning: format specifies type 'unsigned long long' but the argument has type 'uint64_t' (aka 'unsigned long') [-Wformat]
        ALOGV("%s: paddr=0x%llx", __FUNCTION__, paddr);
                           ~~~~                 ^~~~~
                           %lx
system/core/liblog/include/log/log_main.h:180:15: note: expanded from macro 'ALOGV'
      __ALOGV(__VA_ARGS__); \
              ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:175:56: note: expanded from macro '__ALOGV'
#define __ALOGV(...) ((void)ALOG(LOG_VERBOSE, LOG_TAG, __VA_ARGS__))
                                                       ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:611:73: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
        ALOGD("%s: Creating ashmem region of size %lu\n", __FUNCTION__, ashmem_size);
                                                  ~~~                   ^~~~~~~~~~~
                                                  %d
system/core/liblog/include/log/log_main.h:202:52: note: expanded from macro 'ALOGD'
#define ALOGD(...) ((void)ALOG(LOG_DEBUG, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1099:18: warning: format specifies type 'int' but the argument has type 'intptr_t' (aka 'long') [-Wformat]
                 postCount, sw_read);
                 ^~~~~~~~~
system/core/liblog/include/log/log_main.h:241:52: note: expanded from macro 'ALOGE'
#define ALOGE(...) ((void)ALOG(LOG_ERROR, LOG_TAG, __VA_ARGS__))
                                                   ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                                                  ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                                                    ^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1193:53: warning: unused parameter 'usage' [-Wunused-parameter]
                        buffer_handle_t handle, int usage,
                                                    ^
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1420:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        open: gralloc_device_open
        ^~~~~
        .open = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1424:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    base: {
    ^~~~~
    .base = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1425:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        common: {
        ^~~~~~~
        .common = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1426:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            tag: HARDWARE_MODULE_TAG,
            ^~~~
            .tag = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1428:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            module_api_version: GRALLOC_MODULE_API_VERSION_0_2,
            ^~~~~~~~~~~~~~~~~~~
            .module_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1429:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            hal_api_version: 0,
            ^~~~~~~~~~~~~~~~
            .hal_api_version = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1437:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            id: GRALLOC_HARDWARE_MODULE_ID,
            ^~~
            .id = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1438:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            name: "Graphics Memory Allocator Module",
            ^~~~~
            .name = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1439:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            author: "The Android Open Source Project",
            ^~~~~~~
            .author = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1440:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            methods: &gralloc_module_methods,
            ^~~~~~~~
            .methods = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1441:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            dso: NULL,
            ^~~~
            .dso = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1442:13: warning: use of GNU old-style field designator extension [-Wgnu-designator]
            reserved: {0, }
            ^~~~~~~~~
            .reserved = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1444:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        registerBuffer: gralloc_register_buffer,
        ^~~~~~~~~~~~~~~
        .registerBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1445:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unregisterBuffer: gralloc_unregister_buffer,
        ^~~~~~~~~~~~~~~~~
        .unregisterBuffer = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1446:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock: gralloc_lock,
        ^~~~~
        .lock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1447:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        unlock: gralloc_unlock,
        ^~~~~~~
        .unlock = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1448:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        perform: NULL,
        ^~~~~~~~
        .perform = 
device/generic/goldfish-opengl/system/gralloc/gralloc.cpp:1450:9: warning: use of GNU old-style field designator extension [-Wgnu-designator]
        lock_ycbcr: gralloc_lock_ycbcr,
        ^~~~~~~~~~~
        .lock_ycbcr = 
24 warnings generated.
[ 12% 10049/78705] target  C: libFFTEm <= external/neven/FaceRecEm/common/src/b_FDSDK/SDK.c
external/neven/FaceRecEm/common/src/b_FDSDK/SDK.c:209:42: warning: implicit conversion from enumeration type 'btk_Status' to different enumeration type 'btk_Error' [-Wenum-conversion]
        if( hsdkA->hidE != btk_HID_SDK )        return btk_STATUS_INVALID_HANDLE;
                                                ~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.
[ 13% 10707/78705] Check module type: out/target/product/generic_arm64/obj/SHARED_LIBRARIES/libreference-ril_intermediates/link_type
hardware/ril/reference-ril/Android.mk: warning: libreference-ril (native:platform) should not link to libril (partition:vendor)
[ 14% 11556/78705] Check Java library module types: out/target/common/obj/APPS/Dialer_intermediates/link_type
packages/apps/Dialer/Android.mk: warning: Dialer (java:system) should not link to libprotobuf-java-lite (java:platform)
[ 14% 11655/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-as_intermediates/hyph-as.hyb <- external/hyphenation-patterns/as//hyph-as.pat.txt
6 unique nodes, 73 total
[ 14% 11659/78705] target Java: volley (out/target/common/obj/JAVA_LIBRARIES/volley_intermediates/classes)
Note: external/volley/src/main/java/com/android/volley/RequestQueue.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 14% 11662/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-bn_intermediates/hyph-bn.hyb <- external/hyphenation-patterns/bn//hyph-bn.pat.txt
6 unique nodes, 73 total
[ 14% 11665/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-bg_intermediates/hyph-bg.hyb <- external/hyphenation-patterns/bg//hyph-bg.pat.txt
51 unique nodes, 1758 total
[ 14% 11674/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-da_intermediates/hyph-da.hyb <- external/hyphenation-patterns/da//hyph-da.pat.txt
602 unique nodes, 1676 total
[ 14% 11681/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-cy_intermediates/hyph-cy.hyb <- external/hyphenation-patterns/cy//hyph-cy.pat.txt
3290 unique nodes, 10601 total
[ 14% 11689/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-en-gb_intermediates/hyph-en-gb.hyb <- external/hyphenation-patterns/en-GB//hyph-en-gb.pat.txt
4348 unique nodes, 13922 total
[ 14% 11693/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-en-us_intermediates/hyph-en-us.hyb <- external/hyphenation-patterns/en-US//hyph-en-us.pat.txt
3507 unique nodes, 8500 total
[ 14% 11697/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-es_intermediates/hyph-es.hyb <- external/hyphenation-patterns/es//hyph-es.pat.txt
1622 unique nodes, 5831 total
[ 14% 11701/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-eu_intermediates/hyph-eu.hyb <- external/hyphenation-patterns/eu//hyph-eu.pat.txt
13 unique nodes, 232 total
[ 14% 11703/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-et_intermediates/hyph-et.hyb <- external/hyphenation-patterns/et//hyph-et.pat.txt
2043 unique nodes, 6198 total
[ 14% 11709/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-fr_intermediates/hyph-fr.hyb <- external/hyphenation-patterns/fr//hyph-fr.pat.txt
994 unique nodes, 3181 total
[ 14% 11713/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-gu_intermediates/hyph-gu.hyb <- external/hyphenation-patterns/gu//hyph-gu.pat.txt
6 unique nodes, 67 total
[ 14% 11717/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-hi_intermediates/hyph-hi.hyb <- external/hyphenation-patterns/hi//hyph-hi.pat.txt
6 unique nodes, 71 total
[ 14% 11721/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-ga_intermediates/hyph-ga.hyb <- external/hyphenation-patterns/ga//hyph-ga.pat.txt
3718 unique nodes, 10507 total
[ 14% 11723/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-hr_intermediates/hyph-hr.hyb <- external/hyphenation-patterns/hr//hyph-hr.pat.txt
98 unique nodes, 1640 total
[ 14% 11729/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-de-1996_intermediates/hyph-de-1996.hyb <- external/hyphenation-patterns/de//hyph-de-1996.pat.txt
8578 unique nodes, 29167 total
[ 14% 11732/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-cu_intermediates/hyph-cu.hyb <- external/hyphenation-patterns/cu//hyph-cu.pat.txt
2797 unique nodes, 19198 total
[ 14% 11735/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-hy_intermediates/hyph-hy.hyb <- external/hyphenation-patterns/hy//hyph-hy.pat.txt
6 unique nodes, 1640 total
[ 14% 11738/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-kn_intermediates/hyph-kn.hyb <- external/hyphenation-patterns/kn//hyph-kn.pat.txt
6 unique nodes, 74 total
[ 14% 11742/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-ml_intermediates/hyph-ml.hyb <- external/hyphenation-patterns/ml//hyph-ml.pat.txt
10 unique nodes, 89 total
[ 14% 11747/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-mr_intermediates/hyph-mr.hyb <- external/hyphenation-patterns/mr//hyph-mr.pat.txt
6 unique nodes, 71 total
[ 14% 11751/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-de-1901_intermediates/hyph-de-1901.hyb <- external/hyphenation-patterns/de//hyph-de-1901.pat.txt
8858 unique nodes, 29816 total
[ 14% 11754/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-mn-cyrl_intermediates/hyph-mn-cyrl.hyb <- external/hyphenation-patterns/mn//hyph-mn-cyrl.pat.txt
366 unique nodes, 1530 total
[ 14% 11759/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-or_intermediates/hyph-or.hyb <- external/hyphenation-patterns/or//hyph-or.pat.txt
6 unique nodes, 66 total
[ 14% 11762/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-de-ch-1901_intermediates/hyph-de-ch-1901.hyb <- external/hyphenation-patterns/de//hyph-de-ch-1901.pat.txt
8660 unique nodes, 29361 total
[ 14% 11764/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-pa_intermediates/hyph-pa.hyb <- external/hyphenation-patterns/pa//hyph-pa.pat.txt
6 unique nodes, 61 total
[ 14% 11770/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-pt_intermediates/hyph-pt.hyb <- external/hyphenation-patterns/pt//hyph-pt.pat.txt
33 unique nodes, 353 total
[ 14% 11774/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-ta_intermediates/hyph-ta.hyb <- external/hyphenation-patterns/ta//hyph-ta.pat.txt
9 unique nodes, 73 total
[ 14% 11778/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-te_intermediates/hyph-te.hyb <- external/hyphenation-patterns/te//hyph-te.pat.txt
6 unique nodes, 73 total
[ 14% 11782/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-sl_intermediates/hyph-sl.hyb <- external/hyphenation-patterns/sl//hyph-sl.pat.txt
657 unique nodes, 1598 total
[ 14% 11787/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-tk_intermediates/hyph-tk.hyb <- external/hyphenation-patterns/tk//hyph-tk.pat.txt
32 unique nodes, 2614 total
[ 14% 11797/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-und-ethi_intermediates/hyph-und-ethi.hyb <- external/hyphenation-patterns/Ethi//hyph-und-ethi.pat.txt
3 unique nodes, 424 total
[ 15% 12016/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-nn_intermediates/hyph-nn.hyb <- external/hyphenation-patterns/nn//hyph-nn.pat.txt
12585 unique nodes, 42861 total
[ 15% 12019/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-nb_intermediates/hyph-nb.hyb <- external/hyphenation-patterns/nb//hyph-nb.pat.txt
12585 unique nodes, 42861 total
[ 15% 12494/78705] target  C: nc <= external/netcat/netcat.c
external/netcat/netcat.c:323:8: warning: 'mktemp' is deprecated: mktemp is unsafe, use mkstemp or tmpfile instead [-Wdeprecated-declarations]
                        if (mktemp(unix_dg_tmp_socket_buf) == NULL)
                            ^
bionic/libc/include/stdlib.h:59:7: note: 'mktemp' has been explicitly marked deprecated here
char* mktemp(char*) __attribute__((deprecated("mktemp is unsafe, use mkstemp or tmpfile instead")));
      ^
external/netcat/netcat.c:800:39: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'int' [-Wsign-compare]
                                if (atomicio(vwrite, lfd, buf, n) != n)
                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
external/netcat/netcat.c:813:39: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'int' [-Wsign-compare]
                                if (atomicio(vwrite, nfd, buf, n) != n)
                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
3 warnings generated.
[ 15% 12509/78705] target  C: netserver <= external/netperf/src/netserver.c
external/netperf/src/netserver.c:602:5: warning: variable 'do_inet6' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    default:
    ^~~~~~~
external/netperf/src/netserver.c:607:9: note: uninitialized use occurs here
    if (do_inet6)
        ^~~~~~~~
external/netperf/src/netserver.c:570:15: note: initialize the variable 'do_inet6' to silence this warning
  int do_inet6;
              ^
               = 0
1 warning generated.
[ 15% 12511/78705] target  C: netperf <= external/netperf/src/netlib.c
external/netperf/src/netlib.c:2344:42: warning: incompatible pointer types passing 'netperf_cpu_set_t *' (aka 'unsigned long *') to parameter of type 'const cpu_set_t *' [-Wincompatible-pointer-types]
    if (sched_setaffinity(getpid(), len, &netperf_cpu_set)) {
                                         ^~~~~~~~~~~~~~~~
bionic/libc/include/sched.h:76:67: note: passing argument to parameter 'set' here
int sched_setaffinity(pid_t pid, size_t setsize, const cpu_set_t* set) __INTRODUCED_IN(12);
                                                                  ^
1 warning generated.
[ 15% 12517/78705] target  C: netperf <= external/netperf/src/nettest_bsd.c
external/netperf/src/nettest_bsd.c:4524:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
        if ((len >=0) || SOCKET_EINTR(len)) {
             ^~~
external/netperf/src/nettest_bsd.c:4153:10: note: initialize the variable 'len' to silence this warning
  int len;
         ^
          = 0
1 warning generated.
[ 15% 12531/78705] target  C: netserver <= external/netperf/src/netlib.c
external/netperf/src/netlib.c:2344:42: warning: incompatible pointer types passing 'netperf_cpu_set_t *' (aka 'unsigned long *') to parameter of type 'const cpu_set_t *' [-Wincompatible-pointer-types]
    if (sched_setaffinity(getpid(), len, &netperf_cpu_set)) {
                                         ^~~~~~~~~~~~~~~~
bionic/libc/include/sched.h:76:67: note: passing argument to parameter 'set' here
int sched_setaffinity(pid_t pid, size_t setsize, const cpu_set_t* set) __INTRODUCED_IN(12);
                                                                  ^
1 warning generated.
[ 15% 12542/78705] target  C: netserver <= external/netperf/src/nettest_bsd.c
external/netperf/src/nettest_bsd.c:4524:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
        if ((len >=0) || SOCKET_EINTR(len)) {
             ^~~
external/netperf/src/nettest_bsd.c:4153:10: note: initialize the variable 'len' to silence this warning
  int len;
         ^
          = 0
1 warning generated.
[ 15% 12552/78705] target  C: netperf <= external/netperf/src/nettest_omni.c
external/netperf/src/nettest_omni.c:3506:49: warning: passing 'int *' to parameter of type 'socklen_t *' (aka 'unsigned int *') converts between pointers to integer types with different sign [-Wpointer-sign]
                      protocol, TCP_CONGESTION, cong_control, &my_len) ==
                                                              ^~~~~~~
bionic/libc/include/sys/socket.h:308:61: note: passing argument to parameter here
__socketcall int getsockopt(int, int, int, void*, socklen_t*);
                                                            ^
external/netperf/src/nettest_omni.c:4004:8: warning: passing 'uint32_t *' (aka 'unsigned int *') to parameter of type 'int *' converts between pointers to integer types with different sign [-Wpointer-sign]
                                          &(omni_request->netperf_port));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/netperf/src/nettest_bsd.h:633:13: note: passing argument to parameter 'port' here
                                          int *port);
                                               ^
external/netperf/src/nettest_omni.c:4008:8: warning: passing 'uint32_t *' (aka 'unsigned int *') to parameter of type 'int *' converts between pointers to integer types with different sign [-Wpointer-sign]
                                          &(omni_request->data_port));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
external/netperf/src/nettest_bsd.h:633:13: note: passing argument to parameter 'port' here
                                          int *port);
                                               ^
external/netperf/src/nettest_omni.c:4369:4: warning: passing 'int *' to parameter of type 'socklen_t *' (aka 'unsigned int *') converts between pointers to integer types with different sign [-Wpointer-sign]
                        &remote_addr_len,
                        ^~~~~~~~~~~~~~~~
external/netperf/src/nettest_omni.c:3137:127: note: passing argument to parameter 'sourcelen' here
recv_data(SOCKET data_socket, struct ring_elt *recv_ring, uint32_t bytes_to_recv, struct sockaddr *source, netperf_socklen_t *sourcelen, uint32_t flags, uint32_t *num_receives) {
                                                                                                                              ^
4 warnings generated.
[ 16% 12643/78705] target  C: netserver <= external/netperf/src/nettest_omni.c
external/netperf/src/nettest_omni.c:3506:49: warning: passing 'int *' to parameter of type 'socklen_t *' (aka 'unsigned int *') converts between pointers to integer types with different sign [-Wpointer-sign]
                      protocol, TCP_CONGESTION, cong_control, &my_len) ==
                                                              ^~~~~~~
bionic/libc/include/sys/socket.h:308:61: note: passing argument to parameter here
__socketcall int getsockopt(int, int, int, void*, socklen_t*);
                                                            ^
external/netperf/src/nettest_omni.c:4004:8: warning: passing 'uint32_t *' (aka 'unsigned int *') to parameter of type 'int *' converts between pointers to integer types with different sign [-Wpointer-sign]
                                          &(omni_request->netperf_port));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
external/netperf/src/nettest_bsd.h:633:13: note: passing argument to parameter 'port' here
                                          int *port);
                                               ^
external/netperf/src/nettest_omni.c:4008:8: warning: passing 'uint32_t *' (aka 'unsigned int *') to parameter of type 'int *' converts between pointers to integer types with different sign [-Wpointer-sign]
                                          &(omni_request->data_port));
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
external/netperf/src/nettest_bsd.h:633:13: note: passing argument to parameter 'port' here
                                          int *port);
                                               ^
external/netperf/src/nettest_omni.c:4369:4: warning: passing 'int *' to parameter of type 'socklen_t *' (aka 'unsigned int *') converts between pointers to integer types with different sign [-Wpointer-sign]
                        &remote_addr_len,
                        ^~~~~~~~~~~~~~~~
external/netperf/src/nettest_omni.c:3137:127: note: passing argument to parameter 'sourcelen' here
recv_data(SOCKET data_socket, struct ring_elt *recv_ring, uint32_t bytes_to_recv, struct sockaddr *source, netperf_socklen_t *sourcelen, uint32_t flags, uint32_t *num_receives) {
                                                                                                                              ^
4 warnings generated.
[ 16% 12718/78705] Build hyb out/target/product/generic_arm64/obj/ETC/hyph-hu_intermediates/hyph-hu.hyb <- external/hyphenation-patterns/hu//hyph-hu.pat.txt
21515 unique nodes, 102669 total
[ 16% 12763/78705] target  C: sqlite3 <= external/sqlite/dist/shell.c
external/sqlite/dist/shell.c:4264:7: warning: unused parameter 'nVal' [-Wunused-parameter]
  int nVal, 
      ^
1 warning generated.
[ 28% 22469/78705] header-abi-dumper external/libchrome/base/trace_event/trace_event_synthetic_delay.cc ...p -Iexternal/libchrome -Iexternal/googletest/googletest/include -Iexternal/googletest/googletest/include^[ 32% 25437/78705] cc out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/android_arm64_armv8-a_static_core/obj/external/e2fsprogs/lib/blkid/probe.o
external/e2fsprogs/lib/blkid/probe.c:1484:44: warning: passing 'uint8_t [30]' to parameter of type 'const char *' converts between pointers to integer types with different sign [-Wpointer-sign]
        blkid_set_tag(probe->dev, "LABEL", label->name, label->length);
                                           ^~~~~~~~~~~
external/e2fsprogs/lib/blkid/blkidP.h:177:17: note: passing argument to parameter 'value' here
                         const char *value, const int vlength);
                                     ^
external/e2fsprogs/lib/blkid/probe.c:1489:14: warning: passing 'uuid_t' (aka 'unsigned char [16]') to parameter of type 'char *' converts between pointers to integer types with different sign [-Wpointer-sign]
    snprintf(uuid, sizeof (uuid), "%02hhX%02hhX-%02hhX%02hhX",
             ^~~~
bionic/libc/include/stdio.h:300:56: note: passing argument to parameter 'dest' here
int snprintf(char *__restrict const __pass_object_size dest,
                                                       ^
external/e2fsprogs/lib/blkid/probe.c:1470:71: warning: unused parameter 'id' [-Wunused-parameter]
static int probe_exfat(struct blkid_probe *probe, struct blkid_magic *id,
                                                                      ^
3 warnings generated.
[ 32% 25445/78705] cc out/soong/.intermediates/external/e2fsprogs/lib/blkid/libext2_blkid/linux_x86_64_static/obj/external/e2fsprogs/lib/blkid/probe.o
external/e2fsprogs/lib/blkid/probe.c:1484:44: warning: passing 'uint8_t [30]' to parameter of type 'const char *' converts between pointers to integer types with different sign [-Wpointer-sign]
        blkid_set_tag(probe->dev, "LABEL", label->name, label->length);
                                           ^~~~~~~~~~~
external/e2fsprogs/lib/blkid/blkidP.h:177:17: note: passing argument to parameter 'value' here
                         const char *value, const int vlength);
                                     ^
external/e2fsprogs/lib/blkid/probe.c:1489:14: warning: passing 'uuid_t' (aka 'unsigned char [16]') to parameter of type 'char *' converts between pointers to integer types with different sign [-Wpointer-sign]
    snprintf(uuid, sizeof (uuid), "%02hhX%02hhX-%02hhX%02hhX",
             ^~~~
prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.15-4.8/sysroot/usr/include/x86_64-linux-gnu/bits/stdio2.h:70:29: note: expanded from macro 'snprintf'
  __builtin___snprintf_chk (str, len, __USE_FORTIFY_LEVEL - 1, __bos (str), \
                            ^~~
external/e2fsprogs/lib/blkid/probe.c:1470:71: warning: unused parameter 'id' [-Wunused-parameter]
static int probe_exfat(struct blkid_probe *probe, struct blkid_magic *id,
                                                                      ^
3 warnings generated.
[ 40% 32123/78705] cc out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_x86_64_static/obj/lex/external/selinux/libsepol/cil/src/cil_lexer.o
out/soong/.intermediates/external/selinux/libsepol/libsepol/linux_x86_64_static/gen/lex/external/selinux/libsepol/cil/src/cil_lexer.c:1605:1: warning: function 'yy_fatal_error' could be declared with attribute 'noreturn' [-Wmissing-noreturn]
{
^
1 warning generated.
[ 40% 32180/78705] build out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/reqd_policy_mask.cil
out/host/linux-x86/bin/checkpolicy:  loading policy configuration from out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/reqd_policy_mask.conf
out/host/linux-x86/bin/checkpolicy:  policy configuration loaded
out/host/linux-x86/bin/checkpolicy:  writing CIL to out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/reqd_policy_mask.cil
[ 40% 32183/78705] build out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/plat_pub_policy.cil
out/host/linux-x86/bin/checkpolicy:  loading policy configuration from out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/plat_pub_policy.conf
out/host/linux-x86/bin/checkpolicy:  policy configuration loaded
out/host/linux-x86/bin/checkpolicy:  writing CIL to out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/plat_pub_policy.cil.tmp
[ 40% 32184/78705] build out/target/product/generic_arm64/obj/ETC/26.0.cil_intermediates/mapping/26.0.cil
Parsing out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/plat_pub_policy.cil
[ 40% 32190/78705] build out/target/product/generic_arm64/obj/ETC/nonplat_sepolicy.cil_intermediates/nonplat_policy_raw.cil
out/host/linux-x86/bin/checkpolicy:  loading policy configuration from out/target/product/generic_arm64/obj/ETC/nonplat_sepolicy.cil_intermediates/nonplat_policy.conf
out/host/linux-x86/bin/checkpolicy:  policy configuration loaded
out/host/linux-x86/bin/checkpolicy:  writing CIL to out/target/product/generic_arm64/obj/ETC/nonplat_sepolicy.cil_intermediates/nonplat_policy_raw.cil.tmp
[ 40% 32237/78705] build out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_sepolicy.cil
out/host/linux-x86/bin/checkpolicy:  loading policy configuration from out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_policy.conf
out/host/linux-x86/bin/checkpolicy:  policy configuration loaded
out/host/linux-x86/bin/checkpolicy:  writing CIL to out/target/product/generic_arm64/obj/ETC/plat_sepolicy.cil_intermediates/plat_sepolicy.cil
[ 40% 32240/78705] build out/target/product/generic_arm64/obj/ETC/nonplat_sepolicy.cil_intermediates/nonplat_sepolicy.cil
Parsing out/target/product/generic_arm64/obj/FAKE/selinux_policy_intermediates/plat_pub_policy.cil
Parsing out/target/product/generic_arm64/obj/ETC/nonplat_sepolicy.cil_intermediates/nonplat_policy_raw.cil
[ 41% 32420/78705] cc out/soong/.intermediates/external/skia/libskia/android_arm64_armv8-a_static_core/obj/external/skia/src/core/SkColorSpaceXformCanvas.o
external/skia/src/core/SkColorSpaceXformCanvas.cpp:41:38: warning: 'MakeFromIRect' is deprecated [-Wdeprecated-declarations]
        SkCanvas::onClipRect(SkRect::MakeFromIRect(fTarget->getDeviceClipBounds()),
                                     ^
external/skia/include/core/SkRect.h:433:41: note: 'MakeFromIRect' has been explicitly marked deprecated here
    static SkRect SK_WARN_UNUSED_RESULT MakeFromIRect(const SkIRect& irect) {
                                        ^
1 warning generated.
[ 42% 33075/78705] cc out/soong/.intermediates/external/skia/libskia/android_arm_armv7-a-neon_cortex-a15_static_core/obj/external/skia/src/core/SkColorSpaceXformCanvas.o
external/skia/src/core/SkColorSpaceXformCanvas.cpp:41:38: warning: 'MakeFromIRect' is deprecated [-Wdeprecated-declarations]
        SkCanvas::onClipRect(SkRect::MakeFromIRect(fTarget->getDeviceClipBounds()),
                                     ^
external/skia/include/core/SkRect.h:433:41: note: 'MakeFromIRect' has been explicitly marked deprecated here
    static SkRect SK_WARN_UNUSED_RESULT MakeFromIRect(const SkIRect& irect) {
                                        ^
1 warning generated.
[ 43% 33985/78705] host Java: conscrypt-host (out/host/common/obj/JAVA_LIBRARIES/conscrypt-host_intermediates/classes)
warning: [options] bootstrap class path not set in conjunction with -source 1.7
1 warning
[ 43% 34006/78705] target Java: conscrypt (out/target/common/obj/JAVA_LIBRARIES/conscrypt_intermediates/classes)
Note: external/conscrypt/platform/src/main/java/org/conscrypt/ct/CTLogStoreImpl.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 43% 34063/78705] target Java: org.apache.http.legacy.boot (out/target/common/obj/JAVA_LIBRARIES/org.apache.http.legacy.boot_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 43% 34184/78705] target Java: bouncycastle-nojarjar (out/target/common/obj/JAVA_LIBRARIES/bouncycastle-nojarjar_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 43% 34533/78705] Docs droiddoc: out/target/common/docs/apache-http-stubs-gen
external/apache-http/android/src/com/android/internal/http/multipart/Part.java:61: warning 113: Field com.android.internal.http.multipart.Part.BOUNDARY: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/android/src/com/android/internal/http/multipart/Part.java:67: warning 113: Field com.android.internal.http.multipart.Part.BOUNDARY_BYTES: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/android/src/com/android/internal/http/multipart/Part.java:128: warning 113: Method com.android.internal.http.multipart.Part.getBoundary: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/codec/language/Soundex.java:194: warning 113: Method org.apache.commons.codec.language.Soundex.getMaxLength: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/codec/language/Soundex.java:231: warning 113: Method org.apache.commons.codec.language.Soundex.setMaxLength: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/codec/net/URLCodec.java:356: warning 113: Method org.apache.commons.codec.net.URLCodec.getEncoding: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/logging/impl/LogFactoryImpl.java:513: warning 113: Method org.apache.commons.logging.impl.LogFactoryImpl.getLogClassName: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/logging/impl/LogFactoryImpl.java:538: warning 113: Method org.apache.commons.logging.impl.LogFactoryImpl.getLogConstructor: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/logging/impl/LogFactoryImpl.java:556: warning 113: Method org.apache.commons.logging.impl.LogFactoryImpl.isJdk13LumberjackAvailable: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/logging/impl/LogFactoryImpl.java:572: warning 113: Method org.apache.commons.logging.impl.LogFactoryImpl.isJdk14Available: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
external/apache-http/src/org/apache/commons/logging/impl/LogFactoryImpl.java:585: warning 113: Method org.apache.commons.logging.impl.LogFactoryImpl.isLog4JAvailable: @Deprecated annotation (not present) and @deprecated doc tag (present) do not match
DroidDoc took 3 sec. to write docs to out/target/common/docs/apache-http-stubs-gen
[ 44% 34645/78705] target Java: org.apache.http.legacy (out/target/common/obj/JAVA_LIBRARIES/org.apache.http.legacy_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: out/target/common/obj/JAVA_LIBRARIES/org.apache.http.legacy_intermediates/src/org/apache/http/impl/conn/tsccm/BasicPoolEntryRef.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 44% 34720/78705] cc out/soong/.intermediates/external/libusb/libusb/linux_x86_64_static/obj/external/libusb/libusb/os/linux_usbfs.o
external/libusb/libusb/os/linux_usbfs.c:809:8: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'int' [-Wsign-compare]
        len = MIN(len, r);
              ^   ~~~  ~
external/libusb/libusb/libusbi.h:155:24: note: expanded from macro 'MIN'
#define MIN(a, b)       ((a) < (b) ? (a) : (b))
                          ~  ^  ~
external/libusb/libusb/os/linux_usbfs.c:839:8: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'int' [-Wsign-compare]
        len = MIN(len, r);
              ^   ~~~  ~
external/libusb/libusb/libusbi.h:155:24: note: expanded from macro 'MIN'
#define MIN(a, b)       ((a) < (b) ? (a) : (b))
                          ~  ^  ~
2 warnings generated.
[ 44% 34897/78705] build out/target/common/obj/ETC/validate_framework_keymaps_intermediates/stamp
Validating file 'frameworks/base/data/keyboards/AVRCP.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Generic.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_0079_Product_0011.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_045e_Product_02d1.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_b501.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c216.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c219.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c21d.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c21f.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c294.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c299.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_046d_Product_c532.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_054c_Product_0268.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_0583_Product_2060.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_05ac_Product_0239.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_0b05_Product_4500.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1038_Product_1412.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_12bd_Product_d015.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1532_Product_0900.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1689_Product_fd00.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1689_Product_fd01.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1689_Product_fe00.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_18d1_Product_2c40.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_18d1_Product_5018.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1949_Product_0401.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1bad_Product_f016.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1bad_Product_f023.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1bad_Product_f027.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1bad_Product_f036.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_1d79_Product_0009.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_22b8_Product_093d.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_2378_Product_1008.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_2378_Product_100a.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/qwerty.kl'...
No errors.

Validating file 'frameworks/base/data/keyboards/Generic.kcm'...
No errors.

Validating file 'frameworks/base/data/keyboards/Vendor_18d1_Product_5018.kcm'...
No errors.

Validating file 'frameworks/base/data/keyboards/Virtual.kcm'...
No errors.

Validating file 'frameworks/base/data/keyboards/qwerty.kcm'...
No errors.

Validating file 'frameworks/base/data/keyboards/qwerty2.kcm'...
No errors.

Validating file 'frameworks/base/data/keyboards/AVRCP.idc'...
No errors.

Validating file 'frameworks/base/data/keyboards/qwerty.idc'...
No errors.

Validating file 'frameworks/base/data/keyboards/qwerty2.idc'...
No errors.

Success.
[ 44% 34900/78705] build out/target/common/obj/ETC/validate_input_devices_keymaps_intermediates/stamp
Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_arabic.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_belgian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_brazilian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_bulgarian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_croatian_and_slovenian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_czech.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_danish.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_uk.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_us.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_us_colemak.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_us_dvorak.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_us_intl.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_english_us_workman.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_estonian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_finnish.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_french.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_french_ca.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_german.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_greek.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_hebrew.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_hungarian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_icelandic.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_italian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_latvian_qwerty.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_lithuanian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_norwegian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_portuguese.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_russian.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_russian_mac.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_slovak.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_spanish.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_spanish_latin.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_swedish.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_swiss_french.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_swiss_german.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_turkish.kcm'...
No errors.

Validating file 'frameworks/base/packages/InputDevices/res/raw/keyboard_layout_ukrainian.kcm'...
No errors.

Success.
[ 44% 35175/78705] target thumb C++: camera.goldfish_32 <= device/generic/goldfish/camera/EmulatedCameraHal.cpp
device/generic/goldfish/camera/EmulatedCameraHal.cpp:32:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:33:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         tag:                HARDWARE_MODULE_TAG,
         ^~~~
         .tag = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:34:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         module_api_version: CAMERA_MODULE_API_VERSION_2_3,
         ^~~~~~~~~~~~~~~~~~~
         .module_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:35:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         hal_api_version:    HARDWARE_HAL_API_VERSION,
         ^~~~~~~~~~~~~~~~
         .hal_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:36:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         id:                 CAMERA_HARDWARE_MODULE_ID,
         ^~~
         .id = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:37:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         name:               "Emulated Camera Module",
         ^~~~~
         .name = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:38:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         author:             "The Android Open Source Project",
         ^~~~~~~
         .author = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:39:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         methods:            &android::EmulatedCameraFactory::mCameraModuleMethods,
         ^~~~~~~~
         .methods = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:40:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         dso:                NULL,
         ^~~~
         .dso = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:41:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         reserved:           {0},
         ^~~~~~~~~
         .reserved = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:43:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_number_of_cameras:  android::EmulatedCameraFactory::get_number_of_cameras,
    ^~~~~~~~~~~~~~~~~~~~~~
    .get_number_of_cameras = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:44:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_camera_info:        android::EmulatedCameraFactory::get_camera_info,
    ^~~~~~~~~~~~~~~~
    .get_camera_info = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:45:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    set_callbacks:          android::EmulatedCameraFactory::set_callbacks,
    ^~~~~~~~~~~~~~
    .set_callbacks = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:46:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_vendor_tag_ops:     android::EmulatedCameraFactory::get_vendor_tag_ops,
    ^~~~~~~~~~~~~~~~~~~
    .get_vendor_tag_ops = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:47:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open_legacy:            android::EmulatedCameraFactory::open_legacy
    ^~~~~~~~~~~~
    .open_legacy = 
15 warnings generated.
[ 44% 35176/78705] target thumb C++: camera.goldfish_32 <= device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp:26:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
1 warning generated.
[ 44% 35180/78705] target thumb C++: camera.goldfish_32 <= device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35181/78705] target thumb C++: camera.goldfish_32 <= device/generic/goldfish/camera/EmulatedCameraFactory.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:31:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
device/generic/goldfish/camera/EmulatedCameraFactory.cpp:561:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: EmulatedCameraFactory::device_open
    ^~~~~
    .open = 
4 warnings generated.
[ 44% 35191/78705] target thumb C++: camera.goldfish_32 <= device/generic/goldfish/camera/EmulatedQemuCamera.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35196/78705] target thumb C++: camera.ranchu_32 <= device/generic/goldfish/camera/EmulatedCameraHal.cpp
device/generic/goldfish/camera/EmulatedCameraHal.cpp:32:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:33:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         tag:                HARDWARE_MODULE_TAG,
         ^~~~
         .tag = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:34:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         module_api_version: CAMERA_MODULE_API_VERSION_2_3,
         ^~~~~~~~~~~~~~~~~~~
         .module_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:35:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         hal_api_version:    HARDWARE_HAL_API_VERSION,
         ^~~~~~~~~~~~~~~~
         .hal_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:36:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         id:                 CAMERA_HARDWARE_MODULE_ID,
         ^~~
         .id = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:37:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         name:               "Emulated Camera Module",
         ^~~~~
         .name = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:38:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         author:             "The Android Open Source Project",
         ^~~~~~~
         .author = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:39:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         methods:            &android::EmulatedCameraFactory::mCameraModuleMethods,
         ^~~~~~~~
         .methods = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:40:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         dso:                NULL,
         ^~~~
         .dso = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:41:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         reserved:           {0},
         ^~~~~~~~~
         .reserved = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:43:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_number_of_cameras:  android::EmulatedCameraFactory::get_number_of_cameras,
    ^~~~~~~~~~~~~~~~~~~~~~
    .get_number_of_cameras = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:44:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_camera_info:        android::EmulatedCameraFactory::get_camera_info,
    ^~~~~~~~~~~~~~~~
    .get_camera_info = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:45:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    set_callbacks:          android::EmulatedCameraFactory::set_callbacks,
    ^~~~~~~~~~~~~~
    .set_callbacks = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:46:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_vendor_tag_ops:     android::EmulatedCameraFactory::get_vendor_tag_ops,
    ^~~~~~~~~~~~~~~~~~~
    .get_vendor_tag_ops = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:47:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open_legacy:            android::EmulatedCameraFactory::open_legacy
    ^~~~~~~~~~~~
    .open_legacy = 
15 warnings generated.
[ 44% 35201/78705] target thumb C++: camera.ranchu_32 <= device/generic/goldfish/camera/EmulatedCameraFactory.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:31:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
device/generic/goldfish/camera/EmulatedCameraFactory.cpp:561:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: EmulatedCameraFactory::device_open
    ^~~~~
    .open = 
4 warnings generated.
[ 44% 35203/78705] target thumb C++: camera.ranchu_32 <= device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp:26:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
1 warning generated.
[ 44% 35207/78705] target thumb C++: camera.ranchu_32 <= device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35218/78705] target thumb C++: camera.ranchu_32 <= device/generic/goldfish/camera/EmulatedQemuCamera.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35241/78705] target  C++: camera.goldfish <= device/generic/goldfish/camera/EmulatedCameraHal.cpp
device/generic/goldfish/camera/EmulatedCameraHal.cpp:32:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:33:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         tag:                HARDWARE_MODULE_TAG,
         ^~~~
         .tag = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:34:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         module_api_version: CAMERA_MODULE_API_VERSION_2_3,
         ^~~~~~~~~~~~~~~~~~~
         .module_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:35:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         hal_api_version:    HARDWARE_HAL_API_VERSION,
         ^~~~~~~~~~~~~~~~
         .hal_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:36:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         id:                 CAMERA_HARDWARE_MODULE_ID,
         ^~~
         .id = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:37:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         name:               "Emulated Camera Module",
         ^~~~~
         .name = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:38:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         author:             "The Android Open Source Project",
         ^~~~~~~
         .author = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:39:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         methods:            &android::EmulatedCameraFactory::mCameraModuleMethods,
         ^~~~~~~~
         .methods = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:40:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         dso:                NULL,
         ^~~~
         .dso = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:41:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         reserved:           {0},
         ^~~~~~~~~
         .reserved = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:43:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_number_of_cameras:  android::EmulatedCameraFactory::get_number_of_cameras,
    ^~~~~~~~~~~~~~~~~~~~~~
    .get_number_of_cameras = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:44:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_camera_info:        android::EmulatedCameraFactory::get_camera_info,
    ^~~~~~~~~~~~~~~~
    .get_camera_info = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:45:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    set_callbacks:          android::EmulatedCameraFactory::set_callbacks,
    ^~~~~~~~~~~~~~
    .set_callbacks = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:46:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_vendor_tag_ops:     android::EmulatedCameraFactory::get_vendor_tag_ops,
    ^~~~~~~~~~~~~~~~~~~
    .get_vendor_tag_ops = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:47:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open_legacy:            android::EmulatedCameraFactory::open_legacy
    ^~~~~~~~~~~~
    .open_legacy = 
15 warnings generated.
[ 44% 35242/78705] target  C++: camera.goldfish <= device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp:26:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
1 warning generated.
[ 44% 35245/78705] target  C++: camera.goldfish <= device/generic/goldfish/camera/EmulatedCameraFactory.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:31:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
device/generic/goldfish/camera/EmulatedCameraFactory.cpp:561:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: EmulatedCameraFactory::device_open
    ^~~~~
    .open = 
4 warnings generated.
[ 44% 35251/78705] target  C++: camera.goldfish <= device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35259/78705] target  C++: camera.goldfish <= device/generic/goldfish/camera/EmulatedQemuCamera.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35267/78705] target  C++: camera.ranchu <= device/generic/goldfish/camera/EmulatedCameraHal.cpp
device/generic/goldfish/camera/EmulatedCameraHal.cpp:32:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    common: {
    ^~~~~~~
    .common = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:33:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         tag:                HARDWARE_MODULE_TAG,
         ^~~~
         .tag = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:34:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         module_api_version: CAMERA_MODULE_API_VERSION_2_3,
         ^~~~~~~~~~~~~~~~~~~
         .module_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:35:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         hal_api_version:    HARDWARE_HAL_API_VERSION,
         ^~~~~~~~~~~~~~~~
         .hal_api_version = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:36:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         id:                 CAMERA_HARDWARE_MODULE_ID,
         ^~~
         .id = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:37:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         name:               "Emulated Camera Module",
         ^~~~~
         .name = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:38:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         author:             "The Android Open Source Project",
         ^~~~~~~
         .author = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:39:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         methods:            &android::EmulatedCameraFactory::mCameraModuleMethods,
         ^~~~~~~~
         .methods = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:40:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         dso:                NULL,
         ^~~~
         .dso = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:41:10: warning: use of GNU old-style field designator extension [-Wgnu-designator]
         reserved:           {0},
         ^~~~~~~~~
         .reserved = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:43:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_number_of_cameras:  android::EmulatedCameraFactory::get_number_of_cameras,
    ^~~~~~~~~~~~~~~~~~~~~~
    .get_number_of_cameras = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:44:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_camera_info:        android::EmulatedCameraFactory::get_camera_info,
    ^~~~~~~~~~~~~~~~
    .get_camera_info = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:45:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    set_callbacks:          android::EmulatedCameraFactory::set_callbacks,
    ^~~~~~~~~~~~~~
    .set_callbacks = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:46:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    get_vendor_tag_ops:     android::EmulatedCameraFactory::get_vendor_tag_ops,
    ^~~~~~~~~~~~~~~~~~~
    .get_vendor_tag_ops = 
device/generic/goldfish/camera/EmulatedCameraHal.cpp:47:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open_legacy:            android::EmulatedCameraFactory::open_legacy
    ^~~~~~~~~~~~
    .open_legacy = 
15 warnings generated.
[ 44% 35271/78705] target  C++: camera.ranchu <= device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraHotplugThread.cpp:26:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
1 warning generated.
[ 44% 35272/78705] target  C++: camera.ranchu <= device/generic/goldfish/camera/EmulatedCameraFactory.cpp
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:26:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedCameraFactory.cpp:31:
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: warning: struct 'EmulatedCameraHotplugThread' was previously declared as a class [-Wmismatched-tags]
struct EmulatedCameraHotplugThread;
^
device/generic/goldfish/camera/EmulatedCameraHotplugThread.h:33:7: note: previous use is here
class EmulatedCameraHotplugThread : public Thread {
      ^
device/generic/goldfish/camera/EmulatedCameraFactory.h:26:1: note: did you mean class here?
struct EmulatedCameraHotplugThread;
^~~~~~
class
device/generic/goldfish/camera/EmulatedCameraFactory.cpp:561:5: warning: use of GNU old-style field designator extension [-Wgnu-designator]
    open: EmulatedCameraFactory::device_open
    ^~~~~
    .open = 
4 warnings generated.
[ 44% 35278/78705] target  C++: camera.ranchu <= device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCameraDevice.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 44% 35283/78705] target  C++: camera.ranchu <= device/generic/goldfish/camera/EmulatedQemuCamera.cpp
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.h:26:
device/generic/goldfish/camera/EmulatedQemuCameraDevice.h:55:14: warning: 'android::EmulatedQemuCameraDevice::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
    status_t Initialize(const char* device_name);
             ^
device/generic/goldfish/camera/EmulatedCameraDevice.h:125:22: note: hidden overloaded virtual function 'android::EmulatedCameraDevice::Initialize' declared here: different number of parameters (0 vs 1)
    virtual status_t Initialize();
                     ^
In file included from device/generic/goldfish/camera/EmulatedQemuCamera.cpp:25:
device/generic/goldfish/camera/EmulatedQemuCamera.h:46:15: warning: 'android::EmulatedQemuCamera::Initialize' hides overloaded virtual function [-Woverloaded-virtual]
     status_t Initialize(const char* device_name,
              ^
device/generic/goldfish/camera/EmulatedCamera.h:75:22: note: hidden overloaded virtual function 'android::EmulatedCamera::Initialize' declared here: different number of parameters (0 vs 3)
    virtual status_t Initialize();
                     ^
2 warnings generated.
[ 48% 37961/78705] target thumb C++: libttscompat_32 <= external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:312:55: warning: unused parameter 'env' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_setLowShelf(JNIEnv *env, jobject thiz, jboolean applyFilter,
                                                      ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:312:68: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_setLowShelf(JNIEnv *env, jobject thiz, jboolean applyFilter,
                                                                   ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:335:69: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_native_setup(JNIEnv *env, jobject thiz,
                                                                    ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:386:59: warning: unused parameter 'env' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_native_finalize(JNIEnv *env, jobject thiz, jlong jniData)
                                                          ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:386:72: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_native_finalize(JNIEnv *env, jobject thiz, jlong jniData)
                                                                       ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:405:76: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_isLanguageAvailable(JNIEnv *env, jobject thiz, jlong jniData,
                                                                           ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:433:68: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_setLanguage(JNIEnv *env, jobject thiz, jlong jniData,
                                                                   ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:464:69: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_loadLanguage(JNIEnv *env, jobject thiz, jlong jniData,
                                                                    ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:492:68: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_setProperty(JNIEnv *env, jobject thiz, jlong jniData,
                                                                   ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:520:62: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_speak(JNIEnv *env, jobject thiz, jlong jniData,
                                                             ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:554:48: warning: unused parameter 'env' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_stop(JNIEnv *env, jobject thiz, jlong jniData)
                                               ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:554:61: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_stop(JNIEnv *env, jobject thiz, jlong jniData)
                                                            ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:588:68: warning: unused parameter 'thiz' [-Wunused-parameter]
com_android_tts_compat_SynthProxy_getLanguage(JNIEnv *env, jobject thiz, jlong jniData)
                                                                   ^
external/svox/pico/compat/jni/com_android_tts_compat_SynthProxy.cpp:670:35: warning: unused parameter 'reserved' [-Wunused-parameter]
jint JNI_OnLoad(JavaVM* vm, void* reserved)
                                  ^
14 warnings generated.
[ 52% 41144/78705] Target cache fs image: out/target/product/generic_arm64/cache.img
Running:  mkuserimg.sh out/target/product/generic_arm64/cache out/target/product/generic_arm64/cache.img ext4 cache 69206016 -D out/target/product/generic_arm64/system -L cache out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin
make_ext4fs -T -1 -S out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin -L cache -l 69206016 -a cache out/target/product/generic_arm64/cache.img out/target/product/generic_arm64/cache out/target/product/generic_arm64/system
Creating filesystem with parameters:
    Size: 69206016
    Block size: 4096
    Blocks per group: 32768
    Inodes per group: 4224
    Inode size: 256
    Journal blocks: 1024
    Label: cache
    Blocks: 16896
    Block groups: 1
    Reserved block group size: 7
Created filesystem with 11/4224 inodes and 1302/16896 blocks
out/target/product/generic_arm64/cache.img maxsize=70654848 blocksize=2112 total=69206016 reserve=713856
[ 52% 41345/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...android/content/component_name.pb.cpp <= frameworks/base/core/proto/android/content/component_name.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41346/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...o/android/content/configuration.pb.cpp <= frameworks/base/core/proto/android/content/configuration.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41347/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...base/core/proto/android/content/locale.pb.cpp <= frameworks/base/core/proto/android/content/locale.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41348/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...works/base/core/proto/android/os/incident.pb.cpp <= frameworks/base/core/proto/android/os/incident.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41352/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...rameworks/base/core/proto/android/os/looper.pb.cpp <= frameworks/base/core/proto/android/os/looper.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41354/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...se/core/proto/android/os/messagequeue.pb.cpp <= frameworks/base/core/proto/android/os/messagequeue.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41355/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...meworks/base/core/proto/android/os/message.pb.cpp <= frameworks/base/core/proto/android/os/message.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41359/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...s/base/core/proto/android/os/worksource.pb.cpp <= frameworks/base/core/proto/android/os/worksource.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41360/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...ore/proto/android/service/appwidget.pb.cpp <= frameworks/base/core/proto/android/service/appwidget.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41364/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...proto/android/service/fingerprint.pb.cpp <= frameworks/base/core/proto/android/service/fingerprint.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41366/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...se/core/proto/android/service/battery.pb.cpp <= frameworks/base/core/proto/android/service/battery.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41367/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...ore/proto/android/service/diskstats.pb.cpp <= frameworks/base/core/proto/android/service/diskstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41369/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...o/android/service/graphicsstats.pb.cpp <= frameworks/base/core/proto/android/service/graphicsstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41372/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto.../core/proto/android/service/netstats.pb.cpp <= frameworks/base/core/proto/android/service/netstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41373/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...oto/android/service/notification.pb.cpp <= frameworks/base/core/proto/android/service/notification.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41376/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...se/core/proto/android/service/package.pb.cpp <= frameworks/base/core/proto/android/service/package.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41377/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...relesschargerdetector.pb.cpp <= frameworks/base/core/proto/android/service/wirelesschargerdetector.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41380/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto.../libs/incident/proto/android/privacy.pb.cpp <= frameworks/base/libs/incident/proto/android/privacy.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41382/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtrunks_generated_intermediates/proto/system/tpm/trunks/interface.pb.cc <= system/tpm/trunks/interface.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: system/tpm/trunks/interface.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 52% 41384/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...s/base/core/proto/android/service/power.pb.cpp <= frameworks/base/core/proto/android/service/power.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41387/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtpm_manager_generate...proto/system/tpm/tpm_manager/common/tpm_manager.pb.cc <= system/tpm/tpm_manager/common/tpm_manager.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: system/tpm/tpm_manager/common/tpm_manager.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 52% 41394/78705] Protoc: out/host/linux-x86/gen/SHARED_LIBRARIES/libplatformprotos_intermediates/proto...e/proto/android/providers/settings.pb.cpp <= frameworks/base/core/proto/android/providers/settings.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41433/78705] target Prebuilt: webview (out/target/product/generic_arm64/obj/APPS/webview_intermediates/package.apk)
Archive:  out/target/product/generic_arm64/obj/APPS/webview_intermediates/package.apk
  inflating: out/target/product/generic_arm64/obj/APPS/webview_intermediates/uncompressedlibs/lib/arm64-v8a/libwebviewchromium.so  
  inflating: out/target/product/generic_arm64/obj/APPS/webview_intermediates/uncompressedlibs/lib/armeabi-v7a/libwebviewchromium.so  
deleting: lib/arm64-v8a/libwebviewchromium.so
deleting: lib/armeabi-v7a/libwebviewchromium.so
  adding: lib/arm64-v8a/libwebviewchromium.so (stored 0%)
  adding: lib/armeabi-v7a/libwebviewchromium.so (stored 0%)
[ 52% 41484/78705] Protoc: out/target/product/generic_arm64/gen/SHARED_LIBRARIES/libkeystore_binder_inte.../proto/system/security/keystore/keystore_client.pb.cpp <= system/security/keystore/keystore_client.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: system/security/keystore/keystore_client.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 52% 41636/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...android/content/component_name.pb.cpp <= frameworks/base/core/proto/android/content/component_name.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41640/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...o/android/content/configuration.pb.cpp <= frameworks/base/core/proto/android/content/configuration.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41641/78705] Protoc: out/target/common/obj/JAVA_LIBRARIES/sap-api-java-static_intermediates/proto/Proto.stamp <= hardware/ril/librilutils/proto/sap-api.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: hardware/ril/librilutils/proto/sap-api.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 52% 41644/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...base/core/proto/android/content/locale.pb.cpp <= frameworks/base/core/proto/android/content/locale.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41646/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...rameworks/base/core/proto/android/os/looper.pb.cpp <= frameworks/base/core/proto/android/os/looper.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41649/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...works/base/core/proto/android/os/incident.pb.cpp <= frameworks/base/core/proto/android/os/incident.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41650/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...meworks/base/core/proto/android/os/message.pb.cpp <= frameworks/base/core/proto/android/os/message.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41654/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...se/core/proto/android/os/messagequeue.pb.cpp <= frameworks/base/core/proto/android/os/messagequeue.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41656/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...s/base/core/proto/android/os/worksource.pb.cpp <= frameworks/base/core/proto/android/os/worksource.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41659/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...ore/proto/android/service/appwidget.pb.cpp <= frameworks/base/core/proto/android/service/appwidget.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41660/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...se/core/proto/android/service/battery.pb.cpp <= frameworks/base/core/proto/android/service/battery.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41663/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...ore/proto/android/service/diskstats.pb.cpp <= frameworks/base/core/proto/android/service/diskstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41664/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...proto/android/service/fingerprint.pb.cpp <= frameworks/base/core/proto/android/service/fingerprint.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41667/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...o/android/service/graphicsstats.pb.cpp <= frameworks/base/core/proto/android/service/graphicsstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41668/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter.../core/proto/android/service/netstats.pb.cpp <= frameworks/base/core/proto/android/service/netstats.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41671/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...oto/android/service/notification.pb.cpp <= frameworks/base/core/proto/android/service/notification.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41673/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...e/proto/android/providers/settings.pb.cpp <= frameworks/base/core/proto/android/providers/settings.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41674/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...se/core/proto/android/service/package.pb.cpp <= frameworks/base/core/proto/android/service/package.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41677/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...relesschargerdetector.pb.cpp <= frameworks/base/core/proto/android/service/wirelesschargerdetector.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41678/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter.../libs/incident/proto/android/privacy.pb.cpp <= frameworks/base/libs/incident/proto/android/privacy.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 52% 41679/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libplatformprotos_inter...s/base/core/proto/android/service/power.pb.cpp <= frameworks/base/core/proto/android/service/power.proto
--include_source_info only makes sense when combined with --descriptor_set_out.
[ 54% 42512/78705] target  C++: libtextclassifier_protos <= out/target/product/generic_arm64/obj/STATIC_...xtclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp
In file included from out/target/product/generic_arm64/obj/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
In file included from external/protobuf/src/google/protobuf/map.h:34:
external/protobuf/src/google/protobuf/stubs/hash.h:187:29: warning: unused parameter 'key' [-Wunused-parameter]
  int operator()(const Key& key) {
                            ^
external/protobuf/src/google/protobuf/stubs/hash.h:201:30: warning: unused parameter 'key' [-Wunused-parameter]
  int operator()(const char* key) {
                             ^
external/protobuf/src/google/protobuf/stubs/hash.h:219:16: warning: unused parameter 'a' [-Wunused-parameter]
  hash_map(int a = 0, const HashFcn& b = HashFcn(),
               ^
external/protobuf/src/google/protobuf/stubs/hash.h:220:28: warning: unused parameter 'c' [-Wunused-parameter]
           const EqualKey& c = EqualKey(),
                           ^
In file included from out/target/product/generic_arm64/obj/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
In file included from external/protobuf/src/google/protobuf/map.h:43:
external/protobuf/src/google/protobuf/map_type_handler.h:76:39: warning: unused parameter 'value' [-Wunused-parameter]
  static inline void Initialize(Type& value, int default_enum_value) {}
                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:76:50: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
  static inline void Initialize(Type& value, int default_enum_value) {}
                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:301:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(DOUBLE  , Double)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:302:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FLOAT   , Float)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:303:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FIXED64 , Fixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:304:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FIXED32 , Fixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:305:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(SFIXED64, SFixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:306:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(SFIXED32, SFixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:307:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(BOOL    , Bool)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:346:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(DOUBLE  , Double)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:347:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FLOAT   , Float)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:348:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FIXED64 , Fixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:349:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FIXED32 , Fixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:350:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(SFIXED64, SFixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:351:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(SFIXED32, SFixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:352:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(BOOL    , Bool)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:471:26: warning: unused parameter 'arena' [-Wunused-parameter]
    Type** value, Arena* arena) {
                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:478:63: warning: unused parameter 'arena' [-Wunused-parameter]
                                                       Arena* arena,
                                                              ^
external/protobuf/src/google/protobuf/map_type_handler.h:479:60: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
                                                       int default_enum_value) {
                                                           ^
external/protobuf/src/google/protobuf/map_type_handler.h:484:41: warning: unused parameter 'arena' [-Wunused-parameter]
    const Type& from, Type** to, Arena* arena) {
                                        ^
external/protobuf/src/google/protobuf/map_type_handler.h:503:62: warning: unused parameter 'arena' [-Wunused-parameter]
                                                      Arena* arena) {
                                                             ^
external/protobuf/src/google/protobuf/map_type_handler.h:509:48: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
    InitializeMaybeByDefaultEnum(Type** x, int default_enum_value,
                                               ^
external/protobuf/src/google/protobuf/map_type_handler.h:510:41: warning: unused parameter 'arena' [-Wunused-parameter]
                                 Arena* arena) {
                                        ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_enum' [-Wunused-parameter]
STRING_OR_BYTES_HANDLER_FUNCTIONS(STRING)
^
external/protobuf/src/google/protobuf/map_type_handler.h:574:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                int default_enum) {            \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:589:70: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:593:35: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:600:58: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                     int default_enum_value,   \
                                                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:617:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:622:71: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_enum' [-Wunused-parameter]
STRING_OR_BYTES_HANDLER_FUNCTIONS(BYTES)
^
external/protobuf/src/google/protobuf/map_type_handler.h:574:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                int default_enum) {            \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:589:70: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:593:35: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:600:58: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                     int default_enum_value,   \
                                                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:617:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:622:71: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(INT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(UINT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(INT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(UINT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SINT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SINT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(ENUM)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(DOUBLE)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FLOAT)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FIXED64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FIXED32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SFIXED64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SFIXED32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(BOOL)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
In file included from out/target/product/generic_arm64/obj/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
external/protobuf/src/google/protobuf/map.h:592:49: warning: unused parameter 'hint' [-Wunused-parameter]
    pointer allocate(size_type n, const_pointer hint = 0) {
                                                ^
external/protobuf/src/google/protobuf/map.h:603:42: warning: unused parameter 'n' [-Wunused-parameter]
    void deallocate(pointer p, size_type n) {
                                         ^
209 warnings generated.
[ 54% 42557/78705] target thumb C++: libtextclassifier_protos_32 <= out/target/product/generic_arm64/obj...xtclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp
In file included from out/target/product/generic_arm64/obj_arm/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
In file included from external/protobuf/src/google/protobuf/map.h:34:
external/protobuf/src/google/protobuf/stubs/hash.h:187:29: warning: unused parameter 'key' [-Wunused-parameter]
  int operator()(const Key& key) {
                            ^
external/protobuf/src/google/protobuf/stubs/hash.h:201:30: warning: unused parameter 'key' [-Wunused-parameter]
  int operator()(const char* key) {
                             ^
external/protobuf/src/google/protobuf/stubs/hash.h:219:16: warning: unused parameter 'a' [-Wunused-parameter]
  hash_map(int a = 0, const HashFcn& b = HashFcn(),
               ^
external/protobuf/src/google/protobuf/stubs/hash.h:220:28: warning: unused parameter 'c' [-Wunused-parameter]
           const EqualKey& c = EqualKey(),
                           ^
In file included from out/target/product/generic_arm64/obj_arm/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
In file included from external/protobuf/src/google/protobuf/map.h:43:
external/protobuf/src/google/protobuf/map_type_handler.h:76:39: warning: unused parameter 'value' [-Wunused-parameter]
  static inline void Initialize(Type& value, int default_enum_value) {}
                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:76:50: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
  static inline void Initialize(Type& value, int default_enum_value) {}
                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:301:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(DOUBLE  , Double)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:302:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FLOAT   , Float)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:303:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FIXED64 , Fixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:304:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(FIXED32 , Fixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:305:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(SFIXED64, SFixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:306:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(SFIXED32, SFixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:307:1: warning: unused parameter 'value' [-Wunused-parameter]
FIXED_BYTE_SIZE(BOOL    , Bool)
^
external/protobuf/src/google/protobuf/map_type_handler.h:297:35: note: expanded from macro 'FIXED_BYTE_SIZE'
      const MapEntryAccessorType& value) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:346:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(DOUBLE  , Double)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:347:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FLOAT   , Float)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:348:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FIXED64 , Fixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:349:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(FIXED32 , Fixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:350:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(SFIXED64, SFixed64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:351:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(SFIXED32, SFixed32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:352:1: warning: unused parameter 'value' [-Wunused-parameter]
GET_FIXED_CACHED_SIZE(BOOL    , Bool)
^
external/protobuf/src/google/protobuf/map_type_handler.h:342:35: note: expanded from macro 'GET_FIXED_CACHED_SIZE'
      const MapEntryAccessorType& value) {                               \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:471:26: warning: unused parameter 'arena' [-Wunused-parameter]
    Type** value, Arena* arena) {
                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:478:63: warning: unused parameter 'arena' [-Wunused-parameter]
                                                       Arena* arena,
                                                              ^
external/protobuf/src/google/protobuf/map_type_handler.h:479:60: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
                                                       int default_enum_value) {
                                                           ^
external/protobuf/src/google/protobuf/map_type_handler.h:484:41: warning: unused parameter 'arena' [-Wunused-parameter]
    const Type& from, Type** to, Arena* arena) {
                                        ^
external/protobuf/src/google/protobuf/map_type_handler.h:503:62: warning: unused parameter 'arena' [-Wunused-parameter]
                                                      Arena* arena) {
                                                             ^
external/protobuf/src/google/protobuf/map_type_handler.h:509:48: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
    InitializeMaybeByDefaultEnum(Type** x, int default_enum_value,
                                               ^
external/protobuf/src/google/protobuf/map_type_handler.h:510:41: warning: unused parameter 'arena' [-Wunused-parameter]
                                 Arena* arena) {
                                        ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_enum' [-Wunused-parameter]
STRING_OR_BYTES_HANDLER_FUNCTIONS(STRING)
^
external/protobuf/src/google/protobuf/map_type_handler.h:574:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                int default_enum) {            \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:589:70: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:593:35: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:600:58: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                     int default_enum_value,   \
                                                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:617:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:625:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:622:71: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_enum' [-Wunused-parameter]
STRING_OR_BYTES_HANDLER_FUNCTIONS(BYTES)
^
external/protobuf/src/google/protobuf/map_type_handler.h:574:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                int default_enum) {            \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:589:70: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:593:35: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_enum_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:600:58: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                     int default_enum_value,   \
                                                         ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:617:53: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:626:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:622:71: note: expanded from macro 'STRING_OR_BYTES_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(INT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:707:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(UINT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:708:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(INT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:709:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(UINT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:710:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SINT64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:711:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SINT32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:712:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(ENUM)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:713:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(DOUBLE)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:714:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FLOAT)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:715:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FIXED64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:716:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(FIXED32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:717:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SFIXED64)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:718:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(SFIXED32)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:719:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
PRIMITIVE_HANDLER_FUNCTIONS(BOOL)
^
external/protobuf/src/google/protobuf/map_type_handler.h:640:27: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const TypeOnMemory& value) {                                             \
                          ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:645:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                            Type>::SpaceUsedInMap(const TypeOnMemory& value) { \
                                                                      ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:650:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:657:56: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                Arena* arena,                  \
                                                       ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:663:66: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      const MapEntryAccessorType& from, TypeOnMemory* to, Arena* arena) {      \
                                                                 ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'x' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:668:65: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::DeleteNoArena(TypeOnMemory& x) {}          \
                                                                ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:671:70: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::AssignDefaultValue(TypeOnMemory* value) {} \
                                                                     ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:675:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:683:61: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                     Arena* arena) {           \
                                                            ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'arena' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:690:35: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
      TypeOnMemory* value, Arena* arena) {                                     \
                                  ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'default_value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:699:53: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                                                    default_value) {           \
                                                    ^
external/protobuf/src/google/protobuf/map_type_handler.h:720:1: warning: unused parameter 'value' [-Wunused-parameter]
external/protobuf/src/google/protobuf/map_type_handler.h:704:71: note: expanded from macro 'PRIMITIVE_HANDLER_FUNCTIONS'
                             Type>::IsInitialized(const TypeOnMemory& value) { \
                                                                      ^
In file included from out/target/product/generic_arm64/obj_arm/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.cpp:5:
In file included from out/target/product/generic_arm64/gen/STATIC_LIBRARIES/libtextclassifier_protos_intermediates/proto/external/libtextclassifier/common/memory_image/data-store.pb.h:28:
external/protobuf/src/google/protobuf/map.h:592:49: warning: unused parameter 'hint' [-Wunused-parameter]
    pointer allocate(size_type n, const_pointer hint = 0) {
                                                ^
external/protobuf/src/google/protobuf/map.h:603:42: warning: unused parameter 'n' [-Wunused-parameter]
    void deallocate(pointer p, size_type n) {
                                         ^
209 warnings generated.
[ 54% 42577/78705] Protoc: out/target/product/generic_arm64/gen/SHARED_LIBRARIES/librilutils_intermediates/proto/hardware/ril/librilutils/proto/sap-api.pb.c <= hardware/ril/librilutils/proto/sap-api.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: hardware/ril/librilutils/proto/sap-api.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 54% 42751/78705] target  C++: libclearkeycasplugin <= frameworks/av/drm/mediacas/plugins/clearkey/ClearKeyFetcher.cpp
frameworks/av/drm/mediacas/plugins/clearkey/ClearKeyFetcher.cpp:92:63: warning: format specifies type 'unsigned long' but the argument has type '::google::protobuf::uint64' (aka 'unsigned long long') [-Wformat]
        ALOGW("Asset_id change from %" PRIu64 " to %" PRIu64, asset_.id(), *asset_id);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
system/core/liblog/include/log/log_main.h:228:51: note: expanded from macro 'ALOGW'
#define ALOGW(...) ((void)ALOG(LOG_WARN, LOG_TAG, __VA_ARGS__))
                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:307:67: note: expanded from macro 'ALOG'
#define ALOG(priority, tag, ...) LOG_PRI(ANDROID_##priority, tag, __VA_ARGS__)
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:71:69: note: expanded from macro 'LOG_PRI'
#define LOG_PRI(priority, tag, ...) android_printLog(priority, tag, __VA_ARGS__)
                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
system/core/liblog/include/log/log_main.h:62:34: note: expanded from macro 'android_printLog'
  __android_log_print(prio, tag, __VA_ARGS__)
                                 ^~~~~~~~~~~
1 warning generated.
[ 54% 42768/78705] Protoc: out/target/product/generic_arm64/gen/STATIC_LIBRARIES/librilutils_static_inte...diates/proto/hardware/ril/librilutils/proto/sap-api.pb.c <= hardware/ril/librilutils/proto/sap-api.proto
[libprotobuf WARNING external/protobuf/src/google/protobuf/compiler/parser.cc:547] No syntax specified for the proto file: hardware/ril/librilutils/proto/sap-api.proto. Please use 'syntax = "proto2";' or 'syntax = "proto3";' to specify a syntax version. (Defaulted to proto2 syntax.)
[ 54% 42774/78705] target  C: rild <= hardware/ril/rild/rild.c
In file included from hardware/ril/rild/rild.c:36:
hardware/ril/libril/../include/libril/ril_ex.h:25:38: warning: declaration of 'struct ril_event' will not be visible outside of this function [-Wvisibility]
void rilEventAddWakeup_helper(struct ril_event *ev);
                                     ^
1 warning generated.
[ 66% 52662/78705] AAPT2 link out/target/product/generic_arm64/obj/APPS/Bluetooth_intermediates/package-res.apk
packages/apps/Bluetooth/res/layout/bt_enabling_progress.xml:30: warn: generated id 'android:id/progress' for external package 'android'.
[ 67% 52898/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-af_strings.arsc.flat <- packages/apps/DeskClock/res/values-af/strings.xml
packages/apps/DeskClock/res/values-af/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-af/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-af/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52901/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-am_strings.arsc.flat <- packages/apps/DeskClock/res/values-am/strings.xml
packages/apps/DeskClock/res/values-am/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-am/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-am/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52903/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ar_strings.arsc.flat <- packages/apps/DeskClock/res/values-ar/strings.xml
packages/apps/DeskClock/res/values-ar/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ar/strings.xml:278: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ar/strings.xml:279: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52905/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...Clock/res/values-b+sr+Latn_strings.arsc.flat <- packages/apps/DeskClock/res/values-b+sr+Latn/strings.xml
packages/apps/DeskClock/res/values-b+sr+Latn/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-b+sr+Latn/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-b+sr+Latn/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52908/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-az_strings.arsc.flat <- packages/apps/DeskClock/res/values-az/strings.xml
packages/apps/DeskClock/res/values-az/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-az/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-az/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52910/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-be_strings.arsc.flat <- packages/apps/DeskClock/res/values-be/strings.xml
packages/apps/DeskClock/res/values-be/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-be/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-be/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52913/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-bg_strings.arsc.flat <- packages/apps/DeskClock/res/values-bg/strings.xml
packages/apps/DeskClock/res/values-bg/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bg/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bg/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52915/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-bn_strings.arsc.flat <- packages/apps/DeskClock/res/values-bn/strings.xml
packages/apps/DeskClock/res/values-bn/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bn/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bn/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52916/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-bs_strings.arsc.flat <- packages/apps/DeskClock/res/values-bs/strings.xml
packages/apps/DeskClock/res/values-bs/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bs/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-bs/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52918/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ca_strings.arsc.flat <- packages/apps/DeskClock/res/values-ca/strings.xml
packages/apps/DeskClock/res/values-ca/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ca/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ca/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52921/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-cs_strings.arsc.flat <- packages/apps/DeskClock/res/values-cs/strings.xml
packages/apps/DeskClock/res/values-cs/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-cs/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-cs/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52922/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-da_strings.arsc.flat <- packages/apps/DeskClock/res/values-da/strings.xml
packages/apps/DeskClock/res/values-da/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-da/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-da/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52924/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-de_strings.arsc.flat <- packages/apps/DeskClock/res/values-de/strings.xml
packages/apps/DeskClock/res/values-de/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-de/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-de/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52925/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-el_strings.arsc.flat <- packages/apps/DeskClock/res/values-el/strings.xml
packages/apps/DeskClock/res/values-el/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-el/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-el/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52928/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-en-rAU_strings.arsc.flat <- packages/apps/DeskClock/res/values-en-rAU/strings.xml
packages/apps/DeskClock/res/values-en-rAU/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rAU/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rAU/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52930/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-en-rGB_strings.arsc.flat <- packages/apps/DeskClock/res/values-en-rGB/strings.xml
packages/apps/DeskClock/res/values-en-rGB/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rGB/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rGB/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52933/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-en-rIN_strings.arsc.flat <- packages/apps/DeskClock/res/values-en-rIN/strings.xml
packages/apps/DeskClock/res/values-en-rIN/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rIN/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-en-rIN/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52934/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-es-rUS_strings.arsc.flat <- packages/apps/DeskClock/res/values-es-rUS/strings.xml
packages/apps/DeskClock/res/values-es-rUS/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-es-rUS/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-es-rUS/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52937/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-es_strings.arsc.flat <- packages/apps/DeskClock/res/values-es/strings.xml
packages/apps/DeskClock/res/values-es/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-es/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-es/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52938/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-et_strings.arsc.flat <- packages/apps/DeskClock/res/values-et/strings.xml
packages/apps/DeskClock/res/values-et/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-et/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-et/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52941/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-eu_strings.arsc.flat <- packages/apps/DeskClock/res/values-eu/strings.xml
packages/apps/DeskClock/res/values-eu/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-eu/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-eu/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52942/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-fa_strings.arsc.flat <- packages/apps/DeskClock/res/values-fa/strings.xml
packages/apps/DeskClock/res/values-fa/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fa/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fa/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52945/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-fr-rCA_strings.arsc.flat <- packages/apps/DeskClock/res/values-fr-rCA/strings.xml
packages/apps/DeskClock/res/values-fr-rCA/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fr-rCA/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fr-rCA/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52946/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-fi_strings.arsc.flat <- packages/apps/DeskClock/res/values-fi/strings.xml
packages/apps/DeskClock/res/values-fi/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fi/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fi/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52948/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-fr_strings.arsc.flat <- packages/apps/DeskClock/res/values-fr/strings.xml
packages/apps/DeskClock/res/values-fr/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fr/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-fr/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52950/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-gl_strings.arsc.flat <- packages/apps/DeskClock/res/values-gl/strings.xml
packages/apps/DeskClock/res/values-gl/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-gl/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-gl/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52954/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-gu_strings.arsc.flat <- packages/apps/DeskClock/res/values-gu/strings.xml
packages/apps/DeskClock/res/values-gu/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-gu/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-gu/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52959/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-hi_strings.arsc.flat <- packages/apps/DeskClock/res/values-hi/strings.xml
packages/apps/DeskClock/res/values-hi/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hi/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hi/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52960/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-hr_strings.arsc.flat <- packages/apps/DeskClock/res/values-hr/strings.xml
packages/apps/DeskClock/res/values-hr/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hr/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hr/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52962/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-hy_strings.arsc.flat <- packages/apps/DeskClock/res/values-hy/strings.xml
packages/apps/DeskClock/res/values-hy/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hy/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hy/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52963/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-hu_strings.arsc.flat <- packages/apps/DeskClock/res/values-hu/strings.xml
packages/apps/DeskClock/res/values-hu/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hu/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-hu/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52966/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-in_strings.arsc.flat <- packages/apps/DeskClock/res/values-in/strings.xml
packages/apps/DeskClock/res/values-in/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-in/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-in/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52968/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-is_strings.arsc.flat <- packages/apps/DeskClock/res/values-is/strings.xml
packages/apps/DeskClock/res/values-is/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-is/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-is/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52970/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-it_strings.arsc.flat <- packages/apps/DeskClock/res/values-it/strings.xml
packages/apps/DeskClock/res/values-it/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-it/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-it/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52973/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-iw_strings.arsc.flat <- packages/apps/DeskClock/res/values-iw/strings.xml
packages/apps/DeskClock/res/values-iw/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-iw/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-iw/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52975/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ja_strings.arsc.flat <- packages/apps/DeskClock/res/values-ja/strings.xml
packages/apps/DeskClock/res/values-ja/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ja/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ja/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52977/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ka_strings.arsc.flat <- packages/apps/DeskClock/res/values-ka/strings.xml
packages/apps/DeskClock/res/values-ka/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ka/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ka/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52978/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-kk_strings.arsc.flat <- packages/apps/DeskClock/res/values-kk/strings.xml
packages/apps/DeskClock/res/values-kk/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-kk/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-kk/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52981/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-km_strings.arsc.flat <- packages/apps/DeskClock/res/values-km/strings.xml
packages/apps/DeskClock/res/values-km/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-km/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-km/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52983/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-kn_strings.arsc.flat <- packages/apps/DeskClock/res/values-kn/strings.xml
packages/apps/DeskClock/res/values-kn/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-kn/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-kn/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52986/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ko_strings.arsc.flat <- packages/apps/DeskClock/res/values-ko/strings.xml
packages/apps/DeskClock/res/values-ko/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ko/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ko/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52987/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ky_strings.arsc.flat <- packages/apps/DeskClock/res/values-ky/strings.xml
packages/apps/DeskClock/res/values-ky/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ky/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ky/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52990/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-lo_strings.arsc.flat <- packages/apps/DeskClock/res/values-lo/strings.xml
packages/apps/DeskClock/res/values-lo/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lo/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lo/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52991/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-lt_strings.arsc.flat <- packages/apps/DeskClock/res/values-lt/strings.xml
packages/apps/DeskClock/res/values-lt/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lt/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lt/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52994/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-lv_strings.arsc.flat <- packages/apps/DeskClock/res/values-lv/strings.xml
packages/apps/DeskClock/res/values-lv/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lv/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-lv/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52996/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-mk_strings.arsc.flat <- packages/apps/DeskClock/res/values-mk/strings.xml
packages/apps/DeskClock/res/values-mk/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mk/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mk/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 52997/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ml_strings.arsc.flat <- packages/apps/DeskClock/res/values-ml/strings.xml
packages/apps/DeskClock/res/values-ml/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ml/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ml/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53001/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-mn_strings.arsc.flat <- packages/apps/DeskClock/res/values-mn/strings.xml
packages/apps/DeskClock/res/values-mn/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mn/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mn/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53002/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-mr_strings.arsc.flat <- packages/apps/DeskClock/res/values-mr/strings.xml
packages/apps/DeskClock/res/values-mr/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mr/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-mr/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53004/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ms_strings.arsc.flat <- packages/apps/DeskClock/res/values-ms/strings.xml
packages/apps/DeskClock/res/values-ms/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ms/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ms/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53005/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-my_strings.arsc.flat <- packages/apps/DeskClock/res/values-my/strings.xml
packages/apps/DeskClock/res/values-my/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-my/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-my/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53008/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-nb_strings.arsc.flat <- packages/apps/DeskClock/res/values-nb/strings.xml
packages/apps/DeskClock/res/values-nb/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-nb/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-nb/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53010/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ne_strings.arsc.flat <- packages/apps/DeskClock/res/values-ne/strings.xml
packages/apps/DeskClock/res/values-ne/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ne/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ne/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53012/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-nl_strings.arsc.flat <- packages/apps/DeskClock/res/values-nl/strings.xml
packages/apps/DeskClock/res/values-nl/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-nl/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-nl/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53014/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-pa_strings.arsc.flat <- packages/apps/DeskClock/res/values-pa/strings.xml
packages/apps/DeskClock/res/values-pa/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pa/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pa/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53016/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-pl_strings.arsc.flat <- packages/apps/DeskClock/res/values-pl/strings.xml
packages/apps/DeskClock/res/values-pl/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pl/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pl/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53019/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-pt_strings.arsc.flat <- packages/apps/DeskClock/res/values-pt/strings.xml
packages/apps/DeskClock/res/values-pt/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pt/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pt/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53021/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-pt-rPT_strings.arsc.flat <- packages/apps/DeskClock/res/values-pt-rPT/strings.xml
packages/apps/DeskClock/res/values-pt-rPT/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pt-rPT/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-pt-rPT/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53022/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ro_strings.arsc.flat <- packages/apps/DeskClock/res/values-ro/strings.xml
packages/apps/DeskClock/res/values-ro/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ro/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ro/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53023/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ru_strings.arsc.flat <- packages/apps/DeskClock/res/values-ru/strings.xml
packages/apps/DeskClock/res/values-ru/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ru/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ru/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53026/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-si_strings.arsc.flat <- packages/apps/DeskClock/res/values-si/strings.xml
packages/apps/DeskClock/res/values-si/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-si/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-si/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53029/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sk_strings.arsc.flat <- packages/apps/DeskClock/res/values-sk/strings.xml
packages/apps/DeskClock/res/values-sk/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sk/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sk/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53031/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sl_strings.arsc.flat <- packages/apps/DeskClock/res/values-sl/strings.xml
packages/apps/DeskClock/res/values-sl/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sl/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sl/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53032/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sq_strings.arsc.flat <- packages/apps/DeskClock/res/values-sq/strings.xml
packages/apps/DeskClock/res/values-sq/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sq/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sq/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53036/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sr_strings.arsc.flat <- packages/apps/DeskClock/res/values-sr/strings.xml
packages/apps/DeskClock/res/values-sr/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sr/strings.xml:251: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sr/strings.xml:252: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53037/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sv_strings.arsc.flat <- packages/apps/DeskClock/res/values-sv/strings.xml
packages/apps/DeskClock/res/values-sv/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sv/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sv/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53040/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-sw_strings.arsc.flat <- packages/apps/DeskClock/res/values-sw/strings.xml
packages/apps/DeskClock/res/values-sw/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sw/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-sw/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53051/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ta_strings.arsc.flat <- packages/apps/DeskClock/res/values-ta/strings.xml
packages/apps/DeskClock/res/values-ta/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ta/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ta/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53053/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-te_strings.arsc.flat <- packages/apps/DeskClock/res/values-te/strings.xml
packages/apps/DeskClock/res/values-te/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-te/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-te/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53055/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-th_strings.arsc.flat <- packages/apps/DeskClock/res/values-th/strings.xml
packages/apps/DeskClock/res/values-th/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-th/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-th/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53058/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-tl_strings.arsc.flat <- packages/apps/DeskClock/res/values-tl/strings.xml
packages/apps/DeskClock/res/values-tl/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-tl/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-tl/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53059/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-tr_strings.arsc.flat <- packages/apps/DeskClock/res/values-tr/strings.xml
packages/apps/DeskClock/res/values-tr/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-tr/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-tr/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53062/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-uk_strings.arsc.flat <- packages/apps/DeskClock/res/values-uk/strings.xml
packages/apps/DeskClock/res/values-uk/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-uk/strings.xml:260: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-uk/strings.xml:261: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53063/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-ur_strings.arsc.flat <- packages/apps/DeskClock/res/values-ur/strings.xml
packages/apps/DeskClock/res/values-ur/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ur/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-ur/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53067/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-uz_strings.arsc.flat <- packages/apps/DeskClock/res/values-uz/strings.xml
packages/apps/DeskClock/res/values-uz/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-uz/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-uz/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53072/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-vi_strings.arsc.flat <- packages/apps/DeskClock/res/values-vi/strings.xml
packages/apps/DeskClock/res/values-vi/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-vi/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-vi/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53073/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-zh-rCN_strings.arsc.flat <- packages/apps/DeskClock/res/values-zh-rCN/strings.xml
packages/apps/DeskClock/res/values-zh-rCN/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rCN/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rCN/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53078/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-zh-rHK_strings.arsc.flat <- packages/apps/DeskClock/res/values-zh-rHK/strings.xml
packages/apps/DeskClock/res/values-zh-rHK/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rHK/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rHK/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53079/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/DeskClock/res/values-zh-rTW_strings.arsc.flat <- packages/apps/DeskClock/res/values-zh-rTW/strings.xml
packages/apps/DeskClock/res/values-zh-rTW/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rTW/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zh-rTW/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53084/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...ages/apps/DeskClock/res/values-zu_strings.arsc.flat <- packages/apps/DeskClock/res/values-zu/strings.xml
packages/apps/DeskClock/res/values-zu/strings.xml:40: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zu/strings.xml:242: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values-zu/strings.xml:243: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 67% 53097/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/DeskClock_intermediates/flat-...s/packages/apps/DeskClock/res/values_strings.arsc.flat <- packages/apps/DeskClock/res/values/strings.xml
packages/apps/DeskClock/res/values/strings.xml:84: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values/strings.xml:591: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/DeskClock/res/values/strings.xml:592: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 69% 54491/78705] target R.java/Manifest.java: Email (out/target/common/obj/APPS/Email_intermediates/src/R.stamp)
warning: string 'account_folder_list_summary_drafts' has no default translation.
warning: string 'account_folder_list_summary_outbox' has no default translation.
warning: string 'account_folder_list_summary_starred' has no default translation.
warning: string 'done_action' has no default translation.
warning: string 'exchange_name' has no default translation.
warning: string 'next_action' has no default translation.
nothing matches overlay file notification_bg_normal.9.png, for flavor xxhdpi-v4
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor mdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor hdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xhdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xxhdpi-v4
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xxhdpi-v19
[ 71% 56360/78705] target R.java/Manifest.java: OpenWnn (out/target/common/obj/APPS/OpenWnn_intermediates/src/R.stamp)
warning: ignoring flag -c hdpi-v4. Use --preferred-density instead.
warning: ignoring flag -c hdpi-v4. Use --preferred-density instead.
[ 71% 56402/78705] target R.java/Manifest.java: CalendarProvider (out/target/common/obj/APPS/CalendarProvider_intermediates/src/R.stamp)
warning: string 'upgrade_msg' has no default translation.
[ 73% 58105/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/incallui/calllocation/impl/res/values/strings.xml
packages/apps/Dialer/java/com/android/incallui/calllocation/impl/res/values/strings.xml:10: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58743/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-af_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-af/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-af/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58745/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-am_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-am/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-am/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58746/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ar_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ar/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ar/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58747/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-az_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-az/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-az/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58748/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-b+sr+Latn/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-b+sr+Latn/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58749/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-be_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-be/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-be/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58750/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-bg_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-bg/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-bg/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58751/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-bn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-bn/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-bn/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58752/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-bs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-bs/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-bs/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58753/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ca_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ca/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ca/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58754/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-cs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-cs/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-cs/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58755/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-da_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-da/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-da/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58756/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-de_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-de/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-de/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58757/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-el_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-el/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-el/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58758/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...US_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-es-rUS/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-es-rUS/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58759/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...IN_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rIN/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rIN/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58760/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-es_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-es/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-es/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58761/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-et_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-et/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-et/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58762/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...AU_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rAU/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rAU/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58763/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...GB_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rGB/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-en-rGB/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58764/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-eu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-eu/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-eu/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58765/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-fa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-fa/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-fa/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58766/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...CA_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-fr-rCA/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-fr-rCA/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58767/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-fi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-fi/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-fi/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58768/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-gl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-gl/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-gl/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58769/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-fr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-fr/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-fr/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58770/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-gu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-gu/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-gu/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58771/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-hu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-hu/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-hu/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58772/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-hr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-hr/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-hr/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58773/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-hy_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-hy/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-hy/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58774/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-is_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-is/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-is/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58775/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-hi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-hi/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-hi/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58776/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-in_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-in/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-in/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58777/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-iw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-iw/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-iw/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58778/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-it_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-it/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-it/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58779/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ja_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ja/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ja/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58780/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-km_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-km/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-km/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58781/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ka_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ka/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ka/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58782/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-kk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-kk/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-kk/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58783/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-kn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-kn/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-kn/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58784/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ko_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ko/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ko/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58785/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ky_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ky/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ky/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58786/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-lo_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-lo/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-lo/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58787/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-lt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-lt/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-lt/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58788/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-lv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-lv/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-lv/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58789/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-mk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-mk/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-mk/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58790/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ml_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ml/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ml/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58791/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-mn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-mn/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-mn/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58792/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-mr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-mr/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-mr/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58793/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ms_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ms/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ms/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58794/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-nb_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-nb/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-nb/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58795/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-no_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-no/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-no/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58796/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-nl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-nl/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-nl/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58797/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ne_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ne/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ne/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58798/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-pa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-pa/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-pa/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58799/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-pl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-pl/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-pl/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58800/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...BR_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt-rBR/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt-rBR/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58801/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...PT_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt-rPT/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt-rPT/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58802/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-pt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-pt/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58803/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ro_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ro/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ro/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58804/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ru_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ru/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ru/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58805/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-si_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-si/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-si/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58806/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-my_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-my/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-my/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58807/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sk/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sk/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58808/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sl/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sl/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58809/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sw/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sw/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58810/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sv/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sv/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58811/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sr/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sr/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58812/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-sq_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-sq/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-sq/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58813/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-te_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-te/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-te/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58814/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ta_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ta/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ta/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58815/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-tr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-tr/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-tr/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58816/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-uz_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-uz/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-uz/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58817/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-tl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-tl/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-tl/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58818/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-th_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-th/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-th/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58819/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-uk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-uk/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-uk/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58820/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-ur_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-ur/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-ur/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58821/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-vi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-vi/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-vi/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58822/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...CN_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rCN/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rCN/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58824/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...HK_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rHK/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rHK/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58825/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...es/values_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values/strings.xml:22: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58827/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ues-zu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-zu/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-zu/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 74% 58829/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...TW_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rTW/strings.xml
packages/apps/Dialer/java/com/android/dialer/theme/res/values-zh-rTW/strings.xml:21: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59552/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-af/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-af/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-af/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-af/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-af/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59553/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ar/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ar/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ar/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ar/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ar/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59554/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-am/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-am/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-am/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-am/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-am/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59555/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-az/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-az/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-az/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-az/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-az/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59556/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res....arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-b+sr+Latn/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-b+sr+Latn/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-b+sr+Latn/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-b+sr+Latn/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-b+sr+Latn/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59557/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-be/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-be/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-be/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-be/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-be/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59558/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bg/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bg/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bg/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bg/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bg/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59559/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bn/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bn/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bn/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bn/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bn/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59560/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bs/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bs/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bs/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bs/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-bs/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59561/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ca/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ca/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ca/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ca/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ca/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59562/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-da/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-da/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-da/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-da/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-da/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59563/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-cs/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-cs/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-cs/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-cs/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-cs/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59564/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-de/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-de/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-de/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-de/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-de/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59565/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-el/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-el/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-el/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-el/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-el/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59566/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rAU/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rAU/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rAU/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rAU/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rAU/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59567/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rGB/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rGB/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rGB/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rGB/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rGB/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59568/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rIN/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rIN/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rIN/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rIN/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-en-rIN/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59569/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59570/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es-rUS/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es-rUS/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es-rUS/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es-rUS/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-es-rUS/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59571/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-et/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-et/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-et/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-et/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-et/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59572/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-eu/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-eu/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-eu/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-eu/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-eu/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59573/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fa/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fa/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fa/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fa/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fa/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59574/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fi/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fi/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fi/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fi/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fi/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59575/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59576/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gl/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gl/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gl/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gl/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gl/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59577/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr-rCA/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr-rCA/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr-rCA/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr-rCA/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-fr-rCA/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59578/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hr/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hr/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hr/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hr/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hr/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59579/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gu/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gu/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gu/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gu/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-gu/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59580/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hi/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hi/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hi/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hi/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hi/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59581/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hu/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hu/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hu/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hu/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hu/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59582/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hy/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hy/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hy/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hy/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-hy/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59583/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-in/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-in/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-in/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-in/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-in/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59584/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-is/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-is/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-is/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-is/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-is/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59585/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-it/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-it/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-it/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-it/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-it/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59586/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-iw/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-iw/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-iw/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-iw/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-iw/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59587/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ja/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ja/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ja/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ja/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ja/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59588/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ka/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ka/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ka/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ka/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ka/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59589/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ko/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ko/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ko/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ko/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ko/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59590/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kn/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kn/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kn/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kn/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kn/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59591/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kk/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kk/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kk/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kk/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-kk/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59592/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-km/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-km/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-km/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-km/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-km/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59593/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ky/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ky/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ky/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ky/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ky/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59594/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lo/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lo/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lo/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lo/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lo/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59595/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lt/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lt/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lt/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lt/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lt/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59596/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lv/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lv/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lv/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lv/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-lv/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59597/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mk/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mk/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mk/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mk/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mk/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59598/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ml/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ml/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ml/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ml/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ml/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59599/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mn/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mn/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mn/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mn/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mn/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59600/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mr/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mr/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mr/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mr/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-mr/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59601/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-my/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-my/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-my/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-my/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-my/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59602/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ms/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ms/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ms/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ms/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ms/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59603/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nb/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nb/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nb/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nb/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nb/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59604/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ne/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ne/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ne/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ne/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ne/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59605/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nl/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nl/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nl/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nl/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-nl/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59606/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-no/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-no/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-no/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-no/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-no/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59607/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pa/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pa/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pa/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pa/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pa/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59608/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pl/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pl/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pl/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pl/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pl/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59609/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rBR/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rBR/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rBR/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rBR/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rBR/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59610/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rPT/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rPT/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rPT/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rPT/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt-rPT/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59611/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-pt/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59612/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ro/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ro/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ro/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ro/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ro/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59613/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ru/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ru/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ru/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ru/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ru/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59614/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-si/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-si/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-si/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-si/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-si/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59615/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sk/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sk/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sk/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sk/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sk/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59616/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sl/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sl/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sl/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sl/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sl/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59617/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sq/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sq/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sq/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sq/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sq/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59618/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sv/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sv/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sv/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sv/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sv/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59619/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sr/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sr/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sr/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sr/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sr/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59620/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sw/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sw/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sw/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sw/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-sw/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59621/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ta/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ta/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ta/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ta/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ta/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59622/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-te/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-te/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-te/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-te/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-te/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59623/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tl/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tl/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tl/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tl/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tl/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59624/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-th/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-th/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-th/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-th/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-th/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59625/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uk/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uk/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uk/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uk/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uk/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59626/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tr/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tr/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tr/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tr/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-tr/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59627/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uz/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uz/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uz/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uz/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-uz/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59628/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ur/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ur/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ur/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ur/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-ur/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59629/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rCN/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rCN/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rCN/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rCN/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rCN/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59630/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rHK/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rHK/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rHK/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rHK/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rHK/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59631/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ngs.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rTW/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rTW/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rTW/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rTW/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zh-rTW/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59633/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-vi/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-vi/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-vi/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-vi/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-vi/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59634/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zu/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zu/strings.xml:35: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zu/strings.xml:36: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zu/strings.xml:37: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values-zu/strings.xml:38: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 75% 59637/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...es_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values/strings.xml
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values/strings.xml:68: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values/strings.xml:75: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values/strings.xml:82: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/dialer/calllogutils/res/values/strings.xml:89: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60257/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-eu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-eu/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-eu/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60270/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-am_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-am/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-am/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60273/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ar_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ar/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ar/strings.xml:105: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60274/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-af_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-af/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-af/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60275/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-az_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-az/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-az/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60277/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...n_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-b+sr+Latn/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-b+sr+Latn/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60278/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-bs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-bs/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-bs/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60279/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-be_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-be/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-be/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60280/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-bg_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-bg/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-bg/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60281/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-bn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-bn/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-bn/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60282/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ca_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ca/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ca/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60283/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-cs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-cs/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-cs/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60284/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-de_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-de/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-de/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60285/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-da_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-da/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-da/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60286/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-el_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-el/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-el/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60287/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rUS_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-es-rUS/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-es-rUS/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60288/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rAU_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rAU/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rAU/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60289/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rGB_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rGB/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rGB/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60290/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rIN_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rIN/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-en-rIN/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60291/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-es_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-es/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-es/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60292/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-fi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-fi/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-fi/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60293/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-et_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-et/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-et/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60294/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-fa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-fa/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-fa/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60295/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rCA_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-fr-rCA/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-fr-rCA/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60296/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-fr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-fr/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-fr/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60297/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-gl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-gl/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-gl/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60298/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-gu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-gu/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-gu/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60299/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-hi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-hi/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-hi/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60300/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-hy_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-hy/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-hy/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60301/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-hr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-hr/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-hr/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60302/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-hu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-hu/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-hu/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60303/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-in_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-in/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-in/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60304/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-is_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-is/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-is/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60305/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-it_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-it/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-it/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60306/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-iw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-iw/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-iw/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60307/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ka_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ka/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ka/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60308/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-kk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-kk/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-kk/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60309/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ja_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ja/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ja/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60310/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-km_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-km/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-km/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60311/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-lo_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-lo/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-lo/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60312/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-kn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-kn/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-kn/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60313/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ko_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ko/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ko/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60314/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ky_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ky/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ky/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60315/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-lv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-lv/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-lv/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60316/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-lt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-lt/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-lt/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60317/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-mk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-mk/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-mk/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60318/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ml_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ml/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ml/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60319/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ms_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ms/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ms/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60320/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-nb_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-nb/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-nb/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60321/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-mn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-mn/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-mn/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60322/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-my_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-my/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-my/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60323/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ne_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ne/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ne/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60324/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-mr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-mr/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-mr/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60325/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-nl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-nl/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-nl/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60326/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-no_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-no/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-no/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60327/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rPT_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-pt-rPT/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-pt-rPT/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60328/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rBR_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-pt-rBR/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-pt-rBR/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60329/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-pa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-pa/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-pa/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60330/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-pl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-pl/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-pl/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60331/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-pt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-pt/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-pt/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60332/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ru_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ru/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ru/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60333/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ro_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ro/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ro/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60334/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-si_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-si/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-si/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60335/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sk/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sk/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60336/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sl/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sl/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60337/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sq_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sq/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sq/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60338/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sv/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sv/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60339/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sw/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sw/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60340/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-sr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-sr/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-sr/strings.xml:102: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60341/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ta_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ta/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ta/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60342/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-th_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-th/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-th/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60343/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-te_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-te/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-te/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60344/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-tl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-tl/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-tl/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60345/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-tr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-tr/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-tr/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60346/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-uk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-uk/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-uk/strings.xml:103: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60347/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-uz_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-uz/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-uz/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60348/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rCN_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rCN/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rCN/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60349/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-ur_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-ur/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-ur/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60350/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-vi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-vi/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-vi/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60351/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rTW_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rTW/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rTW/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60352/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...alues-zu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-zu/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-zu/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60355/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-rHK_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rHK/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values-zh-rHK/strings.xml:101: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60362/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res.../res/values_strings.arsc.flat <- packages/apps/Dialer/java/com/android/dialer/app/res/values/strings.xml
packages/apps/Dialer/java/com/android/dialer/app/res/values/strings.xml:363: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60496/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-af_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-af/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-af/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-af/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60497/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-am_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-am/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-am/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-am/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60498/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ar_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ar/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ar/strings.xml:169: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ar/strings.xml:211: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60499/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-az_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-az/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-az/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-az/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60500/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-be_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-be/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-be/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-be/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60502/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...ings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-b+sr+Latn/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-b+sr+Latn/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-b+sr+Latn/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60503/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-bg_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-bg/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-bg/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-bg/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60505/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-bn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-bn/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-bn/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-bn/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60506/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ca_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ca/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ca/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ca/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60507/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-bs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-bs/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-bs/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-bs/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60508/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-cs_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-cs/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-cs/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-cs/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60509/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-da_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-da/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-da/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-da/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60510/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-de_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-de/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-de/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-de/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60511/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-el_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-el/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-el/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-el/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60512/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rGB/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rGB/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rGB/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60513/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rAU/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rAU/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rAU/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60514/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rIN/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rIN/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-en-rIN/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60515/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-es_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-es/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-es/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-es/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60516/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-et_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-et/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-et/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-et/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60517/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-fa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-fa/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-fa/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-fa/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60518/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-es-rUS/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-es-rUS/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-es-rUS/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60519/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-eu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-eu/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-eu/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-eu/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60520/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-fi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-fi/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-fi/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-fi/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60521/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-fr-rCA/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-fr-rCA/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-fr-rCA/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60522/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-fr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-fr/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-fr/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-fr/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60523/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-gl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-gl/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-gl/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-gl/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60524/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-gu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-gu/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-gu/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-gu/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60525/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-hi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-hi/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-hi/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-hi/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60526/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-hr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-hr/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-hr/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-hr/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60527/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-in_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-in/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-in/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-in/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60528/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-hu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-hu/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-hu/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-hu/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60529/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-hy_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-hy/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-hy/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-hy/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60530/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-is_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-is/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-is/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-is/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60531/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-iw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-iw/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-iw/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-iw/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60532/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-it_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-it/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-it/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-it/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60534/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-kn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-kn/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-kn/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-kn/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60535/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ja_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ja/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ja/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ja/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60536/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-km_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-km/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-km/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-km/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60537/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-kk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-kk/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-kk/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-kk/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60538/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ka_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ka/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ka/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ka/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60541/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ky_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ky/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ky/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ky/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60542/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ko_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ko/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ko/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ko/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60543/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-lt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-lt/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-lt/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-lt/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60544/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-lo_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-lo/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-lo/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-lo/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60545/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-lv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-lv/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-lv/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-lv/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60546/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ml_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ml/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ml/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ml/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60547/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-mr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-mr/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-mr/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-mr/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60548/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-mn_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-mn/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-mn/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-mn/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60549/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ms_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ms/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ms/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ms/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60550/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-my_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-my/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-my/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-my/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60551/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-mk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-mk/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-mk/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-mk/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60552/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ne_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ne/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ne/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ne/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60553/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-nl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-nl/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-nl/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-nl/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60554/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-nb_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-nb/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-nb/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-nb/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60555/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-no_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-no/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-no/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-no/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60556/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-pa_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-pa/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-pa/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-pa/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60557/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-pl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-pl/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-pl/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-pl/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60558/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rBR/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rBR/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rBR/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60559/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rPT/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rPT/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt-rPT/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60560/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-pt_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-pt/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-pt/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60561/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ro_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ro/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ro/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ro/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60562/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ru_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ru/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ru/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ru/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60563/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sk/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sk/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sk/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60564/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-si_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-si/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-si/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-si/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60565/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sl/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sl/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sl/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60566/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sq_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sq/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sq/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sq/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60567/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sr/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sr/strings.xml:166: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sr/strings.xml:208: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60568/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sw_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sw/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sw/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sw/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60570/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-sv_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-sv/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-sv/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-sv/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60575/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ta_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ta/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ta/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ta/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60576/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-te_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-te/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-te/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-te/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60577/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-th_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-th/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-th/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-th/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60578/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-tr_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-tr/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-tr/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-tr/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60579/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-uk_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-uk/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-uk/strings.xml:167: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-uk/strings.xml:209: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60580/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-tl_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-tl/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-tl/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-tl/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60581/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-uz_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-uz/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-uz/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-uz/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60582/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-ur_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-ur/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-ur/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-ur/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60584/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-vi_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-vi/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-vi/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-vi/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60585/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rHK/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rHK/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rHK/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60587/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rCN/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rCN/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rCN/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60588/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...-zu_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-zu/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-zu/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-zu/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60591/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rTW/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rTW/strings.xml:165: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values-zh-rTW/strings.xml:207: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 76% 60598/78705] AAPT2 compile out/target/product/generic_arm64/obj/APPS/Dialer_intermediates/flat-res...values_strings.arsc.flat <- packages/apps/Dialer/java/com/android/contacts/common/res/values/strings.xml
packages/apps/Dialer/java/com/android/contacts/common/res/values/strings.xml:431: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
packages/apps/Dialer/java/com/android/contacts/common/res/values/strings.xml:595: warn: multiple substitutions specified in non-positional format; did you mean to add the formatted="false" attribute?.
[ 77% 60835/78705] target Java: framework (out/target/common/obj/JAVA_LIBRARIES/framework_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61087/78705] target Java: android.hidl.base-V1.0-java-static (out/target/common/obj/JAVA_LIBRARIES/android.hidl.base-V1.0-java-static_intermediates/classes)
Note: out/target/common/gen/JAVA_LIBRARIES/android.hidl.base-V1.0-java-static_intermediates/android/hidl/base/V1_0/DebugInfo.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61089/78705] target Java: android.hidl.base-V1.0-java (out/target/common/obj/JAVA_LIBRARIES/android.hidl.base-V1.0-java_intermediates/classes)
Note: out/target/common/gen/JAVA_LIBRARIES/android.hidl.base-V1.0-java_intermediates/android/hidl/base/V1_0/DebugInfo.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61092/78705] target Java: legacy-test (out/target/common/obj/JAVA_LIBRARIES/legacy-test_intermediates/classes)
Note: frameworks/base/legacy-test/src/android/test/AndroidTestCase.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 77% 61094/78705] target Java: ims-common (out/target/common/obj/JAVA_LIBRARIES/ims-common_intermediates/classes)
Note: frameworks/opt/net/ims/src/java/com/android/ims/ImsUt.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61097/78705] target Java: voip-common (out/target/common/obj/JAVA_LIBRARIES/voip-common_intermediates/classes)
Note: frameworks/opt/net/voip/src/java/com/android/server/sip/SipService.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: frameworks/opt/net/voip/src/java/com/android/server/sip/SipService.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61120/78705] target Java: android.hidl.manager-V1.0-java (out/target/common/obj/JAVA_LIBRARIES/android.hidl.manager-V1.0-java_intermediates/classes)
Note: out/target/common/gen/JAVA_LIBRARIES/android.hidl.manager-V1.0-java_intermediates/android/hidl/manager/V1_0/IServiceManager.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 77% 61310/78705] target Java: libprotobuf-java-lite (out/target/common/obj/JAVA_LIBRARIES/libprotobuf-java-lite_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: external/protobuf/java/core/src/main/java/com/google/protobuf/GeneratedMessageLite.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 78% 61397/78705] target Java: android.hardware.radio-V1.0-java-static (out/target/common/obj/JAVA_LIBRARIES/android.hardware.radio-V1.0-java-static_intermediates/classes)
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 78% 62024/78705] target Java: icu4j (out/target/common/obj/JAVA_LIBRARIES/icu4j_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: external/icu/icu4j/main/classes/core/src/com/ibm/icu/impl/Relation.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 79% 62653/78705] target Java: telephony-common (out/target/common/obj/JAVA_LIBRARIES/telephony-common_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 79% 62718/78705] AAPT2 link out/target/product/generic_arm64/obj/APPS/PackageInstaller_intermediates/package-res.apk
packages/apps/PackageInstaller/res/layout-watch/wear_review_permission_title_pref.xml:23: warn: generated id 'android:id/icon' for external package 'android'.
packages/apps/PackageInstaller/res/layout-watch/wear_review_permission_action_pref.xml:17: warn: generated id 'android:id/title' for external package 'android'.
[ 80% 63262/78705] Docs droiddoc: out/target/common/docs/test-api-stubs
DroidDoc took 38 sec. to write docs to out/target/common/docs/test-api-stubs
[ 80% 63265/78705] Docs droiddoc: out/target/common/docs/api-stubs
DroidDoc took 40 sec. to write docs to out/target/common/docs/api-stubs
[ 80% 63266/78705] Docs droiddoc: out/target/common/docs/system-api-stubs
frameworks/base/core/java/android/app/WallpaperManager.java:1361: lint: Method 'setDisplayPadding' must be protected with a system permission; it currently allows non-system callers holding [android.permission.SET_WALLPAPER_HINTS] [125]
frameworks/base/core/java/android/app/WallpaperManager.java:1384: lint: Method 'setDisplayOffset' must be protected with a system permission. [125]
frameworks/base/core/java/android/app/WallpaperManager.java:1402: lint: Method 'clearWallpaper' must be protected with a system permission; it currently allows non-system callers holding [android.permission.SET_WALLPAPER] [125]
frameworks/base/core/java/android/app/WallpaperManager.java:1415: lint: Method 'clearWallpaper' must be protected with a system permission; it currently allows non-system callers holding [android.permission.SET_WALLPAPER] [125]
frameworks/base/core/java/android/app/admin/DevicePolicyManager.java:4968: lint: Method 'getProfileOwner' must be protected with a system permission. [125]
frameworks/base/core/java/android/app/admin/DevicePolicyManager.java:5646: lint: Method 'getPermittedAccessibilityServices' must be protected with a system permission. [125]
frameworks/base/core/java/android/app/admin/DevicePolicyManager.java:5747: lint: Method 'getPermittedInputMethodsForCurrentUser' must be protected with a system permission. [125]
frameworks/base/core/java/android/app/admin/DevicePolicyManager.java:7565: lint: Method 'getUserProvisioningState' must be protected with a system permission. [125]
frameworks/base/core/java/android/app/admin/DevicePolicyManager.java:7705: lint: Method 'isDeviceProvisioned' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:3969: lint: Method 'queryBroadcastReceiversAsUser' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:4757: lint: Method 'getIntentVerificationStatusAsUser' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:4797: lint: Method 'getIntentFilterVerifications' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:4812: lint: Method 'getAllIntentFilters' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:4826: lint: Method 'getDefaultBrowserPackageNameAsUser' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:5715: lint: Method 'getInstantAppResolverSettingsComponent' must be protected with a system permission. [125]
frameworks/base/core/java/android/content/pm/PackageManager.java:5725: lint: Method 'getInstantAppInstallerComponent' must be protected with a system permission. [125]
frameworks/base/core/java/android/hardware/SensorManager.java:1801: lint: Method 'initDataInjection' must be protected with a system permission. [125]
frameworks/base/core/java/android/hardware/SensorManager.java:1835: lint: Method 'injectSensorData' must be protected with a system permission. [125]
frameworks/base/core/java/android/hardware/radio/RadioManager.java:1315: lint: Method 'listModules' must be protected with a system permission. [125]
frameworks/base/core/java/android/hardware/radio/RadioManager.java:1331: lint: Method 'openTuner' must be protected with a system permission. [125]
frameworks/base/core/java/android/net/ConnectivityManager.java:1092: lint: Method 'getCaptivePortalServerUrl' must be protected with a system permission. [125]
frameworks/base/core/java/android/net/ConnectivityManager.java:2051: lint: Method 'isTetheringSupported' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_NETWORK_STATE] [125]
frameworks/base/core/java/android/net/ConnectivityManager.java:2083: lint: Method 'startTethering' must be protected with a system permission. [125]
frameworks/base/core/java/android/net/NetworkScoreManager.java:229: lint: Method 'getActiveScorerPackage' must be protected with a system permission. [125]
frameworks/base/core/java/android/os/PowerManager.java:854: lint: Method 'isScreenBrightnessBoosted' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:557: lint: Method 'addPrintServicesChangeListener' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:592: lint: Method 'removePrintServicesChangeListener' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:634: lint: Method 'getPrintServices' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:659: lint: Method 'addPrintServiceRecommendationsChangeListener' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:695: lint: Method 'removePrintServiceRecommendationsChangeListener' must be protected with a system permission. [125]
frameworks/base/core/java/android/print/PrintManager.java:734: lint: Method 'getPrintServiceRecommendations' must be protected with a system permission. [125]
frameworks/base/core/java/android/service/persistentdata/PersistentDataBlockManager.java:133: lint: Method 'getMaximumDataBlockSize' must be protected with a system permission. [125]
frameworks/base/core/java/android/view/accessibility/AccessibilityManager.java:1065: lint: Method 'isAccessibilityButtonSupported' must be protected with a system permission. [125]
frameworks/base/location/java/android/location/LocationManager.java:832: lint: Method 'requestLocationUpdates' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_COARSE_LOCATION, android.permission.ACCESS_FINE_LOCATION] [125]
frameworks/base/location/java/android/location/LocationManager.java:861: lint: Method 'requestLocationUpdates' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_COARSE_LOCATION, android.permission.ACCESS_FINE_LOCATION] [125]
frameworks/base/media/java/android/media/AudioManager.java:2378: lint: Method 'requestAudioFocus' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/AudioManager.java:2417: lint: Method 'requestAudioFocus' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/AudioManager.java:2475: lint: Method 'requestAudioFocus' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/AudioManager.java:2572: lint: Method 'dispatchAudioFocusChange' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/AudioManager.java:2623: lint: Method 'abandonAudioFocus' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/AudioManager.java:3831: lint: Method 'isHdmiSystemAudioSupported' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/tv/TvInputManager.java:1335: lint: Method 'getBlockedRatings' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/tv/TvInputManager.java:1390: lint: Method 'getTvContentRatingSystemList' must be protected with a system permission. [125]
frameworks/base/media/java/android/media/tv/TvInputManager.java:1554: lint: Method 'isSingleSessionActive' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:722: lint: Method 'getConnectionManager' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:744: lint: Method 'getPhoneAccountsSupportingScheme' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:862: lint: Method 'getAllPhoneAccountsCount' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:880: lint: Method 'getAllPhoneAccounts' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:898: lint: Method 'getAllPhoneAccountHandles' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:1194: lint: Method 'getCallState' must be protected with a system permission. [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:1216: lint: Method 'isRinging' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:1318: lint: Method 'isTtySupported' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telecomm/java/android/telecom/TelecomManager.java:1403: lint: Method 'addNewUnknownCall' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:1241: lint: Method 'getCurrentPhoneType' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:1256: lint: Method 'getCurrentPhoneType' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:4936: lint: Method 'getCarrierPackageNamesForIntent' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:4942: lint: Method 'getCarrierPackageNamesForIntentAndPhone' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:4986: lint: Method 'call' must be protected with a system permission; it currently allows non-system callers holding [android.permission.CALL_PHONE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:4999: lint: Method 'endCall' must be protected with a system permission; it currently allows non-system callers holding [android.permission.CALL_PHONE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5040: lint: Method 'isOffhook' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5057: lint: Method 'isRinging' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5074: lint: Method 'isIdle' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5091: lint: Method 'isRadioOn' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5376: lint: Method 'isDataConnectivityPossible' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5389: lint: Method 'needsOtaServiceProvisioning' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5439: lint: Method 'getDataEnabled' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5472: lint: Method 'getDataEnabled' must be protected with a system permission. [125]
frameworks/base/telephony/java/android/telephony/TelephonyManager.java:5527: lint: Method 'isVideoCallingEnabled' must be protected with a system permission; it currently allows non-system callers holding [android.permission.READ_PHONE_STATE] [125]
frameworks/base/wifi/java/android/net/wifi/RttManager.java:315: lint: Method 'getRttCapabilities' must be protected with a system permission. [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:1425: lint: Method 'isPortableHotspotSupported' must be protected with a system permission. [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:1434: lint: Method 'isWifiScannerSupported' must be protected with a system permission. [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:1451: lint: Method 'isDeviceToDeviceRttSupported' must be protected with a system permission. [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:1459: lint: Method 'isDeviceToApRttSupported' must be protected with a system permission. [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:2070: lint: Method 'getWifiApState' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_WIFI_STATE] [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:2087: lint: Method 'isWifiApEnabled' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_WIFI_STATE] [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:2099: lint: Method 'getWifiApConfiguration' must be protected with a system permission; it currently allows non-system callers holding [android.permission.ACCESS_WIFI_STATE] [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:2115: lint: Method 'setWifiApConfiguration' must be protected with a system permission; it currently allows non-system callers holding [android.permission.CHANGE_WIFI_STATE] [125]
frameworks/base/wifi/java/android/net/wifi/WifiManager.java:2790: lint: Method 'connect' must be protected with a system permission. [125]
DroidDoc took 42 sec. to write docs to out/target/common/docs/system-api-stubs
[ 80% 63296/78705] Compiling SDK Stubs: out/target/common/obj/JAVA_LIBRARIES/android_stubs_current_intermediates/classes.jar
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 80% 63298/78705] Compiling SDK Stubs: out/target/common/obj/JAVA_LIBRARIES/android_system_stubs_current_intermediates/classes.jar
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 80% 63306/78705] target Package: OpenWnn (out/target/product/generic_arm64/obj/APPS/OpenWnn_intermediates/package.apk)
warning: ignoring flag -c hdpi-v4. Use --preferred-density instead.
warning: ignoring flag -c hdpi-v4. Use --preferred-density instead.
[ 80% 63558/78705] target Package: Email (out/target/product/generic_arm64/obj/APPS/Email_intermediates/package.apk)
warning: string 'account_folder_list_summary_drafts' has no default translation.
warning: string 'account_folder_list_summary_drafts' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: string 'account_folder_list_summary_outbox' has no default translation.
warning: string 'account_folder_list_summary_outbox' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: string 'account_folder_list_summary_starred' has no default translation.
warning: string 'account_folder_list_summary_starred' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: string 'done_action' has no default translation.
warning: string 'done_action' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: string 'exchange_name' has no default translation.
warning: string 'exchange_name' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: string 'next_action' has no default translation.
warning: string 'next_action' is missing 92 required localizations: af_ZA am_ET ar_EG az_AZ be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
warning: no entries written for string/next_action (0x7f0902da)
warning: no entries written for string/done_action (0x7f0902db)
warning: no entries written for string/account_folder_list_summary_starred (0x7f0902dc)
warning: no entries written for string/account_folder_list_summary_drafts (0x7f0902dd)
warning: no entries written for string/account_folder_list_summary_outbox (0x7f0902de)
warning: no entries written for string/exchange_name (0x7f0902df)
warning: no entries written for plurals/message_view_attachment_bytes (0x7f110015)
warning: no entries written for plurals/message_view_attachment_kilobytes (0x7f110016)
warning: no entries written for plurals/message_view_attachment_megabytes (0x7f110017)
warning: no entries written for plurals/message_view_attachment_gigabytes (0x7f110018)
nothing matches overlay file notification_bg_normal.9.png, for flavor xxhdpi-v4
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor mdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor hdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xhdpi-v19
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xxhdpi-v4
nothing matches overlay file notification_bg_normal_pressed.9.png, for flavor xxhdpi-v19
[ 81% 64011/78705] target Package: CalendarProvider (out/target/product/generic_arm64/obj/APPS/CalendarProvider_intermediates/package.apk)
warning: string 'upgrade_msg' has no default translation.
warning: string 'upgrade_msg' is missing 91 required localizations: af_ZA am_ET ar_EG be_BY bg_BG bn_BD bs_BA ca_ES cs_CZ da_DK de_AT de_CH de_DE de_LI el_GR en_AU en_CA en_GB en_IN en_NZ en_SG en_US eo_EU es_ES es_US et_EE eu_ES fa_IR fi_FI fr_BE fr_CA fr_CH fr_FR gl_ES gu_IN hi_IN hr_HR hu_HU hy_AM in_ID is_IS it_CH it_IT iw_IL ja_JP ka_GE kk_KZ km_KH kn_IN ko_KR ky_KG lo_LA lt_LT lv_LV mk_MK ml_IN mn_MN mr_IN ms_MY my_MM nb_NO ne_NP nl_BE nl_NL pa_IN pl_PL pt_BR pt_PT ro_RO ru_RU si_LK sk_SK sl_SI sq_AL sr_Latn_RS sr_RS sv_SE sw_TZ ta_IN te_IN th_TH tl_PH tr_TR uk_UA ur_PK uz_UZ vi_VN zh_CN zh_HK zh_TW zu_ZA
[ 81% 64030/78705] target Java: android-support-v7-cardview (out/target/common/obj/JAVA_LIBRARIES/android-support-v7-cardview_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 81% 64034/78705] target Java: android-support-compat (out/target/common/obj/JAVA_LIBRARIES/android-support-compat_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64041/78705] target Java: android-support-media-compat (out/target/common/obj/JAVA_LIBRARIES/android-support-media-compat_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64042/78705] target Java: android-support-core-utils (out/target/common/obj/JAVA_LIBRARIES/android-support-core-utils_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 81% 64046/78705] target Java: android-support-core-ui (out/target/common/obj/JAVA_LIBRARIES/android-support-core-ui_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 81% 64049/78705] target Java: android-support-vectordrawable (out/target/common/obj/JAVA_LIBRARIES/android-support-vectordrawable_intermediates/classes)
Note: frameworks/support/graphics/drawable/static/src/android/support/graphics/drawable/VectorDrawableCompat.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 81% 64050/78705] target Java: android-support-fragment (out/target/common/obj/JAVA_LIBRARIES/android-support-fragment_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: frameworks/support/fragment/java/android/support/v4/app/FragmentManager.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64052/78705] target Java: android-support-v7-recyclerview (out/target/common/obj/JAVA_LIBRARIES/android-support-v7-recyclerview_intermediates/classes)
Note: frameworks/support/v7/recyclerview/src/android/support/v7/widget/RecyclerView.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64064/78705] target Java: android-support-v13 (out/target/common/obj/JAVA_LIBRARIES/android-support-v13_intermediates/classes)
Note: frameworks/support/v13/java/android/support/v13/app/FragmentStatePagerAdapter.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[ 81% 64069/78705] target Java: android-support-v7-appcompat (out/target/common/obj/JAVA_LIBRARIES/android-support-v7-appcompat_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64074/78705] target Java: android-support-design (out/target/common/obj/JAVA_LIBRARIES/android-support-design_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 81% 64163/78705] target Java: Dialer (out/target/common/obj/APPS/Dialer_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
Note: Some input files use unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
[ 88% 69950/78705] versioner preprocess 
warning: attempted to generate guard with empty availability: obsoleted = 23
warning: attempted to generate guard with empty availability: obsoleted = 21
Preprocessing out/soong/ndk/sysroot/usr/include/sys/swap.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/fsuid.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/quota.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/personality.h...
Preprocessing out/soong/ndk/sysroot/usr/include/arpa/nameser.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/msg.h...
Preprocessing out/soong/ndk/sysroot/usr/include/wchar.h...
Preprocessing out/soong/ndk/sysroot/usr/include/malloc.h...
Preprocessing out/soong/ndk/sysroot/usr/include/utmp.h...
Preprocessing out/soong/ndk/sysroot/usr/include/bits/wctype.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/inotify.h...
Preprocessing out/soong/ndk/sysroot/usr/include/arpa/inet.h...
Preprocessing out/soong/ndk/sysroot/usr/include/inttypes.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/xattr.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/endian.h...
Preprocessing out/soong/ndk/sysroot/usr/include/pthread.h...
Preprocessing out/soong/ndk/sysroot/usr/include/stdio.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/resource.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/uio.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/time.h...
Preprocessing out/soong/ndk/sysroot/usr/include/ftw.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/signalfd.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/statvfs.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/vfs.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/timerfd.h...
Preprocessing out/soong/ndk/sysroot/usr/include/ifaddrs.h...
Preprocessing out/soong/ndk/sysroot/usr/include/strings.h...
Preprocessing out/soong/ndk/sysroot/usr/include/bits/strcasecmp.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/auxv.h...
Preprocessing out/soong/ndk/sysroot/usr/include/netinet/ether.h...
Preprocessing out/soong/ndk/sysroot/usr/include/bits/lockf.h...
Preprocessing out/soong/ndk/sysroot/usr/include/poll.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/sysinfo.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/epoll.h...
Preprocessing out/soong/ndk/sysroot/usr/include/mntent.h...
Preprocessing out/soong/ndk/sysroot/usr/include/pwd.h...
Preprocessing out/soong/ndk/sysroot/usr/include/grp.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/mman.h...
Preprocessing out/soong/ndk/sysroot/usr/include/time.h...
Preprocessing out/soong/ndk/sysroot/usr/include/error.h...
Preprocessing out/soong/ndk/sysroot/usr/include/dlfcn.h...
Preprocessing out/soong/ndk/sysroot/usr/include/wctype.h...
Preprocessing out/soong/ndk/sysroot/usr/include/uchar.h...
Preprocessing out/soong/ndk/sysroot/usr/include/string.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/sem.h...
Preprocessing out/soong/ndk/sysroot/usr/include/search.h...
Preprocessing out/soong/ndk/sysroot/usr/include/nl_types.h...
Preprocessing out/soong/ndk/sysroot/usr/include/android/set_abort_message.h...
Preprocessing out/soong/ndk/sysroot/usr/include/android/dlext.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/shm.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/select.h...
Preprocessing out/soong/ndk/sysroot/usr/include/dirent.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sched.h...
Preprocessing out/soong/ndk/sysroot/usr/include/complex.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/timex.h...
Preprocessing out/soong/ndk/sysroot/usr/include/netdb.h...
Preprocessing out/soong/ndk/sysroot/usr/include/pty.h...
Preprocessing out/soong/ndk/sysroot/usr/include/setjmp.h...
Preprocessing out/soong/ndk/sysroot/usr/include/android/legacy_signal_inlines.h...
Preprocessing out/soong/ndk/sysroot/usr/include/unistd.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/stat.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/sendfile.h...
Preprocessing out/soong/ndk/sysroot/usr/include/link.h...
Preprocessing out/soong/ndk/sysroot/usr/include/stdio_ext.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/system_properties.h...
Preprocessing out/soong/ndk/sysroot/usr/include/stdlib.h...
Preprocessing out/soong/ndk/sysroot/usr/include/locale.h...
Preprocessing out/soong/ndk/sysroot/usr/include/ctype.h...
Preprocessing out/soong/ndk/sysroot/usr/include/sys/socket.h...
Preprocessing out/soong/ndk/sysroot/usr/include/langinfo.h...
Preprocessing out/soong/ndk/sysroot/usr/include/net/if.h...
Preprocessing out/soong/ndk/sysroot/usr/include/fcntl.h...
Preprocessing out/soong/ndk/sysroot/usr/include/math.h...
Preprocessing out/soong/ndk/sysroot/usr/include/signal.h...
[ 88% 70024/78705] target  C++: libjni_tinyplanet <= packages/apps/Camera2/jni/tinyplanet.cc
packages/apps/Camera2/jni/tinyplanet.cc:133:105: warning: unused parameter 'obj' [-Wunused-parameter]
JNIEXPORT void JNICALL Java_com_android_camera_tinyplanet_TinyPlanetNative_process(JNIEnv* env, jobject obj, jobject bitmap_in, jint width, jint height, jobject bitmap_out, jint output_size, jfloat scale, jfloat angle)
                                                                                                        ^
1 warning generated.
[ 89% 70049/78705] target  C++: libjni_jpegstream <= packages/apps/Gallery2/jni_jpegstream/src/jpeg_hook.cpp
packages/apps/Gallery2/jni_jpegstream/src/jpeg_hook.cpp:124:34: warning: comparison of integers of different signs: 'size_t' (aka 'unsigned long') and 'long' [-Wsign-compare]
    if (src->mgr.bytes_in_buffer >= num_bytes) {
        ~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~
packages/apps/Gallery2/jni_jpegstream/src/jpeg_hook.cpp:152:43: warning: unused parameter 'cinfo' [-Wunused-parameter]
void Mgr_term_source_fcn(j_decompress_ptr cinfo) {
                                          ^
2 warnings generated.
[ 89% 70052/78705] target  C++: libjni_jpegstream <= packages/apps/Gallery2/jni_jpegstream/src/jpegstream.cpp
packages/apps/Gallery2/jni_jpegstream/src/jpegstream.cpp:326:35: warning: unused parameter 'reserved' [-Wunused-parameter]
jint JNI_OnLoad(JavaVM* vm, void* reserved) {
                                  ^
1 warning generated.
[ 89% 70053/78705] target  C++: libjni_jpegutil <= packages/apps/Camera2/jni/jpegutilnative.cpp
packages/apps/Camera2/jni/jpegutilnative.cpp:70:25: warning: unused parameter 'clazz' [-Wunused-parameter]
    JNIEnv* env, jclass clazz,
                        ^
packages/apps/Camera2/jni/jpegutilnative.cpp:119:25: warning: unused parameter 'clazz' [-Wunused-parameter]
    JNIEnv* env, jclass clazz, jint width, jint height, jobject planeBuf,
                        ^
2 warnings generated.
[ 89% 70058/78705] target  C++: libjni_jpegutil <= packages/apps/Camera2/jni/jpegutil.cpp
packages/apps/Camera2/jni/jpegutil.cpp:233:45: warning: unused parameter 'cinfo' [-Wunused-parameter]
  dest.term_destination = [](j_compress_ptr cinfo) {
                                            ^
packages/apps/Camera2/jni/jpegutil.cpp:342:26: warning: unused parameter 'numBytes' [-Wunused-parameter]
  auto flush = [](size_t numBytes) {
                         ^
In file included from packages/apps/Camera2/jni/jpegutil.cpp:16:
packages/apps/Camera2/jni/jpegutil.h:184:21: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
  for (int i = 0; i < ROWS; i++) {
                  ~ ^ ~~~~
packages/apps/Camera2/jni/jpegutil.cpp:273:60: note: in instantiation of member function 'jpegutil::RowIterator<16>::LoadAt' requested here
    std::array<unsigned char*, 16> yData = y_row_generator.LoadAt(y);
                                                           ^
In file included from packages/apps/Camera2/jni/jpegutil.cpp:16:
packages/apps/Camera2/jni/jpegutil.h:192:21: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
  for (int i = 0; i < ROWS; i++) {
                  ~ ^ ~~~~
packages/apps/Camera2/jni/jpegutil.h:184:21: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
  for (int i = 0; i < ROWS; i++) {
                  ~ ^ ~~~~
packages/apps/Camera2/jni/jpegutil.cpp:274:61: note: in instantiation of member function 'jpegutil::RowIterator<8>::LoadAt' requested here
    std::array<unsigned char*, 8> cbData = cb_row_generator.LoadAt(y / 2);
                                                            ^
In file included from packages/apps/Camera2/jni/jpegutil.cpp:16:
packages/apps/Camera2/jni/jpegutil.h:192:21: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
  for (int i = 0; i < ROWS; i++) {
                  ~ ^ ~~~~
6 warnings generated.
[ 89% 70619/78705] header-abi-diff -o 'out/soong/.intermediates/frameworks/hardware/interfaces/vr/compos...works.vr.composer@1.0/android_arm64_armv8-a_shared_core/android.frameworks.vr.composer@1.0.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0/android_arm64_armv8-a_shared_core/android.frameworks.vr.composer@1.0.so.abidiff
*****************************************************
[ 89% 70663/78705] header-abi-diff -o 'out/soong/.intermediates/hardware/interfaces/graphics/composer/2....hics.composer@2.1/android_arm64_armv8-a_shared_core/android.hardware.graphics.composer@2.1.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1/android_arm64_armv8-a_shared_core/android.hardware.graphics.composer@2.1.so.abidiff
*****************************************************
[ 92% 72629/78705] target Strip (mini debug info): charger (out/target/product/generic_arm64/obj/EXECUTABLES/charger_intermediates/charger)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/sbin/charger: no symbols
[ 92% 72630/78705] target Strip (mini debug info): init (out/target/product/generic_arm64/obj/EXECUTABLES/init_intermediates/init)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/init: no symbols
[ 92% 72640/78705] target Strip (mini debug info): recovery (out/target/product/generic_arm64/obj/EXECUTABLES/recovery_intermediates/recovery)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/recovery/root/sbin/recovery: no symbols
[ 92% 72752/78705] target Strip (mini debug info): mdnsd (out/target/product/generic_arm64/obj/EXECUTABLES/mdnsd_intermediates/mdnsd)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/system/bin/mdnsd: no symbols
[ 92% 73039/78705] target Strip (mini debug info): micro_bench_static (out/target/product/generic_arm64/obj/EXECUTABLES/micro_bench_static_intermediates/micro_bench_static64)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/system/xbin/micro_bench_static64: no symbols
[ 94% 74051/78705] header-abi-diff -o 'out/soong/.intermediates/frameworks/hardware/interfaces/vr/compos...ser@1.0/android_arm_armv7-a-neon_cortex-a15_shared_core/android.frameworks.vr.composer@1.0.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/frameworks/hardware/interfaces/vr/composer/1.0/android.frameworks.vr.composer@1.0/android_arm_armv7-a-neon_cortex-a15_shared_core/android.frameworks.vr.composer@1.0.so.abidiff
*****************************************************
[ 94% 74099/78705] header-abi-diff -o 'out/soong/.intermediates/hardware/interfaces/graphics/composer/2....2.1/android_arm_armv7-a-neon_cortex-a15_shared_core/android.hardware.graphics.composer@2.1.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/hardware/interfaces/graphics/composer/2.1/android.hardware.graphics.composer@2.1/android_arm_armv7-a-neon_cortex-a15_shared_core/android.hardware.graphics.composer@2.1.so.abidiff
*****************************************************
[ 94% 74100/78705] target Strip (mini debug info): micro_bench_static_32 (out/target/product/generic_arm64/obj_arm/EXECUTABLES/micro_bench_static_intermediates/micro_bench_static)
prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-nm: out/target/product/generic_arm64/symbols/system/xbin/micro_bench_static: no symbols
[ 94% 74204/78705] header-abi-diff -o out/soong/.intermediates/external/libcxx/libc++/android_arm_armv7-...ntermediates/external/libcxx/libc++/android_arm_armv7-a-neon_cortex-a15_shared_core/libc++.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/external/libcxx/libc++/android_arm_armv7-a-neon_cortex-a15_shared_core/libc++.so.abidiff
*****************************************************
[ 94% 74229/78705] target Strip (mini debug info): simpleperf (out/target/product/generic_arm64/obj/EXECUTABLES/simpleperf_intermediates/simpleperf)
prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-nm: out/target/product/generic_arm64/symbols/system/xbin/simpleperf: no symbols
[ 94% 74240/78705] target Strip (mini debug info): simpleperf_32 (out/target/product/generic_arm64/obj_arm/EXECUTABLES/simpleperf_intermediates/simpleperf32)
prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-nm: out/target/product/generic_arm64/symbols/system/xbin/simpleperf32: no symbols
[ 97% 76763/78705] Target userdata fs image: out/target/product/generic_arm64/userdata.img
Running:  mkuserimg.sh out/target/product/generic_arm64/data out/target/product/generic_arm64/userdata.img ext4 data 576716800 -D out/target/product/generic_arm64/system -L data out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin
make_ext4fs -T -1 -S out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin -L data -l 576716800 -a data out/target/product/generic_arm64/userdata.img out/target/product/generic_arm64/data out/target/product/generic_arm64/system
Creating filesystem with parameters:
    Size: 576716800
    Block size: 4096
    Blocks per group: 32768
    Inodes per group: 7040
    Inode size: 256
    Journal blocks: 2200
    Label: data
    Blocks: 140800
    Block groups: 5
    Reserved block group size: 39
Created filesystem with 91/35200 inodes and 10769/140800 blocks
out/target/product/generic_arm64/userdata.img maxsize=588791808 blocksize=2112 total=576716800 reserve=5947392
[ 99% 78074/78705] header-abi-diff -o out/soong/.intermediates/system/core/libziparchive/libziparchive/a...es/system/core/libziparchive/libziparchive/android_arm64_armv8-a_shared_core/libziparchive.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/system/core/libziparchive/libziparchive/android_arm64_armv8-a_shared_core/libziparchive.so.abidiff
*****************************************************
[ 99% 78135/78705] header-abi-diff -o out/soong/.intermediates/system/core/libziparchive/libziparchive/a.../libziparchive/libziparchive/android_arm_armv7-a-neon_cortex-a15_shared_core/libziparchive.so_ref.lsdump
******************************************************
VNDK Abi broken: Please check compatiblity report at : out/soong/.intermediates/system/core/libziparchive/libziparchive/android_arm_armv7-a-neon_cortex-a15_shared_core/libziparchive.so.abidiff
*****************************************************
[ 99% 78700/78705] build out/target/product/generic_arm64/obj/NOTICE.html
Combining NOTICE files into text
Combining NOTICE files into HTML
[ 99% 78704/78705] Target system fs image: out/target/product/generic_arm64/obj/PACKAGING/systemimage_intermediates/system.img
Running:  mkuserimg.sh out/target/product/generic_arm64/system out/target/product/generic_arm64/obj/PACKAGING/systemimage_intermediates/system.img ext4 system 2684354560 -D out/target/product/generic_arm64/system -L system out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin
make_ext4fs -T -1 -S out/target/product/generic_arm64/obj/ETC/file_contexts.bin_intermediates/file_contexts.bin -L system -l 2684354560 -a system out/target/product/generic_arm64/obj/PACKAGING/systemimage_intermediates/system.img out/target/product/generic_arm64/system out/target/product/generic_arm64/system
Creating filesystem with parameters:
    Size: 2684354560
    Block size: 4096
    Blocks per group: 32768
    Inodes per group: 8192
    Inode size: 256
    Journal blocks: 10240
    Label: system
    Blocks: 655360
    Block groups: 20
    Reserved block group size: 159
Created filesystem with 2680/163840 inodes and 253008/655360 blocks
[100% 78705/78705] Install system fs image: out/target/product/generic_arm64/system.img
out/target/product/generic_arm64/system.img+ maxsize=2740556544 blocksize=2112 total=2684354560 reserve=27684096

#### make completed successfully (02:37:19 (hh:mm:ss)) ####

sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$
```

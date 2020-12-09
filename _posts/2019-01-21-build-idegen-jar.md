---
layout: post
title: build-idegen-jar
author: sleticalboy
date: 2019-01-21 10:40:09
category: aosp
tags: [aosp, android]
---

```shell
sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ mmm development/tools/idegen/
make: Entering directory '/media/sleticalboy/android-os/AOSP'
============================================
PLATFORM_VERSION_CODENAME=REL
PLATFORM_VERSION=8.0.0
TARGET_PRODUCT=aosp_arm
TARGET_BUILD_VARIANT=eng
TARGET_BUILD_TYPE=release
TARGET_ARCH=arm
TARGET_ARCH_VARIANT=armv7-a
TARGET_CPU_VARIANT=generic
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
[1/1] out/soong/.bootstrap/bin/soong_build out/soong/build.ninja
out/build-aosp_arm-_development_tools_idegen_Android.mk.ninja is missing, regenerating...
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module crashcollector 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module CorePerfTests 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module DocumentsUIPerfTests 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module DocumentsUIAppPerfTests 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module MtpDocumentsProviderPerfTests 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module perf-setup.sh 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module SurfaceComposition 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module RsBlasBenchmark 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module ImageProcessingJB 
platform_testing/build/tasks/tests/instrumentation_metric_test_list.mk: warning: continuous_instrumentation_metric_tests: Unknown installed file for module MultiUserPerfTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module HelloWorldTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module crashcollector 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module ManagedProvisioningTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksCoreTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksNetTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksNotificationTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksServicesTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksUtilTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module MtpDocumentsProviderTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module DocumentsUITests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module ShellTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SystemUITests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RecyclerViewTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksWifiApiTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksWifiTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module FrameworksTelephonyTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module ContactsProviderTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module ContactsProviderTests2 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsUnitTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module TelecomUnitTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module AndroidVCardTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module PermissionFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module BlockedNumberProviderTest 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module LauncherFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module DownloadAppFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module NotificationFunctionalTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module DownloadProviderTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module EmergencyInfoTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module CalendarProviderTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsLibTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RetailDemoTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module RSTest 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module PrintSpoolerOutOfProcessTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module CellBroadcastReceiverUnitTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module TelephonyProviderTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module CarrierConfigTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module TeleServiceTests 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module SettingsProviderTest 
platform_testing/build/tasks/tests/instrumentation_test_list.mk: warning: continuous_instrumentation_tests: Unknown installed file for module StorageManagerUnitTests 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module binderAddInts 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module crashcollector 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module hwuimacro 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module hwuimicro 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module libjavacore-benchmarks 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module minikin_perftests 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module mmapPerf 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module netd_benchmark 
platform_testing/build/tasks/tests/native_metric_test_list.mk: warning: continuous_native_metric_tests: Unknown installed file for module perf-setup.sh 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module adbd_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module async_io_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module bugreportz_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module bsdiff_unittest 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module camera_client_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module crashcollector 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module dumpstate_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module dumpstate_test_fixture 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module hello_world_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module hwui_unit_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module init_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module libjavacore-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module liblog-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module libminijail_unittest_gtest 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module libtextclassifier_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module libwifi-system_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module linker-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module logcat-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module logd-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module kernel-config-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module memory_replay_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module minadbd_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module minikin_tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module mtp_ffs_handle_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module netd_integration_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module netd_unit_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module recovery_component_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module recovery_unit_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module scrape_mmap_addr 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module simpleperf_cpu_hotplug_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module simpleperf_unit_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module syscall_filter_unittest_gtest 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module time-unit-tests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module update_engine_unittests 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module wificond_unit_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module wifilogd_unit_test 
platform_testing/build/tasks/tests/native_test_list.mk: warning: continuous_native_tests: Unknown installed file for module SurfaceFlinger_test 
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
test/vts/tools/build/tasks/vts_package.mk:216: warning: FindEmulator: cd: vendor/google_vts/testcases: No such file or directory
[ 33% 1/3] host Java: idegen (out/host...IBRARIES/idegen_intermediates/classes)
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
[100% 3/3] Install: out/host/linux-x86/framework/idegen.jar
make: Leaving directory '/media/sleticalboy/android-os/AOSP'

#### make completed successfully (34 seconds) ####

sleticalboy@Lee:/media/sleticalboy/android-os/AOSP$ 
```

# Clion 配置开发环境

## 
```
/home/binli/opt/clion-2020.1.1/bin/cmake/linux/bin/cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a -DCMAKE_ANDROID_NDK=/home/binli/opt/android-sdk/ndk/20.0.5594570 -DCMAKE_SYSTEM_VERSION=28 -DCMAKE_C_FLAGS= -DCMAKE_CXX_FLAGS= -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang -G "CodeBlocks - Unix Makefiles" /home/binli/code/HelloClion
-- Android: Targeting API '28' with architecture 'arm', ABI 'armeabi-v7a', and processor 'armv7-a'
-- Android: Selected unified Clang toolchain
-- The C compiler identification is Clang 8.0.7
-- The CXX compiler identification is Clang 8.0.7
-- Check for working C compiler: /home/binli/opt/android-sdk/ndk/20.0.5594570/toolchains/llvm/prebuilt/linux-x86_64/bin/clang
-- Check for working C compiler: /home/binli/opt/android-sdk/ndk/20.0.5594570/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /home/binli/opt/android-sdk/ndk/20.0.5594570/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++
-- Check for working CXX compiler: /home/binli/opt/android-sdk/ndk/20.0.5594570/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/binli/code/HelloClion/cmake-build-android-jni
[Finished]
```

##
```
-DCMAKE_SYSTEM_NAME=Android
-DCMAKE_ANDROID_ARCH_ABI=armeabi-v7a
-DCMAKE_ANDROID_NDK=$ANDROID_SDK/ndk/20.0.5594570
-DCMAKE_SYSTEM_VERSION=28
-DCMAKE_C_FLAGS=""
-DCMAKE_CXX_FLAGS=""
-DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang
```
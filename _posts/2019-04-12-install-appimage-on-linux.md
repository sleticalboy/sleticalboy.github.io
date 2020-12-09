---
layout: post
title: Linux 下安装 AppImage 程序
author: sleticalboy
date: 2019-04-12 14:53:21
category: linux
tags: [linux]
---

## 安装步骤
- 修改文件权限，添加可执行权限 `chmod u+x file.AppImage`
- cd 文件所在目录，执行 `./file.AppImage` 即可运行
- 添加启动图标
  - 创建软连接 `ln -s target src`
  - 创建桌面启动文件 `touch xxx.desktop`
    ```shell
    [Desktop Entry]
    Encoding=UTF-8
    Name=anything u like
    Exec=exex/path/to/ur/file or soft/link/for/ur/file
    Icon=icon/path/for/ur/software
    Terminal=false
    Type=Application
    Categories=Internet;
    ```
- 将桌面启动文件复制到 ~/.local/share/applications/ 或者 /usr/share/applications/
- 修改 `.desktop` 文件属性为可执行：勾选 <b>Execute</b> 复选框<br/>
  ![icon1](assets/linux/check-desk-top-execute.png)
- 对比下修改过的和没修改过的<br/>
  ![icon2](assets/linux/execute-diff-with-before.png)
- 最后刷新文件缓存 `desktop-file-validate`

> PS: 如果想在桌面上创建快捷方式，直接把 `.desktop` 文件拷贝到桌面即可

## 参考资料
[Linux/Ubuntu下安装TIM(AppImage格式程序)和创建桌面图标][1]

[1]: https://blog.csdn.net/qq_35531549/article/details/86569846

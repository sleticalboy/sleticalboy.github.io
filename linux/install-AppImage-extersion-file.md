# Ubuntu 下安装后缀为AppImage格式文件
- 修改文件权限，添加可执行权限 `chmod u+x file.AppImage`
- cd 文件所在目录，执行 `./file.AppImage` 即可运行
- 添加启动图标
  - 创建软连接 `ln -s target src`
  - 创建桌面启动文件 `touch xxx.desktop`
    ```shell
    [Desktop Entry]
    Encoding=UTF-8
    Name=anything u like
    Exec=exex/path/to/ur/file or soft/link/for/you/file
    Icon=icon/path/for/ur/software
    Terminal=false
    Type=Application
    Categories=Internet;
    ```
- 将桌面启动文件复制到 ~/.local/share/application/ 或者 /usr/share/application\
- 刷新缓存
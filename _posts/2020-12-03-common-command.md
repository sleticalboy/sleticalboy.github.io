---
layout: post
title: common-command
author: sleticalboy
date: 2020-12-03 08:18:45
category: linux
tags: [linux]
---

# 常用命令

- ls：list 缩写，目录下文件
- cd：change directory 缩写，转换目录
- cp：拷贝文件或目录
- mv：移动或者重命名
- rm：删除文件或者目录
```shell
rm [-f --force][-r --recursive]
```
- touch：创建文本文件
- less：列出文件内容，与 more 的区别是此命令只列出一页，按下 space 键会列出下一页
- more：列出文件的内容，是全部内容
- tail
- find：查找文件
```shell
# 在 dir 下查找 keyword
find [dir] -name [keyword]
```
- locate：字面意思定位文件位置，和 find 类似
- tar：压缩/解压缩命令
- rename
```shell
# 文件名开头添加 smiley_
rename -n 's/^/smiley_/' *.png
# 替换非数字、字母、点
rename -n 's/[^\d^\w^\.]//g' *.png
```
- ln：创建链接
```shell
# ln -s 源地址 目标地址 [最好使用绝对路径]
ln -s src target
# 修改已有链接
ln -snf 新源地址 软链接地址
# 创建目录连接
ln -s /src/dir /target/dir
```

## 文件切割
- 大小切割 `split -b 500M src child_prefix`
- 行数切割 `split -l 500 src child_prefix`

## 磁盘操作
- 挂载U盘
    - 1、先查看 `sudo fdisk -l `
    - 2、找到自己的U盘并挂载 `sudo mount /dev/sdxxx /media/username/xxx（如果不存在xxx要先创建）`
- 开机自动挂载，需要修改 /etc/fstab 文件
- 查看磁盘空间 `df / du`
- 重新挂载磁盘 `mount -o remount,rw mount_point`
- 卸载U盘 `sudo umount /media/username/xxx`
- 弹出U盘 `udisksctl unmount -b /dev/sdb1`、`udisksctl power-off -b /dev/sdb`

## grep 全局搜索字符串
- 只在目录中所有的.php和.html文件中递归搜索字符"main()"
    - `grep"main()" . -r --include *.{php,html}`
- 在 dir 下递归[r]搜索 string，匹配之后显示行号[n]
    - `grep "string" -rn [dir or file] `
- 递归 `-r`
- 显示行号 `-n`
- 指定类型文件 `--include="*.xml"`
- 指定上下文行数 `-C n 之前和之后n行 -B n 之前n行 -A n 之后n行`
- 正则表达式
	- . (小数点)：代表『一定有一个任意字节』的意思；
	- * (星号)：代表『重复前一个字符， 0 到无穷多次』的意思，为组合形态
	- ^ (尖尖)：代表以该字符开始

## 查看文件内容
- `cat`/`more`/`less`
- 显示指定行 
    - `cat file | tail -n +100 | head -n 20` (从第100行开始，显示20行)
    - `cat file | head -n 100 | tail -n +20` (显示100到第120行)

## 其他
- 查看内核启动日志 `dmesg`
- 查看所有端口占用情况 `netstat -apn or netstat -tulpn`
- 查看当前用户 `whoami`
- 查看用户 id `id root[user_name]`
- 查看文件属性 `lsattr/chattr`
- ssh 远程登录 `ssh -p 80 username@ip/hostname`
- 查看历史命令 `history | grep 'cmd'`
- 执行历史命令 `!序号`

- [查看系统快捷键]
```shell
gsettings get/set org.gnome.desktop.wm.keybindings [key:switch-to-workspace-left]
```

## 查看服务状态
	- `sudo systemctl status sshd`

## 不小心改动了 /usr/bin/sudo 的权限
> `sudo: /usr/bin/sudo must be owned by uid 0 and have the setuid bit set`

- 以当前用户身份注销，然后以root用户身份重新登录。
- 执行 `chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo`
- 以root身份注销，然后以当前用户身份重新登录。

## 系统源码路径
- `/usr/src/`

## 实现无限循环
- `watch -n 1 {command}`
    - `watch -n 1 i2cget -f -y 8 0x40 0x10`

## 查看最近使用过的命令
- 在 terminal 中按下 `ctrl + r` 然后输入关键字，会自动进行搜索

[查看系统快捷键]: https://askubuntu.com/questions/1041914/something-blocks-ctrlaltleft-right-arrow-keyboard-combination/1042413

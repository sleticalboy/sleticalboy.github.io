---
layout: post
title: shell-script
author: sleticalboy
date: 2020-05-12 14:10:01
category: linux
tags: [linux, tools]
---

# Shell 脚本

## 基础
- 只读变量
```shell
# 等号与变量名和值之间不能有空格
# 只读变量，不能被重新赋值
readonly name="\nbinli"
# -e 参数可以显示被转移的符号，没有参数会原样输出
echo -e $name
# 字符串长度
echo "len: ${#name}"
```
- 删除变量
```shell
unset name
```
- for 循环
```shell
# for 循环
for file in `ls /`; do
	echo $file
done
```
- 数组

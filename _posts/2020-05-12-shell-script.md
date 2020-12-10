---
layout: post
title: shell 脚本
author: sleticalboy
date: 2020-05-12 14:10:01
category: linux
tags: [linux, tools]
---

## 变量
- 只读变量
```shell
# 等号与变量名和值之间不能有空格
# 只读变量，不能被重新赋值
readonly name="\nbinli"
# -e 参数可以显示被转移的符号，没有参数会原样输出
echo -e $name
```
- 删除变量
```shell
unset name
```

## 语句
- if 语句
```shell
if condition; then
	# do stuff
fi
```
- for 循环
```shell
for file in `ls /`; do
	echo $file
done
```

## 数组

## 字符串
- 字符长度：`echo "len: ${#name}"`
- 内容是为空：`[[ -z $msg ]]`
- 内容非空：`[[ $msg ]]`

## 文件
- 存在文件：`[[ -f CNAME ]]`
---
layout: post
title: shell 脚本
author: sleticalboy
date: 2020-05-12 14:10:01
category: linux
tags: [linux, tools]
---

## 变量

1. 只读变量
```shell
# 等号与变量名和值之间不能有空格
# 只读变量，不能被重新赋值
readonly name="\nbinli"
# -e 参数可以显示被转移的符号，没有参数会原样输出
echo -e $name
```
2. 删除变量
```shell
unset name
```

## 语句

1. if 语句
```shell
if condition; then
	# do stuff
fi
```
2. for 循环
```shell
for file in `ls /`; do
	echo $file
done
```

## 数组

## 字符串

1. 字符长度：`echo "len: ${#name}"`
2. 内容是为空：`[[ -z $msg ]]`
3. 内容非空：`[[ $msg ]]`

## 文件

1. 存在文件：`[[ -f CNAME ]]`

## 特殊变量

1. `$0` 当前脚本的文件名
2. `$n (n>=1)` 传递给脚本或函数的参数
3. `$#` 传递给脚本或函数的参数个数
4. `$*` 传递给脚本或函数的所有参数
5. `$@` 传递给脚本或函数的所有参数
6. `$?` 上个命令的退出状态或函数的返回值
7. `$$` 当前 shell 进程 的 id （对于 shell 脚本，就是脚本所在的进程 id）
8. 示例（保存以下脚本为 xxx.sh）
```shell
#!/bin/bash
echo "Process ID: $$"
echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "All parameters 1: $@"
echo "All parameters 2: $*"
echo "Total: $#"
```

### 当被 `""` 所包含时，`$*` 和 `$@` 的区别
- `"$*"` 会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据
- `"$@"` 仍然将每个参数都看作一份数据，彼此之间是独立的
- 示例（保存以下脚本为 xxx.sh）
```shell
#!/bin/bash
echo "print each param from \"\$*\""
# 只循环一次
for var in "$*"
do
    echo "$var"
done
echo "print each param from \"\$@\""
# 循环 $# 次
for var in "$@"
do
    echo "$var"
done
```

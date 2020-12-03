---
layout: post
title: common-commands
author: sleticalboy
date: 2020-04-25 11:29:23
category: git
tags: [git]
---

# git 常用命令

- 将本地库和远端库关联

## stash
- git stash list
- git stash show stash{$num}
- git stash save [-u] 'stash-msg'

## 修改历史提交记录
- git commit --amend

## 过滤作者
- git log --author="binli"

## stash 未提交的文件【-u 包含 untracked 文件】
- git stash save -u "save info"

## 列出所有的 stash
- git stash list

## 查看 stash 内容
- git stash show

## apply stash 最后一次 stash
- git stash pop 

## 删除 untracked files
- git clean -f

## 连 untracked 的目录也一起删掉
- git clean -fd

## 连 gitignore 的untrack 文件/目录也一起删掉 （慎用，一般这个是用来删掉编译出来的 .o之类的文件用的）
- git clean -xfd 

## 在用上述 git clean 前，强烈建议加上 -n 参数来先看看会删掉哪些文件，防止重要文件被误删
- git clean -nxfd
- git clean -nf
- git clean -nfd

## 对比两个分支差异
- git diff exdroid/H51 exdroid/GVC3220 -- GsSettings/src/com/grandstream/settings/network/wifi/

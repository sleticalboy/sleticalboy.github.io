---
layout: post
title: checkout-branch
author: sleticalboy
date: 2020-12-03 08:18:17
category: android
tags: [aosp]
---

# AOSP 切换分支
> 注：事先切换到源码目录下

## 列出所有可切换的分支
```shell
$ cd .repo/manifests
$ git branch -a | cut -d / -f 3 [|grep android]
```

## 切换到对应的分支
```shell
$ repo init -b branch_name
```

## 同步分支
```shell
$ repo sync
$ repo start branch_name --all
```

## 查看当前分支
```shell
$ repo branches
```

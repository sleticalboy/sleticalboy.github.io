---
layout: post
title: AOSP 切换分支
author: sleticalboy
date: 2019-07-15 09:43:57
category: android
tags: [android, aosp]
---

> 注：事先切换到源码目录下

## 列出所有可切换的分支
```bash
$ cd .repo/manifests
$ git branch -a | cut -d / -f 3 [|grep android]
```

## 切换到对应的分支
```bash
$ repo init -b branch_name
```

## 同步分支
```bash
$ repo sync
$ repo start branch_name --all
```

## 查看当前分支
```bash
$ repo branches
```

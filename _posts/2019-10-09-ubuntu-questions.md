---
layout: post
title: Ubuntu 常见问题
author: sleticalboy
date: 2019-10-09 12:00:25
category: linux
tags: [linux]
---

## apt install pkg_name
```shell
$ sudo apt install sqlite
[sudo] password for your_name: 
E: Could not get lock /var/lib/dpkg/lock-frontend - open (11: Resource temporarily unavailable)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?
$ rm /var/lib/dpkg/lock
```

## install tweak tools on Ubuntu 18.04
```shell
$ apt install gnome-tweak-tool (run as super user)
```

## install jdk on ubuntu 18.04
```
update-alternatives: --install needs <link> <name> <path> <priority>
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-7-oraclejdk/bin/java 1082

update-alternatives: --remove needs <name> <path>
sudo update-alternatives --remove java /usr/lib/jvm/java-7-oraclejdk/bin/java
```

## upgrade to latest LTS version
- 方式1：
	- `sudo apt update`
	- `sudp apt upgrade`
	- `sudo update-manager`
- 方式2：
	- 检查升级： `sudo do-release-upgrade`
	- 升级到 dev 版本： `sudo do-release-upgrade -d`

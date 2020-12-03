---
layout: post
title: setup-a-new-os
author: sleticalboy
date: 2020-05-17 11:25:00
category: linux
tags: [linux]
---

# 新安装的系统需要安装的常用软件

- 常用工具
	- `sudo apt install axel silversearcher-ag openssh-server ssh openssh-client openssh-server tree net-tools`

- 搜狗输入法
	- `cd ~/Downloads/ && axel -n 10 "http://cdn2.ime.sogou.com/dl/index/1571302197/sogoupinyin_2.3.1.0112_amd64.deb?st=EDsKarP7mjX2oPmtqBOCJA&e=1589200310&fn=sogoupinyin_2.3.1.0112_amd64.deb"`
	- `cd ~/Downloads/ && sudo dpkg -i sogoupinyi*.deb`
- Sublime text
	- Install the GPG key:
		- `wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -`
	- Ensure apt is set up to work with https sources:
		- `sudo apt-get install apt-transport-https`
	- install stable version
		- `echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list`
		- `sudo apt-get update && sudo apt-get install sublime-text`
- Google Chrome
	- `wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
	- `echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list`
	- `sudo apt-get update && sudo apt-get -y install google-chrome-stable`
- Wps Office
	- `cd ~/Downloads && axel -n 10 "https://wdl1.cache.wps.cn/wps/download/ep/Linux2019/9505/wps-office_11.1.0.9505_amd64.deb"`
	- `sudo dpkg -i wps-office*.deb`

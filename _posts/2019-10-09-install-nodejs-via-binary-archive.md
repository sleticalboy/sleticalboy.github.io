---
layout: post
title: Ubuntu 下通过源码安装 nodejs
author: sleticalboy
date: 2019-10-09 17:12:23
category: linux
tags: [linux]
---

## Install Nodejs

- 1: open [nodejs.org](https://nodejs.org/en/download/current/)
- 2: choose `Linux Binaries (x64)` and download the binary archive file
- 3: open the `~/Download/` folder
```
// make an installation directory
$ mkdir -p `where/you/wanna/install/nodejs
// unpack the archive file
$ tar -xvf node-version-linux-x64.tar.xz -c installation_dir
```
- 4: edit and refresh your `~/.bashrc` file
```
$ echo "export PATH=installation_dir/bin:PATH" >>~/.bashrc
$ source ~/.bashrc
```
- 5: verify installation
```
$ node -v
v12.11.1
$ npx -v
6.11.3
$ npm-v
npm-v: command not found
$ npm -v
6.11.3
$ npm version
{
  npm: '6.11.3',
  ares: '1.15.0',
  brotli: '1.0.7',
  cldr: '35.1',
  http_parser: '2.8.0',
  icu: '64.2',
  llhttp: '1.1.4',
  modules: '72',
  napi: '5',
  nghttp2: '1.39.2',
  node: '12.11.1',
  openssl: '1.1.1c',
  tz: '2019a',
  unicode: '12.1',
  uv: '1.32.0',
  v8: '7.7.299.11-node.12',
  zlib: '1.2.11'
}
```

## Install yddict tool
- 1: install yddict via `npm`
```
$ npm install -g yddict
```
- 2: config the output color
```
$ vim ~/.config/configstore/yddict.json
{
        "color": "any_color_you_like",
        "spinner": true
}
```

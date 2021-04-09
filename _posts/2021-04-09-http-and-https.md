---
layout: post
title: HTTP 和 HTTPS
author: sleticalboy
date: 2021-04-09 09:00:07 +0800
category: net
tags: [net]
---

## HTTP

### 是什么

超文本传输协议

### 链接建立过程：三次握手

### 链接断开过程：四次挥手

### 特点

- 无状态
- 无连接
  - cookie/session
  - Connection: keep-alive
- 基于请求和响应
- 简单快速、灵活
- 明文请求、响应，不安全

## HTTPS

### 是什么

超文本安全传输协议，基于 HTTP，通过 SSL/TLS 提供加密数据处理、验证对方身份以及数据完整保护

### 实现原理

- 协议、默认端口号
- 明文传输、加密传输、安全
- 效率

### 特点

- 内容加密
- 验证身份
- 保护数据完整性
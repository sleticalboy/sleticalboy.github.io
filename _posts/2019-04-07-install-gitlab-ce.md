---
layout: post
title: install-gitlab-ce
author: sleticalboy
date: 2019-04-07 12:39:14
category: linux
tags: [linux]
---

# install gitlab-ce on Ubuntu 16.04

- 参考[官方文档](https://about.gitlab.com/install/#ubuntu)
- 安装相关的依赖包：curl, openssh-server, ca-certificates, postfix
    - ```$ sudo apt install curl ca-certificates```
    - ```$ sudo apt install openssh-server```
    ```shell
    # 可能会遇到版本不兼容的问题，解决办法是安装控制台输出推荐的版本, 然后重新执行此条命令
    The following information may help to resolve the situation:
    The following packages have unmet dependencies:
    openssh-server : Depends: openssh-client (= 1:7.2p2-4)
                    Depends: openssh-sftp-server but it is not going to be installed
                    Recommends: ssh-import-id but it is not going to be installed
    E: Unable to correct problems, you have held broken packages.
    
    $ sudo apt install openssh-client=1:7.2p2-4
    ```
    - ```$ sudo apt install postfix```
- 添加 gitlab 的 GPG 公钥
    ```shell
    $ curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null
    ```
- 使用清华大学镜像
    ```shell
    1, 先看 /etc/apt/source.list.d/ 目录下有没有 gitlab-ce.list 文件
    2, 没有的话 $ sudo touch gitlab-ce.list 创建
    3, 编辑添加 deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu xenial main
    4, $ sudo apt update 更新软件
    ```
- 安装 gitlab-ce
    ```shell
    $ sudo apt install gitlab-ce
    ```
- 运行 gitlab
    ```shell
    # 运行之前要先配置下 external_url
    $ sudo vim /etc/gitlab/gitlab.rb
    找到 external_url 并修改为 'http://xxxxxx'[你自己的地址] 保存退出
    $ sudo gitlab-ctl reconfigure
    ```

- 如何通过控制台修改密码
    ```shell
    gitlab-rails console production
    > u = User.where(id: 1).first
    > u.password = 'secret_pass'
    > u.password_confirmation = 'secret_pass'
    > u.save!
    ```

- 有时候修改不了密码试试把 external_url 的 https 改成 http

- web 端加载不了资源文件 参考[方案1](https://blog.csdn.net/pzlsun/article/details/54619832)，[方案2](https://blog.csdn.net/huangjinlong77/article/details/30510705) (对我来讲都没生效, 下面是我探索了许久才找到的方法)
    - 修改 nginx 配置：```$ sudo vim embedded/conf/nginx.conf```
    - 修改资源文件路径 ：```$ sudo vim ./embedded/lib/ruby/gems/2.5.0/gems/unicorn-5.1.0/examples/nginx.conf ```
    ```shell
        # path for static files
        root /opt/gitlab/embedded/service/gitlab-rails/public;
        location = /500.html {
            # root /path/to/app/current/public;
            root /opt/gitlab/embedded/service/gitlab-rails/public;
        }
    ```
    - 重新配置并重启
    ```shell
    sudo gitlab-ctl reconfigure
    sudo gitlab-ctl start
    ```


---
layout: post
title: 解决访问 githug pages  tags 404 问题
author: sleticalboy
date: 2020-12-11 21:09:46 +0800
category: git
tags: [gitpages]
---

## 问题是如何出现的

使用 github workflow 自动发布 gitpages 时，出现了网站发布后访问 tags 404 not found 问题

## 出现问题的原因

github 为了安全问题，不会执行自定义的 plugin，即_plugins 目录下的 rb 文件，所以 tags 下的index.html 文件访问不了

## 探究过哪些解决办法

1. 使用网上提供的发布脚本：`JamesIves/github-pages-deploy-action@3.7.1`；
2. 自己修改过 `.github/workflow/pages-deploy.yml` 文件但最终也未生效；

## 最终如何解决

自己编写脚本在本地发布，脚本内容如下：
```bash
#!/bin/bash
#
# Deploy the content of _site to 'origin/gh-pages'

publish() {
    work_dir=`mktemp -d`
    cur_dir=`pwd`
    echo "work dir: $work_dir, current dir: $cur_dir"
    
    cd $work_dir
    cp -r $cur_dir/.git* .
    
    echo "git restore . && git pull --rebase"
    git restore .
    git pull --rebase

    _init=false

    msg=`git branch -av | grep gh-pages`
    # [[ -z $msg ]] 字符串 msg 为空
    # [[ $msg ]] 字符串 msg 非空
    if [[ -z $msg ]]; then
        _init=true
        echo "git checkout -b gh-pages"
        git checkout -b gh-pages
    else
        _init=false
        echo 'git checkout gh-pages | grep "git pull"'
        msg=`git checkout gh-pages | grep "git pull"`
        if [[ $msg ]]; then
            echo "sync with git pull --rebase"
            git pull --rebase >>/dev/null
        fi
    fi
    
    cp -r $cur_dir/_site/* .
    git add . && git commit -m "published on `date`"
    
    if $_init; then
        echo 'git push -u origin gh-pages'
        git push -u origin gh-pages
    else
        echo 'git status | grep "git push"'
        msg=`git status | grep "git push"`
        if [[ "$msg" ]]; then
            echo "deploy with git push"
            git push
        fi
    fi

    rm -rf "$work_dir"
}

publish
```
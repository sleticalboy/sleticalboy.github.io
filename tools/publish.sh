#!/bin/bash
#
# Deploy the content of _site to 'origin/gh-pages'

main() {
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

main
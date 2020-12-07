#!/bin/bash
#
# Deploy the content of _site to 'origin/<pages_branch>'
#
# v2.5
# https://github.com/cotes2020/jekyll-theme-chirpy
# © 2020 Cotes Chung
# Published under MIT License

set -eu

main() {
    work_dir=`mktemp -d`
    cur_dir=`pwd`
    echo "work dir: $work_dir, current dir: $cur_dir"
    
    cd $work_dir
    cp -r $cur_dir/.git* .
    
    git restore .
    git pull --rebase
    
    msg=`git checkout gh-pages | grep "git pull"`
    if [[ $msg ]]; then
        echo "sync with git pull --rebase"
        git pull --rebase >>/dev/null
    fi
    
    cp -r $cur_dir/_site/* .
    git add . && git commit -m "published on `date`"
    
    msg=`git status | grep "git push"`
    if [[ "$msg" ]]; then
        echo "deploy with git push"
        git push
    fi

    rm -rf "$work_dir"
}

main
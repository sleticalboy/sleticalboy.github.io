#!/usr/bin/env bash

# 1、遍历所有的子目录；
# 2、读取目录中的文件并存储；
# 3、

articles=('sql' 'java' 'linux' 'git')

for art in ${articles[@]};
do
    echo "$art"
    # echo `ls $art`
    show_full_path($art)
done

show_full_path(dir) {
    ls $dir | sed "s:^:`pwd`/:"
}
# git 常见问题

- git pull 出现 `fatal: refusing to merge unrelated histories` 错误
```
原因：远端认为你正在‘pull’的库和本地的库没有任何关联，所以无法 merge
解决一： 
    1，删除本地仓库中的 .git 目录；
    2，从远端把库拉下来，然后将相关的文件拷贝到本地相应的库目录中；
    3，提交，推送。
解决二： 
    1，执行 git pull origin master --allow-unrelated-histories 命令；
    2，如果有冲突，则解决冲突；
    3，提交，推送。
```
# 常用命令

- ls
- cd
- cp
- mv
- rm
```shell
rm [-f --force][-r --recursive]
```
- touch
- less
- more
- tail
- find
```shell
# 在 dir 下查找 keyword
find [dir] -name [keyword]
```
- locate
- tar
- 管道
- rename
```shell
# 文件名开头添加 smiley_
rename -n 's/^/smiley_/' *.png
# 替换非数字、字母、点
rename -n 's/[^\d^\w^\.]//g' *.png
```
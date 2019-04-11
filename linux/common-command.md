# 常用命令

- ls：list 缩写，目录下文件
- cd：change directory 缩写，转换目录
- cp：拷贝文件或目录
- mv：移动或者重命名
- rm：删除文件或者目录
    ```shell
    rm [-f --force][-r --recursive]
    ```
- touch：创建文本文件
- less：列出文件内容，与 more 的区别是此命令只列出一页，按下 space 键会列出下一页
- more：列出文件的内容，是全部内容
- tail
- find：查找文件
    ```shell
    # 在 dir 下查找 keyword
    find [dir] -name [keyword]
    ```
- locate：字面意思定位文件位置，和 find 类似
- tar：压缩/解压缩命令
- rename
```shell
# 文件名开头添加 smiley_
rename -n 's/^/smiley_/' *.png
# 替换非数字、字母、点
rename -n 's/[^\d^\w^\.]//g' *.png
```
- ln：创建链接
    ```shell
    ln -s src target
    ```
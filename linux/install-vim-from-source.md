# 源码编译安装 vim 最新版本

## 下载源码
- `git clone git@github.com:vim/vim.git`

## 编译前进行配置（若无特殊需求，可跳过此步骤）
- `./configure --enable-multibyte --enable-python3interp --enable-pythoninterp --with-features=huge`
- 若需重新配置需在源码目录下执行 `make distclean`

## 编译
- `make clean`

## 安装
- `sudo make install`
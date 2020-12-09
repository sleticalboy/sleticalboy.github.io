---
layout: post
title: install-ycmd
author: sleticalboy
date: 2020-11-26 09:41:22
category: tools
tags: [linux]
---

# Ubuntu 18.04 安装 ycm
> 参考 [YouCompleteMe#installation](https://github.com/ycm-core/YouCompleteMe#installation)

## 下载 Vundle
- `git clole https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

## 下载 YCM
- `git clone git@github.com:ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe`
- `cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive`

## 修改 ~/.vimrc 脚本
```vim
" required  将运行时的路径设置为包括Vundle并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 使Vuldle管理自己
Plugin 'VundleVim/Vundle.vim'
" 最后要写入YouCompleteMe管理语句的位置
Plugin 'file:///home/binli/.vim/bundle/YouCompleteMe'
" 你所有的插件必需在这一行之前添加(required)
call vundle#end()
```

## 编辑 `ycm_core` 库
- 创建目录用于存放编译过程产生的文件
  - `mkdir ~/.ycm_build && cd ~/.ycm_build`
- 生成 Makefiles
  - `cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DEXTERNAL_LIBCLANG_PATH=/usr/lib/x86_64-linux-gnu/libclang-3.9.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp`
  - 输出如下
  ```
    -- The C compiler identification is GNU 7.5.0
    -- The CXX compiler identification is GNU 7.5.0
    -- Check for working C compiler: /usr/bin/cc
    -- Check for working C compiler: /usr/bin/cc -- works
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - done
    -- Detecting C compile features
    -- Detecting C compile features - done
    -- Check for working CXX compiler: /usr/bin/c++
    -- Check for working CXX compiler: /usr/bin/c++ -- works
    -- Detecting CXX compiler ABI info
    -- Detecting CXX compiler ABI info - done
    -- Detecting CXX compile features
    -- Detecting CXX compile features - done
    -- Found PythonLibs: /usr/lib/x86_64-linux-gnu/libpython3.6m.so (found suitable version "3.6.9", minimum required is "3.5") 
    -- Using libclang to provide semantic completion for C/C++/ObjC
    -- Boost version: 1.65.1
    -- Found the following Boost libraries:
    --   filesystem
    --   regex
    --   system
    -- Using external libclang: /usr/lib/x86_64-linux-gnu/libclang-3.9.so.1
    -- NOT using clang-tidy for static analysis.
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /home/binli/.vim/ycm_build

  ```
- 构建 `ycm_core`
  - `cmake --build . --target ycm_core --config Release`
  - 输出如下
  ```
    Scanning dependencies of target ycm_core
    [  4%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Candidate.cpp.o
    [  8%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CandidateRepository.cpp.o
    [ 12%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Character.cpp.o
    [ 16%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CharacterRepository.cpp.o
    [ 20%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangCompleter.cpp.o
    [ 24%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangHelpers.cpp.o
    [ 28%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/ClangUtils.cpp.o
    [ 32%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/CompilationDatabase.cpp.o
    [ 36%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/CompletionData.cpp.o
    [ 40%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/Documentation.cpp.o
    [ 44%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/Range.cpp.o
    [ 48%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/TranslationUnit.cpp.o
    [ 52%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ClangCompleter/TranslationUnitStore.cpp.o
    [ 56%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CodePoint.cpp.o
    [ 60%] Building CXX object ycm/CMakeFiles/ycm_core.dir/CodePointRepository.cpp.o
    [ 64%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierCompleter.cpp.o
    [ 68%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierDatabase.cpp.o
    [ 72%] Building CXX object ycm/CMakeFiles/ycm_core.dir/IdentifierUtils.cpp.o
    [ 76%] Building CXX object ycm/CMakeFiles/ycm_core.dir/PythonSupport.cpp.o
    [ 80%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Result.cpp.o
    [ 84%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Utils.cpp.o
    [ 88%] Building CXX object ycm/CMakeFiles/ycm_core.dir/Word.cpp.o
    [ 92%] Building CXX object ycm/CMakeFiles/ycm_core.dir/versioning.cpp.o
    [ 96%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ycm_core.cpp.o
    [100%] Linking CXX shared library /home/binli/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so
    [100%] Built target ycm_core
  ```

## 配置
- 复制 `.ycm_extra_conf.py` 脚本
  - `cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/`
- 添加 vim 配置：在 `~/.vimrc` 文件中追加
  ```vim
    let g:ycm_server_python_interpreter='/usr/bin/python'
    let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
  ```

## 附：我自己的 ~/.vimrc 脚本
```vim
:set nu
:set fileformat=unix

set nocompatible
filetype off

syntax on
syntax enable

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" required  将运行时的路径设置为包括Vundle并初始化
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 使Vuldle管理自己
Plugin 'VundleVim/Vundle.vim'
" 最后要写入YouCompleteMe管理语句的位置
Plugin 'file:///home/binli/.vim/bundle/YouCompleteMe'
" 你所有的插件必需在这一行之前添加(required)
call vundle#end()
filetype plugin indent on
"" YCM configuration
" allow load .ycm_extra_conf.py without confirm
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
```

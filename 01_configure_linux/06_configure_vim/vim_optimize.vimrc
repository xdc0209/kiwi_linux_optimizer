" ------------------- kiwi vim optimize start -------------------------------------------
set t_Co=256                            " 虚拟终端一般颜色默认值为8色，需要设置成256色

"colorscheme darkburn                   " 设置配色方案，这是最适合xshell的配色
"colorscheme zenburn                    " 设置配色方案，darkburn优化自zenburn
"colorscheme molokai                    " 设置配色方案，非常鲜艳的配色
colorscheme monokai                     " 设置配色方案，出色的配色

"set nu                                 " 显示行号，取消显示 :set nonu
set ignorecase                          " 搜索忽略大小写，取消忽略 :set noic
set hlsearch                            " 高亮搜索
set cursorline                          " 高亮当前行
set tabstop=4                           " 设置tab所等同的空格长度
set enc=utf8                            " 设置当前编码。常用编码有utf8、gbk等

syntax keyword Type_Error ERROR Err
hi Type_Error ctermfg=1                 " 关键字ERROR显示成红色

syntax keyword Type_Warn  WARN  War
hi Type_Warn  ctermfg=3                 " 关键字WARN显示成黄色

syntax keyword Type_Info  INFO  Inf
hi Type_Info  ctermfg=2                 " 关键字INFO显示成绿色

syntax keyword Type_Debug DEBUG Deb
hi Type_Debug ctermfg=6                 " 关键字DEBUG显示成蓝色

hi Search     ctermfg=5   ctermbg=none  " 搜索粉红色

hi CursorLine ctermbg=236 cterm=none    " 当前行暗灰色
" ------------------- kiwi vim optimize end ---------------------------------------------

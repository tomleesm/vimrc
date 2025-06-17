"-------------------
" ALL SETTING EFFECT
"-------------------
set nocompatible " not compatible with the old-fashion vi mode
set mouse=a

"-------------------
" PLUGIN
"-------------------
" 使用pathogen.vim 管理外掛
execute pathogen#infect()
" Pathogen includes a :Helptags command that automatically generates help tags for plugins
Helptags

filetype plugin on " Enable filetype-specific plugins

"-------------------
" FILE ENCODING
"-------------------
set encoding=utf-8 " Vim 的內部使用編碼，例如 register 的文字編碼
set termencoding=utf-8 " Vim 輸出到 terminal 顯示的編碼
set fileencoding=utf-8 " 新增檔案時使用的編碼
set fileencodings=ucs-bom,utf-8,taiwan,big5,gb2312,latin1 " 嘗試使用哪些編碼來打開檔案

"-------------------
" SAVE FILE
"-------------------
set hidden " 切換緩衝區時，不再提示未存檔，改在離開 Vim 時提示存檔
set nobackup " 不要產生修改前的備份檔，也就是 *.*~
set nowritebackup
set swapfile " 產生 swp 檔，備份緩衝區中的內容
set directory=/tmp " 設定 swap 檔存放的目錄
set autoread " auto reload when file is changed from outside

source ~/.vim/config/restore_cursor_to_last_position.vim

"-------------------
" TEXT FORMAT
"-------------------

"-------------------
" THEME AND SYNTAX
"-------------------
syntax on " syntax highlight
colorscheme wombat256mod
" 避免 syntax highlight 消失
autocmd BufEnter * syntax sync fromstart

set number

set wrap " 超過視窗大小就自動換行

" 啟用 256 色支援和 laststatus=2，lightline 才會正常顯示
set t_Co=256
" 啟用游標行
set cursorline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'modified', 'readonly' ] ],
      \   'right': [ [ 'fileformat', 'fileencoding', 'percent' ] ]
      \ }
      \ }

" vim-buftabline
let g:buftabline_show=1 " show buffer list if there are two or more buffers
let g:buftabline_numbers=1 " show buffer number
let g:buftabline_indicators=1 " 標示 buffer 已改變

"-------------------
" SEARCH AND REPLACE
"-------------------
set incsearch " 隨打即找
set smartcase " 如果搜尋條件有大寫字母，才區分大小寫
set hlsearch " search highlighting


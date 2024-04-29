"-------------------
" ALL SETTING EFFECT
"-------------------
set nocompatible " not compatible with the old-fashion vi mode
set history=50 " ex 命令的歷史紀錄筆數

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
filetype indent on " Enable filetype-specific indenting
set smartindent " 使用 smart indent
source ~/.vim/config/indent_2_space.vim

autocmd FileType Makefile setlocal noexpandtab " <Tab> 在 makefile 有特殊意義，所以不要改插入 space

source ~/.vim/config/format_option.vim

"set showmatch " 輸入 ) 和 }，游標會自動跳轉到 ( 和 { 以確定成對，然後再跳回來
runtime macros/matchit.vim " 啟用 matchit 外掛

"-------------------
" THEME AND SYNTAX
"-------------------
syntax on " syntax highlight
colorscheme wombat256mod

set number

set wrap " 超過視窗大小就自動換行

" 啟用 256 色支援和 laststatus=2，lightline 才會正常顯示
set t_Co=256
" 啟用游標行
set cursorline
set laststatus=2
set noshowmode " 不顯示最底下 -- INSERT -- 提示
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'modified', 'readonly' ] ],
      \   'right': [ [ 'fileformat', 'fileencoding', 'percent' ] ]
      \ }
      \ }

"-------------------
" SEARCH AND REPLACE
"-------------------
set incsearch " 隨打即找
set smartcase " 如果搜尋條件有大寫字母，才區分大小寫
set hlsearch " search highlighting

"-------------------
" AUTO COMPLETE
"-------------------
set wildmenu " ex mode 自動補齊，會列出清單
set wildignore=*.o,*.class " 自動補齊不列出哪些檔案


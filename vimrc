"-------------------
" ALL SETTING EFFECT
"-------------------
set nocompatible " not compatible with the old-fashion vi mode
set mouse=a " 啟用滑鼠操作，選項參考 :h mouse
set history=50 " ex 命令的歷史紀錄筆數

" 設定 <Leader> 鍵是逗號，原來逗號的按鍵改成 g;
let g:mapleader=","
noremap g; ,

"-------------------
" PLUGIN
"-------------------
" 使用pathogen.vim 管理外掛
execute pathogen#infect()
" Pathogen includes a :Helptags command that automatically generates help tags for plugins
Helptags

filetype plugin on " Enable filetype-specific plugins

" 用 vim 打開目錄時，使用 Ranger，不是用 netrw
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" ,<space> 清除所有行尾空格
map <leader><space> :FixWhitespace<CR>

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

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"-------------------
" TEXT FORMAT
"-------------------
filetype indent on " Enable filetype-specific indenting
set smartindent " 使用 smart indent
set shiftwidth=2 " 使用 >> 命令縮排時，一次移動幾個 space
set expandtab " 按下 <Tab> 時改插入 space
set softtabstop=2 " 按下 <Tab> 時插入幾個 space

autocmd FileType Makefile setlocal noexpandtab " <Tab> 在 makefile 有特殊意義，所以不要改插入 space
autocmd FileType php setlocal shiftwidth=4 expandtab softtabstop=4 " php 遵守 PSR-2，縮排使用 4 個空格

" formatoptions: 文字格式化的選項
"   t：根據 textwidth 自動換行；
"   c：程式碼註解中自動換行，插入合適的註解開始字元
"   r：插入模式下在註解中輸入 return 時，插入合適的註解開始字元
"   q：可使用 gq 命令對註解格式化
"   n：識別編號列表，編號行的下一行的縮排由數字後的空白決定（與 2 衝突，需要 autoindent )
"   2：使用一段的第二行的縮排來格式化文字
"   l：在目前行長度超過 textwidth 時，不自動重新格式化
"   m：在多字節字符處可以折行，對中文特別有效（否則只在空白字符處折行）
"   M：在拼接兩行時（重新格式化，或者是手工使用 J 命令），如果前一行的結尾或後一行的開頭是多字節字符，則不插入空格，非常適合中文
"   Vim 預設是 tcq
set formatoptions+=mM

set pastetoggle=<F3> " 切換 paste 模式

"set showmatch " 輸入 ) 和 }，游標會自動跳轉到 ( 和 { 以確定成對，然後再跳回來
runtime macros/matchit.vim " 啟用 matchit 外掛

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=232 guibg=#080808
"-------------------
" THEME AND SYNTAX
"-------------------
syntax on " syntax highlight
colorscheme wombat256mod
set cursorline " 游標所在行加上標示

:set number

"--------------------------------
set wrap " 超過視窗大小就自動換行

" 啟用 256 色支援和 laststatus=2，lightline 才會正常顯示
set t_Co=256
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
nmap <leader>/ :nohl<CR> " ,/ turn off search highlighting

" <C-]> 如果有兩個以上，會自動選擇第一個，g<C-]> 則是列出清單供選擇
noremap <C-]> g<C-]>

"-------------------
" AUTO COMPLETE
"-------------------
" 在 ex mode 輸入 %%，自動帶入目前緩衝區所在目錄
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set wildmenu " ex mode 自動補齊，會列出清單
set wildignore=*.o,*.class " 自動補齊不列出哪些檔案

let s:tags_dictionary = expand('~/.cache') " all tags files store in ~/.cache
" create tags dictionary if not exists
if !isdirectory(s:tags_dictionary)
   silent! call mkdir(s:tags_dictionary, 'p')
endif

set tags+=~/.cache/tags " 設定 ctags 標籤檔位置
set notagrelative " tags 的內容使用絕對路徑
" 更新 ctags 檔
nnoremap <F5> :!ctags -R -f ~/.cache/tags --exclude=.git --exclude=vendor --exclude=node_modules --exclude=.github --exclude=public --exclude=storage<CR>

" 在 Insert mode 輸入兩個 ; 會在該行結尾加上 ; 後換行，並維持 Insert mode
" 方便需要用分號結束 statement 的程式語言，例如 PHP, Java, C, Rust
inoremap ;; <ESC>h2xA;<CR>

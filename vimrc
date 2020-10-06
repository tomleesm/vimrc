"-------------------
" ALL SETTING EFFECT
"-------------------
set nocompatible " not compatible with the old-fashion vi mode
set mouse=a " 啟用滑鼠操作，選項參考 :h mouse
set history=200 " ex 命令的歷史紀錄筆數

" 設定 <Leader> 鍵是逗號，原來逗號的按鍵改成 g;
let g:mapleader=","
noremap g; ,

"-------------------
" PLUGIN
"-------------------
" 使用pathogen.vim 管理外掛
execute pathogen#infect()

filetype plugin on " Enable filetype-specific plugins

" ,f 切換顯示 NERDTree
map <LEADER>f :NERDTreeToggle<CR>

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
"set backupdir=dic " 設定備份檔存放的目錄
set swapfile " 產生 swp 檔，備份緩衝區中的內容
set directory=/tmp " 設定 swap 檔存放的目錄
set autoread " auto reload when file is changed from outside
set autowriteall " auto write file when quit vim, change buffer or :make etc. See :help autowrite and autowriteall

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

set pastetoggle=<F5> " <F5> 切換 paste 模式

"set showmatch " 輸入 ) 和 }，游標會自動跳轉到 ( 和 { 以確定成對，然後再跳回來
runtime macros/matchit.vim " 啟用 matchit 外掛

" 離開 Vim 時，儲存程式碼摺疊，打開 Vim 時恢復
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"-------------------
" THEME AND SYNTAX
"-------------------
syntax on " syntax highlight
colorscheme wombat256mod
set cursorline " 游標所在行加上標示
set number relativenumber
set wrap " 超過視窗大小就自動換行

" air-line
Helptags " 產生 air-line Help tags
" 啟用 256 色支援和 laststatus=2，light-line 才會正常顯示
set t_Co=256
set laststatus=2
set noshowmode " 不顯示最底下 -- INSERT -- 提示
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ] ],
      \   'right': [ [ 'absolutepath' ],
      \              [ 'filetype', 'fileformat', 'fileencoding' ],
      \              [ 'modified', 'readonly' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
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

" replace the current word in all opened buffers
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun
map <leader>r :call Replace()<CR>

" <C-]> 如果有兩個以上，會自動選擇第一個，g<C-]> 則是列出清單供選擇
noremap <C-]> g<C-]>

"-------------------
" AUTO COMPLETE
"-------------------
" 在 ex mode 輸入 %%，自動帶入目前緩衝區所在目錄
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set wildmenu " ex mode 自動補齊，會列出清單
set wildignore=*.o,*.class " 自動補齊不列出哪些檔案

" 設定 path 為 Laravel 的資料夾，方便用 :find 打開檔案
set path+=app/**,resources/**,routes/**,bootstrap/**,database/**,tests/**,config/**,storage/**
" 設定 :make 來執行個別測試
set makeprg=php\ ./vendor/bin/phpunit\ %\ --stop-on-failure
" 按下 ,l 存檔並檢查 php 語法
autocmd FileType php noremap <LEADER>l :w!<CR>:!php -l %<CR>

let s:tags_dictionary = expand('~/.cache') " all tags files store in ~/.cache
" create tags dictionary if not exists
if !isdirectory(s:tags_dictionary)
   silent! call mkdir(s:tags_dictionary, 'p')
endif

set tags+=~/.cache/tags " 設定 ctags 標籤檔位置
set notagrelative " tags 的內容使用絕對路徑
" <F6> 更新 ctags 檔
nnoremap <F6> :!ctags -R -f ~/.cache/tags --exclude=.git --exclude=vendor --exclude=node_modules --exclude=.github --exclude=public --exclude=storage<CR>

" gf 跳轉要嘗試加上的副檔名
set suffixesadd+=.php,..html,.htm,.js,.css

"-------------------
" SNIPPETS
"-------------------
nnoremap <LEADER>pclass :-1read $HOME/.vim/snippets/class.php<CR>
nnoremap <LEADER>pm :-1read $HOME/.vim/snippets/method.php<CR>
nnoremap <LEADER>html :-1read $HOME/.vim/snippets/template.html<CR>
nnoremap <LEADER>if :-1read $HOME/.vim/snippets/if<CR>
nnoremap <LEADER>eif :-1read $HOME/.vim/snippets/eif<CR>
nnoremap <LEADER>clo :-1read $HOME/.vim/snippets/closure<CR>
nnoremap <LEADER>pfor :-1read $HOME/.vim/snippets/for.php<CR>
nnoremap <LEADER>pfore :-1read $HOME/.vim/snippets/foreach.php<CR>

"-------------------
" SPLIT WINDOW
"-------------------
" <C-J> 跳到下面的分割窗並放到最大
map <C-J> <C-W>j<C-W>_
" <C-K> 跳到上面的分割窗並放到最大
map <C-K> <C-W>k<C-W>_
" <C-H> 跳到左邊的分割窗並放到最大
nmap <C-H> <C-W>h<C-W><bar>
" <C-L> 跳到右邊的分割窗並放到最大
nmap <C-L> <C-W>l<C-W><bar>
set wmw=1 " 設定最小寬度為1，可以最大化寬度，又能提醒自己有分割視窗存在
set wmh=1 " 設定最小高度為1，可以最大化高度，又能提醒自己有分割視窗存在

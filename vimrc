" 使用pathogen.vim 管理外掛
execute pathogen#infect()

set nocompatible " not compatible with the old-fashion vi mode
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins
set mouse=a " 啟用滑鼠操作，選項參考 :h mouse

" 設定 <Leader> 鍵是逗號，原來逗號的按鍵改成 g;
let g:mapleader=","
noremap g; ,

if has("win16") || has("win32") || has("win64") || has("win95")
  let dic="c:\\Temp"
elseif has("unix")
  let dic="/tmp"
else
  let dic=.
endif

set hidden " 切換緩衝區時，不再提示未存檔，改在離開 Vim 時提示存檔
set nobackup " 不要產生修改前的備份檔，也就是 *.*~
"set backupdir=dic " 設定備份檔存放的目錄
set swapfile " 產生 swp 檔，備份緩衝區中的內容
set directory=. " 設定 swap 檔存放的目錄
set autoread " auto reload when file is changed from outside

set number " 顯示行數
set wrap " 超過視窗大小就自動換行

set smartindent " 使用 smart indent
set shiftwidth=2 " 指由 >> 縮排時，一次移動幾個 space
set expandtab " 按下 <Tab> 時改插入 space
set softtabstop=2 " 按下 <Tab> 時插入幾個 space
au FileType Makefile set noexpandtab " <Tab> 在 makefile 有特殊意義，所以不要改插入 space

" formatoptions: 文字格式化的選項
"   t：根據 textwidth 自動換行；
"   c：程式碼註解中自動換行，插入合適的註解開始字元
"   r：插入模式下在註解中輸入 return 時，插入合適的註解開始字元
"   q：可使用 gq 命令對註解格式化
"   n：識別編號列表，編號行的下一行的縮排由數字後的空白決定（與「2」衝突，需要「autoindent」)
"   2：使用一段的第二行的縮排來格式化文字
"   l：在目前行長度超過 textwidth 時，不自動重新格式化
"   m：在多字節字符處可以折行，對中文特別有效（否則只在空白字符處折行）
"   M：在拼接兩行時（重新格式化，或者是手工使用「J」命令），如果前一行的結尾或後一行的開頭是多字節字符，則不插入空格，非常適合中文
"   Vim 預設是 tcq
set formatoptions+=mM

"-------------------
" ENCODING SETTINGS
"-------------------
set encoding=utf-8 " Vim 的內部使用編碼，例如 register 的文字編碼
set termencoding=utf-8 " Vim 輸出到 terminal 顯示的編碼
set fileencoding=utf-8 " 新增檔案時使用的編碼
set fileencodings=ucs-bom,utf-8,taiwan,big5,gb2312,latin1 " 嘗試使用哪些編碼來打開檔案

syntax on " syntax highlight
colorscheme wombat256mod
set cursorline " 游標所在行加上標示
set hlsearch " search highlighting
set incsearch " 隨打即找
set smartcase " 如果搜尋條件有大寫字母，才區分大小寫

set history=200 " ex 命令的歷史紀錄筆數

" 在 ex mode 輸入 %%，自動帶入目前緩衝區所在目錄
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

runtime macros/matchit.vim " 啟用 matchit 外掛

set tags+=, " 設定 ctags 標籤檔位置，加上目前的工作目錄

set pastetoggle=<f5> " 設定 <F5> 切換 paste 模式

" air-line
Helptags " 產生 air-line Help tags
set t_Co=256 " 啟用 256 色支援，air-line theme 才會正常顯示
let g:airline_theme='powerlineish' " 使用哪個 theme

set showmatch " 輸入 ) 和 }，游標會自動跳轉到 ( 和 { 以確定成對，然後再跳回來
set wildmenu " ex mode 自動補齊，會列出清單
set wildignore=*.o,*.class " 自動補齊不列出哪些檔案

" C/C++ specific settings
autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" replace the current word in all opened buffers
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun
map <leader>r :call Replace()<CR>

" 在分割視窗中移動
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

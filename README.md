## 我的 Vim 設定和外掛

![screenshot](./screenshot.png)

### 安裝

```
# 如果要用 UltiSnips，需要移除一般的 vim，改裝 vim-gtk
git clone https://github.com/tomleesm/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init
```

#### 新增外掛：
```
cd ~/.vim; git submodule add {github-url} bundle/{plugin}
```

#### 刪除外掛：
```
cd ~/.vim; rm -rf bundle/{plugin}
git rm bundle/{plugin} # 會自動修改 .gitmodule
```

#### 還原刪除的外掛：
```
git submodule add --force {github-url} bundle/{plugin}
```

### 安裝的外掛：

- [commentary.vim](https://github.com/tpope/vim-commentary): 可用 `gcc` 或 `gc {motion}` 註解
- [unimpaired.vim](https://github.com/tpope/vim-unimpaired): 各種成對操作。 `]q` 是 `:cnext`, `[q` 是 `:cprevious`. `]a` 是 `:next`. `[b` 是 `:bprevious`, `[<Space>` 和 `]<Space>` 是在上一行和下一行新增一行，等於大寫 `O<Esc>`
- [surround.vim](https://github.com/tpope/vim-surround): 用 visual mode 選取後, `S{` 是加上 `{}`， `cs{[` 是把 `{}` 改成 `[]`。repeat.vim 雖然支援用 `.` 重複 surround.vim 命令，但是不支援 visual mode `S{`
- [vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search): 用 visual mode 選取後，按 `*` 或 `#` 可以搜尋或反向搜尋，按 `,*` 則是用 vimgrep 搜尋
- [vim-abolish](https://github.com/tpope/vim-abolish): 交換兩個字串，轉換命名方式(blogTitle 轉成 blog_title, blig-title, BlogTitle, BLOG_TITLE)
- [ack.vim](https://github.com/mileszs/ack.vim): 在 Vim 內用 ack 搜尋檔案
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): 一堆語法 highlight 支援
- [html5.vim](https://github.com/othree/html5.vim): html5 omni-completion
- [airline](https://github.com/vim-airline/vim-airline) 和 [airline-themes](https://github.com/vim-airline/vim-airline-themes): 華麗的狀態列，覺得 powerline 安裝麻煩，所以用 airline。安裝後原先顯示在狀態列第一行的都不會顯示，例如 `:args`
- [NERDTree](https://github.com/scrooloose/nerdtree): 資料夾清單，按 `<F6>` 切換顯示，因為它是分割視窗，所以可以使用相關按鍵操作
- [UltiSnips](https://github.com/SirVer/ultisnips): 輸入 `ife<Tab>` 自動帶入 `if() {} else {}` 。需要 Vim 支援 python3，所以安裝的是 vim-gtk，gvim 只支援python2
- [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace): 自動標示行尾空格，並設定 `,<space>` 全部清除
- [fugitive.vim](https://github.com/tpope/vim-fugitive): Git Wrapper for Vim (只是為了在 airline 顯示分支名稱)
- [delimitMate](https://github.com/Raimondi/delimitMate): 自動補齊括號和引號。`<Shift><Tab>` 移動游標到自動補齊的括號或引號之後

### remap Caps Lock to Ctrl, and Ctrl is still Ctrl

#### Linux

```
sudo vim /etc/default/keyboard
新增 XKBOPTIONS="ctrl:nocaps"
重新啟動系統
```

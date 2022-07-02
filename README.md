## 我的 Vim 設定和外掛

![screenshot](./screenshot.png?raw=true)

### 安裝

```bash
# 如果需要支援 python3，改裝 vim-gtk
# 因爲啓用 2FA，更新時需要用 ssh，所以不是 https
git clone git@github.com:tomleesm/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init

# install ack for ack.vim
wget https://beyondgrep.com/ack-v3.4.0 -O ack
chmod +x ack
sudo cp ack /usr/bin/
rm ack

# install exuberant-ctags
sudo apt install exuberant-ctags
```

#### 新增外掛：

```
git submodule add {github-url} bundle/{plugin}
```

#### 刪除外掛：

```
rm -rf bundle/{plugin}
git rm bundle/{plugin} # 會自動修改 .gitmodule
```

#### 還原刪除的外掛：

```
git submodule add --force {github-url} bundle/{plugin}
git submodule update --init
```

### 安裝的外掛：

- [commentary.vim](https://github.com/tpope/vim-commentary): 可用 `gcc` 或 `gc {motion}` 註解
- [unimpaired.vim](https://github.com/tpope/vim-unimpaired): 各種成對操作。 `]q` 是 `:cnext`, `[q` 是 `:cprevious`. `]a` 是 `:next`. `[b` 是 `:bprevious`, `[<Space>` 和 `]<Space>` 是在上一行和下一行新增一行，等於大寫 `O<Esc>`
- [vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search): 用 visual mode 選取後，按 `*` 或 `#` 可以搜尋或反向搜尋，按 `,*` 則是用 vimgrep 搜尋
- [ack.vim](https://github.com/mileszs/ack.vim): 在 Vim 內用 ack 搜尋檔案
- [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace): 自動標示行尾空格，並設定 `,<space>` 全部清除
- [fugitive.vim](https://github.com/tpope/vim-fugitive): Git Wrapper for Vim
- [gv.vim](https://github.com/junegunn/gv.vim): 顯示 git log 和每個 commit 修改了什麼
- [NERDTree](https://github.com/preservim/nerdtree): 側邊欄檔案管理
- [vim-buftabline](https://github.com/ap/vim-buftabline): 顯示 buffer 分頁。air-line 提供的分頁字太大，也不會顯示右邊是否有其他分頁
- [lightline.vim](https://github.com/itchyny/lightline.vim): 底下的狀態列
- [vim-easy-align](https://github.com/junegunn/vim-easy-align): 方便對齊等號、空格
- [vim-polyglot](https://github.com/sheerun/vim-polyglot): 各種語法 highlight 支援
- [vim-signature](https://github.com/kshenoy/vim-signature): 左邊的 navigate marks highlight 顯示
- [auto-pairs](https://github.com/jiangmiao/auto-pairs): 輸入左括號，會自動產生右括號
- [cosco.vim](https://github.com/lfilho/cosco.vim): 在 normal 和 insert mode 輸入 `<LEADER>;`，會在結尾輸入分號，同時保留原有的位置和模式，`<LEADER>,` 則是逗號

### remap Caps Lock to Ctrl, and Ctrl is still Ctrl

#### Linux

```
sudo vim /etc/default/keyboard
新增 XKBOPTIONS="ctrl:nocaps"
重新啟動系統
```

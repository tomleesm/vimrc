" php 遵守 PSR-2，縮排使用 4 個空格
setlocal shiftwidth=4 expandtab softtabstop=4
" 設定 path 為 Laravel 的資料夾，方便用 :find 打開檔案
set path+=app/**,resources/**,routes/**,bootstrap/**,database/**,tests/**,config/**,storage/**

" 在 Insert mode 輸入兩個 ; 會在該行結尾加上 ; 後換行，並維持 Insert mode
" 方便需要用分號結束 statement 的程式語言，例如 PHP, Java, C, Rust
inoremap ;; <ESC>A;<CR>

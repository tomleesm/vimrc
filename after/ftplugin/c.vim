" 在 Insert mode 輸入兩個 ; 會在該行結尾加上 ; 後換行，並維持 Insert mode
" 方便需要用分號結束 statement 的程式語言，例如 PHP, Java, C, Rust
inoremap ;; <ESC>A;<CR>
" press <F2> to compile and run program
nnoremap <F2> :! gcc % && ./a.out<CR>

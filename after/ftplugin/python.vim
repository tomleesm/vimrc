" 在 Insert mode 輸入兩個 : 會在該行結尾加上 : 後換行，並維持 Insert mode
" 方便 Python 的 function 和迴圈第一行結尾加上冒號
inoremap :: <ESC>A:<CR>

inoremap <TAB>me <ESC>:-1read $HOME/.vim/snippets/python/method<CR>

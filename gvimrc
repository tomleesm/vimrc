set guifont=Source\ Code\ Pro\ 12
" enable 'easy mode'
source $VIMRUNTIME/evim.vim

" Ctrl + q to get out of vim
inoremap <c-q> <c-o>:q<cr>

" Ctrl + f to begin searching
inoremap <c-f> <c-o>/

" Ctl + f (x2) to stop highlighting the search results
inoremap <c-f>f <c-o>:nohlsearch<cr>
inoremap <c-f><c-f> <c-o>:nohlsearch<cr>

" F3 go to the previous match
inoremap <F3> <c-o>:normal Nzz<cr>

" F4 go to the next match
inoremap <F4> <c-o>:normal nzz<cr>

" Ctrl + h begin a search and replace
inoremap <c-h> <c-o>:%s///gc<Left><Left><Left><Left>

set guifont=Source\ Code\ Pro\ 12
" enable 'easy mode'
source $VIMRUNTIME/evim.vim

" Ctrl + Q to get out of vim
inoremap <C-Q> <C-O>:q<CR>

" Ctrl + F to begin searching
inoremap <C-F> <C-O>/

" Ctl + F (x2) to stop highlighting the search results
inoremap <C-F>f <C-O>:nohlsearch<CR>
inoremap <C-F><C-F> <C-O>:nohlsearch<CR>

" F3 go to the previous match
inoremap <F3> <C-O>:normal Nzz<CR>

" F4 go to the next match
inoremap <F4> <C-O>:normal nzz<CR>

" Ctrl + H begin a search and replace
inoremap <C-H> <C-O>:%s///gc<Left><Left><Left><Left>

" vim-buftabline
let g:buftabline_show=1 " show buffer list if there are two or more buffers
let g:buftabline_numbers=1 " show buffer number
let g:buftabline_indicators=1 " 標示 buffer 已改變

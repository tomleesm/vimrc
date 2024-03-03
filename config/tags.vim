let s:tags_dictionary = expand('~/.cache') " all tags files store in ~/.cache
" create tags dictionary if not exists
if !isdirectory(s:tags_dictionary)
   silent! call mkdir(s:tags_dictionary, 'p')
endif

set tags+=~/.cache/tags " 設定 ctags 標籤檔位置
set notagrelative " tags 的內容使用絕對路徑
" 更新 ctags 檔
nnoremap <F5> :!ctags -R -f ~/.cache/tags --exclude=.git --exclude=vendor --exclude=node_modules --exclude=.github --exclude=public --exclude=storage<CR>

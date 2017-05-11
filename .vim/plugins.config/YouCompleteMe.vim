" Always use an extra ycm conf file from home.
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" Don't prompt when using the extra ycm conf.
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_insertion=1

noremap <silent> <f6> :YcmCompleter FixIt<cr>
noremap <silent> <c-t> :YcmCompleter GetType<cr>

" ctags and jump mappings too here, sorry
noremap <f9> <c-]>
noremap <silent> <a-space><f9> :tab sp<cr>:call feedkeys("\<f9>")<cr>
noremap <silent> <leader><f9> :YcmCompleter GoTo<cr>
noremap <silent> <a-space><leader><f9> :tab sp<cr>:call feedkeys("\<leader>\<f9>")<cr>
noremap <f10> <c-o>
noremap <leader><f10> <c-t>
noremap <f11> <c-i>
noremap <silent> <f12> :YcmCompleter GoToInclude<cr>

" Less commonly used mappings.
noremap <silent> <leader>gp :YcmCompleter GetParent<cr>
noremap <silent> <leader>gr :YcmCompleter GoToReferences<cr>
noremap <silent> <leader>gd :YcmCompleter GetDoc<cr>

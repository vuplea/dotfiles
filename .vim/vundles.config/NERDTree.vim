noremap <silent> <f7> :NERDTreeToggle<cr>
if has('nvim')
    tnoremap <silent> <f7> <c-\><c-n>:NERDTreeToggle<cr>
endif

noremap <silent> <leader>nn :NERDTreeFocus<cr>
noremap <silent> <leader>nt :NERDTreeToggle<cr>
noremap          <leader>nb :NERDTreeFromBookmark<space>
noremap <silent> <leader>nf :NERDTreeFind<cr>

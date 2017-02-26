" Always open the buffer in the bufexplorer window
let g:bufExplorerFindActive=0
let g:bufExplorerShowRelativePath=1


" Alt+e opens buf explorer, so that it works from nvim terminal
noremap <silent> <a-e> :ToggleBufExplorer<cr>
if has('nvim')
    tnoremap <silent> <a-e> <c-\><c-n>:ToggleBufExplorer<cr>
endif

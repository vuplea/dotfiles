set guioptions=

if has("gui_win32")
    set guifont=Consolas:h11:cDEFAULT   " font options
    set linespace=-1                 " pixels between lines
    set lines=40 columns=120
    noremap <silent> <f11> <esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>
endif

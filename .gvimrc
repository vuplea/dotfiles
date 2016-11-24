set guioptions=


if has("gui_win32")
    set guifont=Consolas:h11:cDEFAULT   " font options
    set linespace=-1                 " pixels between lines

    noremap <silent> <f11> <esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>

    " Start maximized.
    autocmd GUIEnter * simalt ~x
else
    set guifont=DejaVu\ Sans\ Mono\ 11  " font options
    set linespace=-1                    " pixels between lines

    noremap <silent> <f11> <esc>:call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

    " Start maximized.
    autocmd GUIEnter * call system("wmctrl -i -b add,maximized_vert,maximized_horz -r " . v:windowid)
endif

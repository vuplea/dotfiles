" Language options
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_cpp_compiler_options='-std=c++14 -Wall -Wextra'

" Fill location list.
let g:syntastic_always_populate_loc_list=1
" Run syntax checker when opening a file
let g:syntastic_check_on_open=1
" Don't run syntax checker when closing a window
let g:syntastic_check_on_wq=0

" Symbols
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_style_warning_symbol='·'
let g:syntastic_style_error_symbol='·'

" Language options
let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_cpp_compiler_options='-std=c++14 -Wall -Wextra'


" Run syntax checker when opening a file
let g:syntastic_check_on_open=1
" Don't run syntax checker when closing a window
let g:syntastic_check_on_wq=0

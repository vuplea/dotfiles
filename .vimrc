" Vim wants _vim or something similar on windows.
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after


"------ Encoding settings ------
silent! set encoding=utf-8

" Avoid an error when resourcing from an unmodifiable buffer.
if &modifiable
    set fileformats=unix,dos
endif


"------ General ------
colorscheme vandy
set foldlevel=9999      " unfold everything when opening a file
set foldmethod=indent   " define folds by indentation
set hidden              " don't unload buffers not open in any window
set history=9999        " remember these many commands and searches
set mouse=a             " enable mouse in normal, visual, insert, command-line
set noerrorbells        " never trigger an error sound
set novisualbell        " never trigger an error flash
set splitbelow          " a new horizontal split is placed below, not above
set splitright          " a new vertical split is placed to the right, not left
set timeoutlen=500      " wait these many milliseconds between a map's keys
" Enable manually, annoying on windows
" set undofile            " set persistent undo.

" Set the clipboard to the system clipboard.
silent! if has('clipboard')
    set clipboard=unnamed,unnamedplus
endif

" Enable filetype detection, scripts and indent-scripts.
filetype plugin indent on

" Nvim terminal settings.
if has('nvim')
    let g:terminal_scrollback_buffer_size=100000
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'terminal' | endif
endif


"------ Indents and tabs ------
set autoindent      " indent a newline using the current one's level
set cindent         " use c-like indenting

" Tabs are replaced with spaces, indentation is 4 characters.
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4


"------ Console UI & Text display ------
set showcmd             " show partial command in the bot-right
set scrolloff=8         " start scrolling when within these many lines of edge
set report=0            " always report how many lines were changed
set shortmess=filmnrxI  " make sure exactly these options are set
silent! set shortmess+=F
set list                " display whitespaces
set listchars=tab:»\ ,trail:·   " symbols for whitespaces
set wildmenu                    " enable cycling through tab completion options
set wildmode=list:longest,full
set wildignorecase              " ignore case when autocompleting
set laststatus=0
set ruler

" Ignore these files when autocompleting.
set wildignore=*.obj,*.o,*~,*.pyc
set wildignore+=__pycache__
set wildignore+=*.so,*.a,*.dll
set wildignore+=*.out,*.exe,*.com
set wildignore+=*DS_Store*
set wildignore+=.git/*,.hg/*,.svn/*


"------ Text editing and searching behavior ------
" Turn on syntax highlighting, keeping current settings.
if !exists("g:syntax_on")
    syntax enable
endif

set incsearch       " search as we type
set ignorecase      " make search case-insensitive
set smartcase       " make search case-sensitive if it contains upper-case chars
set hlsearch        " highlight search results
set showmatch       " highlight matching bracket
set matchtime=2     " tenths of a second to show the matching bracket
set textwidth=80
set formatoptions=croqnj

" Allow backspace to delete indents, newlines and characters past insert-start.
set backspace=indent,eol,start


"------ Plugins config ------
" We need to set the map leader before the plugins & their settings are loaded.
let mapleader="\<space>"


" Load all plugins.
let plugins_path=expand($HOME . "/.vim/plugins.vim")
if filereadable(plugins_path)
    exe 'source' plugins_path
endif


"------ User shortcuts, commands ------
nnoremap <silent> <c-s> :w!<cr>
nnoremap <silent> <leader>w :w!<cr>
cnoremap w!! SudoWrite sudo:%
set wildcharm=<tab>
cnoremap <c-space> %:p:h/<tab>

" vup: C-a visual all, C-q increment
nnoremap <silent> <c-a> gg0VG$
nnoremap <silent> <c-q> <c-a>

" Make typing commands easier. We still keep the functionality of the semicolon.
noremap ; :
noremap \ ;

" Space toggles folds in normal mode (if any).
nnoremap <silent> <space> @=(foldlevel('.')?'zA':"\<space>")<cr>

" Some stuff breaks if $MYVIMRC is a symlink, so follow it.
command! Ev tabedit $MYVIMRC
command! Sv source $MYVIMRC

" Pressing * or # in visual mode searches for the current selection.
vnoremap * y/<c-r>"<cr>
vnoremap # y?<c-r>"<cr>

" Sometimes the color column is annoying.
function! _ToggleColorColumn()
    if &colorcolumn == ""
        if exists('b:__old_colorcolumn')
            let &colorcolumn=b:__old_colorcolumn
        else
            if &textwidth != 0
                let &colorcolumn=&textwidth+1
            else
                let &colorcolumn=81
            endif
        endif
    else
        let b:__old_colorcolumn=&colorcolumn
        let &colorcolumn=""
    endif
endfunction
command! -complete=command ToggleColorColumn call _ToggleColorColumn()

nnoremap <silent> <f3> :ToggleColorColumn<cr>


"------ Global shortcuts ------
" Uniform mappings that can be used from neovim's terminal.

" Make it easy to close stuff (remember that 'hidden' is set).
noremap <silent> <a-q> :q<cr>
noremap <silent> <a-backspace> :lclose<cr>:bdelete<cr>
noremap <silent> <leader><backspace> :lclose<cr>:bdelete<cr>
" Note that :Bdelete is provided by a plugin.

noremap <silent> <a-n> :tabedit<cr>

" Both <f1> opening terminal help and highlighting are annoying.
noremap <silent> <f1> <esc>:nohlsearch<cr>

" Like windo but restore the current window and don't end in insert.
function! _Windo(command)
    let l:__current_window=winnr()
    execute 'windo ' . a:command
    stopinsert
    execute l:__current_window . 'wincmd w'
endfunction
command! -nargs=+ -complete=command Windo call _Windo(<q-args>)

" Toggle the line numbers of all windows in the current tab.
" On first use, it will turn them on.
" This is useful when debugging from a terminal split and you want to see line
" numbers in all visible source files.
function! _ToggleTabLineNumbers()
    if !exists('t:__old_linenumbers')
        let t:__old_linenumbers=0
    endif

    " Toggle numbers in modifiable, non-terminal windows.
    Windo if &modifiable && &buftype !~ "terminal" |
        \     let &number=!t:__old_linenumbers |
        \ endif

    let t:__old_linenumbers=!t:__old_linenumbers
endfunction
command! -complete=command ToggleTabLineNumbers call _ToggleTabLineNumbers()
nnoremap <silent> <f4> :ToggleTabLineNumbers<cr><esc>

" Fold all toggle
noremap <f5> zi

if has('nvim')
    " Normal escape in terminal. Ctrl+Alt+e to send an Escape through.
    tnoremap <esc> <c-\><c-n>
    tnoremap <c-a-e> <esc>

    " Always start insert when entering a terminal buffer.
    autocmd BufEnter * if &buftype == "terminal" | startinsert | endif

    command! Tsplit split | terminal
    command! Tvsplit vsplit | terminal
    command! Ttabedit tabedit | terminal
    noremap <a-t> :Ttabedit<cr>
    tnoremap <a-t> <c-\><c-n>:Ttabedit<cr>
    tnoremap <a-n> <c-\><c-n>:tabedit<cr>
    tnoremap <a-q> <c-\><c-n>:q<cr>
    tnoremap <silent> <f1> <c-\><c-n>:nohlsearch<cr>gi

    " The BufEnter event is triggered, no need to return to insert explicitly.
    tnoremap <silent> <f4> <c-\><c-n>:ToggleTabLineNumbers<cr>
endif


" The following mappings help with moving between splits & tabs and moving tabs
" with the same shortcuts for regular and terminal buffers (if using nvim).
noremap <a-h> <c-w>h
noremap <a-j> <c-w>j
noremap <a-k> <c-w>k
noremap <a-l> <c-w>l
noremap <a-i> gT
noremap <a-o> gt
noremap <silent> <c-a-i> :execute "tabmove" tabpagenr() - 2<cr>
noremap <silent> <c-a-o> :execute "tabmove" tabpagenr() + 1<cr>

if has('nvim')
    tnoremap <a-h> <c-\><c-n><c-w>h
    tnoremap <a-j> <c-\><c-n><c-w>j
    tnoremap <a-k> <c-\><c-n><c-w>k
    tnoremap <a-l> <c-\><c-n><c-w>l
    tnoremap <a-i> <c-\><c-n>gT
    tnoremap <a-o> <c-\><c-n>gt
    tnoremap <silent> <c-a-i> <c-\><c-n>:execute "tabmove" tabpagenr() - 2<cr>
    tnoremap <silent> <c-a-o> <c-\><c-n>:execute "tabmove" tabpagenr() + 1<cr>
endif


"------ Load .localvimrc ------
let localvimrc_path=expand($HOME . "/.lvimrc")
if filereadable(localvimrc_path)
    exe 'source' localvimrc_path
endif

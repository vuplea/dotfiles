" Attempt to source the plugin manager.
let manager_path=expand($HOME . "/.vim/plugins/vim-plug/plug.vim")
if ! filereadable(manager_path)
    finish
endif
exe 'source' manager_path


" Silent to not show error if git is missing
silent! call plug#begin('~/.vim/plugins/')

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" A code-completion engine for Vim
if !has("windows")
    Plug 'Valloric/YouCompleteMe'
endif

" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer', { 'on': 'ToggleBufExplorer' }

" Vim syntax highlighting for c, bison, flex
Plug 'justinmk/vim-syntax-extra'

" GLSL highlighting
Plug 'beyondmarc/glsl.vim'

" Powershell highlighting
Plug 'PProvost/vim-ps1'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Delete buffers and close files in Vim without messing up your layout.
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Rename a buffer within Vim and on disk
Plug 'Rename', { 'on': 'Rename' }

" Pasting in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" A tree file explorer plugin
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Allows one to edit a file with privileges from an unprivileged session.
Plug 'vim-scripts/sudo.vim'

" Swap your windows without ruining your layout
Plug 'wesQ3/vim-windowswap'

" Miscellaneous auto-load Vim scripts
Plug 'xolox/vim-misc'

" Extended session management for Vim
Plug 'xolox/vim-session'

" A plugin of NERDTree showing git status
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

call plug#end()
" load all plugin settings
let settings = expand($HOME . "/.vim/plugins.config/")
for fpath in split(globpath(settings, '*.vim'), '\n')
    exe 'source' fpath
endfor

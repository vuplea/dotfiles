" Plugin configurations
"
" All plugins here are sorted alphabetically (for lack of a better order), case
" insensitive ('Ab' comes before 'ac' but after 'aa'). Case-sorting should
" occur only as a secondary criteria ('nAme' comes before 'name').
"
" The description provided above the plugin is (usually) the short description
" from github and it should hopefully indicate the usefulness of a plugin.
call plug#begin('~/.vim/plugins/')

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" A code-completion engine for Vim
Plug 'Valloric/YouCompleteMe'

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Approximate colorschemes to 256 if necessary
Plug 'godlygeek/csapprox'

" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer', { 'on': 'ToggleBufExplorer' }

" Vim syntax highlighting for c, bison, flex
Plug 'justinmk/vim-syntax-extra'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

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

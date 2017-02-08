" Plugin configurations
"
" All plugins here are sorted alphabetically (for lack of a better order), case
" insensitive ('Ab' comes before 'ac' but after 'aa'). Case-sorting should
" occur only as a secondary criteria ('nAme' comes before 'name').
"
" The description provided above the plugin is (usually) the short description
" from github and it should hopefully indicate the usefulness of a plugin.

filetype off                  " required by vundle

set runtimepath+=~/.vim/plugins/Vundle.vim
set runtimepath+=~/.vim/plugins/

call vundle#begin('~/.vim/plugins/')

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" A code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Approximate colorschemes to 256 if necessary
Plugin 'godlygeek/csapprox'

" BufExplorer Plugin for Vim
Plugin 'jlanzarotta/bufexplorer'

" Vim syntax highlighting for c, bison, flex
Plugin 'justinmk/vim-syntax-extra'

" Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'

" Delete buffers and close files in Vim without messing up your layout.
Plugin 'moll/vim-bbye'

" Better whitespace highlighting for Vim
Plugin 'ntpeters/vim-better-whitespace'

" Rename a buffer within Vim and on disk
Plugin 'Rename'

" Pasting in Vim with indentation adjusted to destination context
Plugin 'sickill/vim-pasta'

" Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'

" A tree file explorer plugin
Plugin 'scrooloose/nerdtree'

" Allows one to edit a file with privileges from an unprivileged session.
Plugin 'vim-scripts/sudo.vim'

" Swap your windows without ruining your layout
Plugin 'wesQ3/vim-windowswap'

" Miscellaneous auto-load Vim scripts
Plugin 'xolox/vim-misc'

" Extended session management for Vim
Plugin 'xolox/vim-session'

" A plugin of NERDTree showing git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()


filetype plugin indent on    " required by vundle
" load all plugin settings
let settings = expand($HOME . "/.vim/plugins.config/")
for fpath in split(globpath(settings, '*.vim'), '\n')
    exe 'source' fpath
endfor

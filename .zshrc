# Zsh quick shorcut ref
hotkeys() {
cat << XXX
^a Beginning of line
^e End of line
^f Forward one character
^b Back one character
^h Delete one character
%f Forward one word
%b Back one word
^w Delete one word
^u Clear to beginning of line
^k Clear to end of line
^y Paste from Kill Ring
^p Previous line in history
^n Next line in history
^o Execute command but keep line
XXX
}

# GRML upstream
[[ -f ~/.zsh/grml-arch.zsh ]] && source ~/.zsh/grml-arch.zsh

# Antigen plugins
export ADOTDIR=~/.zsh/.antigen-cache
export ZSH_CACHE_DIR=~/.zsh/.antigen-cache
[[ -f ~/.zsh/antigen-repo/antigen.zsh ]] && source ~/.zsh/antigen-repo/antigen.zsh

antigen bundle common-aliases
antigen bundle dirhistory
antigen bundle fancy-ctrl-z
antigen bundle git
antigen bundle last-working-dir
antigen bundle sudo
antigen bundle wd
antigen bundle z
antigen bundle nilsonholger/osx-zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Vars, aliases
export LC_ALL="en_US.UTF-8"
export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/bin/:$PATH"

# Set neovim up
if check_com -c vimpager; then
    export PAGER='vimpager'
fi

if check_com -c nvim; then
    export EDITOR='nvim'
    alias vi='nvim'
    alias vim='nvim'

    neovim_autocd() {
        [[ $NVIM_LISTEN_ADDRESS ]] && ~/bin/neovim-autocd.py
    }
    chpwd_functions+=( neovim_autocd )

    if [[ $NVIM_LISTEN_ADDRESS ]] && check_com -c nvim-host-cmd; then
        alias v=nvim-host-cmd
        alias e='nvim-host-cmd edit'
        alias tabe='nvim-host-cmd tabedit'
        alias sp='nvim-host-cmd split'
        alias vsp='nvim-host-cmd vsplit'
        alias bosp='nvim-host-cmd botright split'
    fi
fi

# needed by the wd plugin
wd() {
  . ~/bin/wd/wd.sh
}

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


# Load all plugins.
plugins_path="$HOME/.zsh/plugins.zsh"
if [[ -r "$plugins_path" ]]; then
    source "$plugins_path"
fi

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
    export VIMPAGER_VIM='nvim'
    alias vi='nvim'
    alias vim='nvim'

    if [[ $NVIM_LISTEN_ADDRESS ]] && check_com -c nvim-host-cmd; then
        # Change nvim host's cwd when cd-ing from within a terminal.
        neovim_autocd() {
            nvim-host-cmd "execute \"tcd\" fnameescape(\"`pwd`\")"
        }
        chpwd_functions+=( neovim_autocd )

        alias v=nvim-host-cmd
        alias e='nvim-host-cmd edit'
        alias tabe='nvim-host-cmd tabedit'
        alias sp='nvim-host-cmd split'
        alias vsp='nvim-host-cmd vsplit'
        alias bosp='nvim-host-cmd botright split'
    fi
fi

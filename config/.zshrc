# History of commands
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY


# Load plugins
source /etc/zsh/zplug.zsh
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

if ! zplug check --verbose; then
  zplug install
fi

zplug load

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down


# Export env var
export NIXCFG=$HOME/dev/repo/dotfiles/nixos/config.nix
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export RUFF_EXPERIMENTAL_FORMATTER=1
export OBSIDIAN_USE_WAYLAND=1


# x -> y
alias l="ll"
alias ll="eza -1abghlF --colour=always --group-directories-first --icons=always"
alias ls="eza -1bghlF --colour=always --group-directories-first --icons=always"
alias lt="eza -1bghlF --tree --colour=always --group-directories-first --icons=always"
alias cat="bat"
alias __cat="bat --plain --color=never --paging=never --style=plain"
alias grep="rg --color=always"
alias __grep="command grep"
alias vim="nvim"
eval "$(zoxide init --cmd cd zsh)"

# Shortening
alias rm="rm -i"
alias mv="mv -i"
alias c="clear"
alias s="sudo"
alias z="sh $HOME/dev/scripts/zellij-init.sh"
alias py="python3"
alias ssh="TERM=xterm-256color ssh"

# Generalization
alias fetch="sh ~/dev/scripts/fetch.sh"
alias copy="wl-copy"
alias nixbuild="sudo nixos-rebuild switch -I nixos-config=$NIXCFG"
alias nixdev="nix develop --command zsh"
alias nixgc="sudo nix-store --gc"

function nix(){ NIX_SHELL_NAME="$1" command nix "$@" }
function rr(){ "$@" > /dev/null 2>&1 & disown }
function xr(){ GDK_BACKEND=x11 "$@" }
function xrr(){ xr rr "$@" }


# Rename zellij tab to git repo name
chpwd() {
  if [[ "$ZELLIJ_SESSION_NAME" == "nvim" ]]; then
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      tab_name=$(basename "$(git rev-parse --show-toplevel)")
      command nohup zellij action rename-tab $tab_name >/dev/null 2>&1
    else
      command nohup zellij action rename-tab "Pane #?" >/dev/null 2>&1
    fi
  fi
}


# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null

# Start terminal emulator
eval "$(starship init zsh)"

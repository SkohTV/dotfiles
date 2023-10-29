# History of commands
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Load plugins
source /nix/store/$(ls -la /nix/store/ | grep antigen | grep '^d' | awk '{print $9}')/share/antigen/antigen.zsh
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# For zsh-history-substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# x -> y
alias ls="exa -1bghlF --colour=always --group-directories-first --icons"
alias ll="exa -1abghlF --colour=always --group-directories-first --icons"
alias lt="exa -1abghlF --tree --colour=always --group-directories-first --icons"
alias cat="bat"
alias grep="rg --color=always"
#alias nano="nvim"
alias vim="nvim"
alias __cat="bat --plain --color never --paging=never"

# General QoL
alias c="clear"
alias s="sudo"
alias df="df -h"
alias du="du -h"
alias free="free -m"
alias wget="wget -c"
alias ping="ping -c 5"
alias mkdir="mkdir -pv"
alias py="python3"

# Safety
alias rm="rm -i"
alias mv="mv -i"

# Shortening
alias copy=""
alias lock=""
alias sus="systemctl suspend"
alias nixbuild="sudo nixos-rebuild switch -I nixos-config=$HOME/dev/repo/dotfiles/etc/nixos/configuration.nix"

# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_ed25519 2> /dev/null 

# Start terminal emulator
eval "$(starship init zsh)"

# Export env var
export EDITOR=nvim

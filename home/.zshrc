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
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

if ! zplug check --verbose; then
  zplug install
fi

zplug load


# For zsh-history-substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# x -> y
alias ls="eza -1bghlF --colour=always --group-directories-first --icons"
alias ll="eza -1abghlF --colour=always --group-directories-first --icons"
alias lt="eza -1bghlF --tree --colour=always --group-directories-first --icons"
alias llt="eza -1bghlF --tree --colour=always --group-directories-first --icons"
alias cat="bat"
alias grep="rg --color=always"
alias __cat="bat --plain --color never --paging=never"
alias nano="nvim"
alias vim="nvim"

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
alias copy="xclip -selection copy"
alias lock="xsecurelock"
alias sus="systemctl suspend"
alias hib="systemctl hibernate"
alias nixbuild="sudo nixos-rebuild switch -I nixos-config=$HOME/dev/repo/dotfiles/etc/nixos/configuration.nix"
alias z="sh $HOME/dev/scripts/zellij-init.sh"

# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null

# Start terminal emulator
eval "$(starship init zsh)"


# Export env var
export NIXCFG=$HOME/dev/repo/dotfiles/etc/nixos/configuration.nix
export EDITOR=nvim

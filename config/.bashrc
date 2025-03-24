# History of commands
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE=50000
export HISTFILESIZE=50000
shopt -s histappend

bind '"\e[A": history-substring-search-backward'
bind '"\e[B": history-substring-search-forward'

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


export EDITOR=nvim
export NIXCFG="$HOME/dev/repo/dotfiles/nixos/config.nix"



# Aliases: simple
alias ll="eza -1abghlF --colour=always --group-directories-first --icons=always"
alias ls="eza -1bghlF --colour=always --group-directories-first --icons=always"
alias lt="eza -1bghlF --tree --colour=always --group-directories-first --icons=always"
alias cat="bat"
alias vim="nvim"
eval "$(zoxide init --cmd cd bash)"

# Aliases: short
alias c="clear"
alias s="sudo"
alias z="sh $HOME/dev/scripts/zellij-init.sh"
alias py="python3"
alias ssh="TERM=xterm-256color ssh"

# Aliases: long
alias copy="wl-copy"
alias nixbuild="sudo nixos-rebuild switch -I nixos-config=$NIXCFG"
alias nixgc="sudo nix-collect-garbage --delete-older-than 14d"


# Aliases: functions
function nix() {
  NIX_SHELL_NAME="$1" command nix "$@"
}

# function rr() {
#   "$@" > /dev/null 2>&1 & disown
# }
# function xr() {
#   GDK_BACKEND=x11 "$@"
# }
# function xrr() {
#   xr rr "$@"
# }


# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null

# Start terminal emulator
eval "$(starship init bash)"

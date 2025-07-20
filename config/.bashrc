# History of commands
export HISTCONTROL="ignoredups:erasedups"
export HISTSIZE=50000
export HISTFILESIZE=50000
shopt -s histappend

bind '"\e[A": history-substring-search-backward'
bind '"\e[B": history-substring-search-forward'

bind 'set show-all-if-ambiguous on'

export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

export EDITOR=nvim
export NH_FLAKE=/home/skoh/dev/repo/dotfiles/nixos


# Aliases: simple
alias ll='eza -1abghlF --colour=always --group-directories-first --icons=always'
alias ls='eza -1bghlF --colour=always --group-directories-first --icons=always'
alias lt='eza -1bghlF --tree --colour=always --group-directories-first --icons=always'
alias cat='bat'
alias vim='nvim'

# Aliases: short
alias c='clear'
alias ssh='TERM=xterm-256color ssh'
alias z='sh $HOME/dev/scripts/zellij-init.sh'
alias zr='zellij action rename-tab $(basename "$(git rev-parse --show-toplevel 2>/dev/null || echo -)")'

# Aliases: long
alias copy='wl-copy'
alias nixbuild='sudo nixos-rebuild switch --flake $HOME/dev/repo/dotfiles/nixos/'
alias homebuild='home-manager switch --flake $HOME/dev/repo/dotfiles/nixos/'
alias nixgc='sudo nix-collect-garbage --delete-older-than 14d'


# Aliases: functions
function nix() {
  NIX_SHELL_NAME="$1" command nix "$@"
}

# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/nixos 2> /dev/null

# Promt & cd
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

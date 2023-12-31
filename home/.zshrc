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


# x -> y
alias ll="eza -1abghlF --colour=always --group-directories-first --icons=always"
alias ls="eza -1bghlF --colour=always --group-directories-first --icons=always"
alias lt="eza -1bghlF --tree --colour=always --group-directories-first --icons=always"
alias cat="bat"
alias __cat="bat --plain --color never --paging never --style plain"
alias grep="rg --color=always"
alias __grep="rg --color=never"
alias nano="nvim"
alias vim="nvim"

# Shortening
alias rm="rm -i"
alias mv="mv -i"
alias c="clear"
alias s="sudo"
alias z="sh $HOME/dev/scripts/zellij-init.sh"
alias py="python3"

# Generalization
alias fetch="sh $HOME/dev/scripts/fetch.sh"
alias copy="xclip -selection copy"
alias lock="xsecurelock"
alias sus="systemctl suspend"
alias hib="systemctl hibernate"
alias nixbuild="sudo nixos-rebuild switch -I nixos-config=$HOME/dev/repo/dotfiles/etc/nixos/configuration.nix"


# Load github ssh
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github 2> /dev/null

# Start terminal emulator
eval "$(starship init zsh)"

# Export env var
export NIXCFG=$HOME/dev/repo/dotfiles/etc/nixos/configuration.nix
export EDITOR=nvim

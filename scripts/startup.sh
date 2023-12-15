obsidian --disable-gpu &
alacritty --class alacritty-main -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh main; exec $SHELL" &
alacritty --class alacritty-nvim -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh nvim; exec $SHELL" &
qutebrowser &
discord --disable-gpu &

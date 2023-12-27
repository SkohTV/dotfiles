obsidian --disable-gpui &
alacritty --class alacritty-home -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh home; exec $SHELL" &
alacritty --class alacritty-nvim -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh nvim; exec $SHELL" &
alacritty --class alacritty-main -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh main; exec $SHELL" &
brave &
discord --disable-gpu &

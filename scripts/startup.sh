#!/bin/sh


i3-msg 'workspace 5'
alacritty -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh nvim; exec $SHELL" &
sleep 0.3

i3-msg 'workspace 6'
alacritty -e zsh -c "sh $HOME/dev/scripts/zellij-init.sh main; exec $SHELL" &
sleep 0.3

i3-msg 'exec github-desktop'
i3-msg 'exec obsidian'
i3-msg 'exec brave'
i3-msg 'exec ytmdesktop --no-sandbox'
i3-msg 'exec discord'

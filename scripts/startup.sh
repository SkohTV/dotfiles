#!/bin/sh




i3-msg 'workspace 5; exec alacritty'
sleep 0.5
i3-msg 'workspace 6; exec alacritty'
sleep 0.5

i3-msg 'exec github-desktop'
i3-msg 'exec obsidian'
i3-msg 'exec brave'
i3-msg 'exec ytmdesktop --no-sandbox'
i3-msg 'exec discord'

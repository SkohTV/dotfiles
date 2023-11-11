#!/bin/bash

a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

RANDOM=$((a + b + c))
files=$(ls -l "$HOME/.config/wallpapers/" | grep "^-" | wc -l)
val=$((RANDOM % (files + 1)))

output="preload = $HOME/dev/repo/dotfiles/wallpapers/desktop/$val.jpg
#if more than one preload is desired then continue to preload other backgrounds
#preload = /path/to/next_image.png
# .. more preloads

#set the default wallpaper(s) seen on inital workspace(s) --depending on the number of monitors used
wallpaper = eDP-1,$HOME/dev/repo/dotfiles/wallpapers/desktop/$val.jpg
#if more than one monitor in use, can load a 2nd image
#wallpaper = monitor2,/path/to/next_image.png
# .. more monitors

# Battery opti
ipc = off"

echo "$output" > $HOME/.config/hypr/hyprpaper.conf

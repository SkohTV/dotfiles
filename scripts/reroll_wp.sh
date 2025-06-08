#!/usr/bin/env bash

new_wp=$(\
    find "$HOME"/.config/wallpapers/* -maxdepth 1 -regex '.*\.\(png\|jpg\)' | \
    shuf -n 1 \
)

unlink /home/skoh/.config/wallpapers/main
ln -s "$new_wp" /home/skoh/.config/wallpapers/main 
hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main 

echo "Refreshed wallpaper"

#!/usr/bin/env bash

a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

get_seeded_random()
{
  seed="$1"
  openssl enc -aes-256-ctr -pass pass:"$seed" -nosalt \
    </dev/zero 2>/dev/null
}

val=$(($a + $b*10 + $c*100))
new_wp=$(ls -l "$HOME/.config/wallpapers/" | grep -v ^l | shuf -n 1 --random-source=<(get_seeded_random $val))
new_wp=$(echo "$new_wp" | rev | cut -d' ' -f1 | rev)

unlink /home/skoh/.config/wallpapers/main
ln -s $new_wp /home/skoh/.config/wallpapers/main 

echo "Refreshed wallpaper"

hyprpaper

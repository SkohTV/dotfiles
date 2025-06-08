#!/usr/bin/env bash

a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

val=$(("$a" + "$b"*10 + "$c"*100))

function get_seeded_random() {
  seed="$1"
  openssl enc -aes-256-ctr -pass pass:"$seed" -nosalt \
    </dev/zero 2>/dev/null
}

new_wp=$(\
    find "$HOME"/.config/wallpapers/* -maxdepth 1 -regex '.*\.\(png\|jpg\)' | \
    shuf -n 1 --random-source=<(get_seeded_random $val) \
)

unlink /home/skoh/.config/wallpapers/main
ln -s "$new_wp" /home/skoh/.config/wallpapers/main 

echo "Refreshed wallpaper"

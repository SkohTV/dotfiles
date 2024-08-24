#!/usr/bin/env bash

a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

RANDOM=$(($a + $b + $c))
files=$(ls -l "$HOME/.config/wallpapers/" | grep "^-" | wc -l)
val=$((RANDOM % (files + 1)))

echo $val
# feh /home/skoh/.config/wallpapers/$val.jpg --bg-fill

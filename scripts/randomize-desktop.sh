#!/bin/bash

a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

RANDOM=$((a + b + c))
files=$(ls -l "$HOME/.config/wallpapers/" | grep "^-" | wc -l)
val=$((RANDOM % (files + 1)))

feh /home/qlpth/.config/wallpapers/$val.jpg --bg-fill

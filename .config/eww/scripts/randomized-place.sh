#!/bin/bash


a=$(date +"%d")
b=$(date +"%m")
c=$(date +"%y")

RANDOM=$((a + b + c))
MAX=30

val1=$((RANDOM % (30)))
val2=$((RANDOM % (30)))
val3=$((RANDOM % (30)))

#feh /home/qlpth/.config/wallpapers/$val.jpg --bg-fill
#feh /home/qlpth/.config/wallpapers/3.jpg --bg-fill

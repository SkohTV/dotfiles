#!/usr/bin/env bash

grim -o eDP-1 /tmp/screenlock.png
magick /tmp/screenlock.png -scale 20% -blur 0x2 -resize 200% /tmp/screenlock.png

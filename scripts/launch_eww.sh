#!/usr/bin/env bash

# Restart eww
if [[ ! $(pidof eww) ]]; then
  eww daemon
fi

# Close all
eww close-all


# Start
eww open bar


# Set default vals
if [[ $(pidof gammastep) ]]; then
  eww update bool_night=true
else
  eww update bool_night=false
fi

if [ $(pamixer --get-volume-human) = "muted" ]; then
  eww update bool_mute=true
else
  eww update bool_mute=false
fi

~/.config/eww/scripts/up_bright.sh
~/.config/eww/scripts/up_volume.sh

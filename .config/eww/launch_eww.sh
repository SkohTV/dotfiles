#!/bin/bash


# Restart eww
if [[ ! $(pidof eww) ]]; then
  eww daemon
  sleep 1
fi

bspc config -m LVDS-1 top_padding 49

eww close bar
eww open bar

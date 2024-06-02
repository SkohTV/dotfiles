#!/usr/bin/env bash

# When switch workspace
# Check workspace for edp-1
# If 9
# -> mirror
# else
# -> extend and hdmi only w9

workspace="$(hyprctl monitors -j | jq '.[] | select(.name == "eDP-1").activeWorkspace.id')"

case "$1" in
  9)
    if [ ! "$workspace" = "9" ]; then
      hyprctl keyword monitor ',highres,1920x1080,1,mirror,eDP-1'
      pkill hyprpaper
      /home/qlpth/.config/eww/launch_eww.sh
    fi
    hyprctl dispatch workspace "$1"
  ;;
  *)
    if [ "$workspace" = "9" ]; then
      hyprctl keyword monitor ',highres,1920x1080,1'
      sleep 0.1
      hyprctl dispatch moveworkspacetomonitor 9 'HDMI-A-1'
      pkill hyprpaper
      /home/qlpth/.config/eww/launch_eww.sh
    fi
    hyprctl dispatch workspace 9
    hyprctl dispatch workspace "$1"
  ;;
esac



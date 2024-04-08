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
    fi
    hyprctl dispatch workspace "$1" &> /dev/null;
  ;;
  *)
    if [ "$workspace" = "9" ]; then
      hyprctl keyword monitor ',highres,1920x1080,1'
    fi
    hyprctl dispatch workspace "$1" &> /dev/null;
  ;;
esac



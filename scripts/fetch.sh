#!/usr/bin/env bash


source /etc/os-release


echo "$a╭─────────────────────── OS ──────────────────────"
echo "$b│ 󱄅 $PRETTY_NAME"
echo "$c│  $(uname -rms)"
echo "$d│  $XDG_CURRENT_DESKTOP"
echo "$e├──────────────────── Terminal ───────────────────"
echo "$f│  $(zsh --version | awk '{print $1, $2}')"
echo "$g│  $(zellij --version)"
echo "$h│  $(alacritty --version)"
echo "$i├──────────────────── Hardware ───────────────────"
echo "$j│  $(cat /proc/cpuinfo | rg 'model name' | head -n 1 | awk -F': ' '{print $2}')"
echo "$k│ 󰍹 NVIDIA GeForce RTX 3050 Laptop GPU"
echo "$l│  $(free -m | awk '/^Mem:/ {printf "%.2fGi / %.2fGi\n", $3/1024, $2/1024}')"
echo "$m╰─────────────────────────────────────────────────"

# echo "$d│  $(xprop -id $(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F'# ' '{print $2}') _NET_WM_NAME | awk -F'"' '{print $2}')"
# echo "$k│ 󰍹 $(cat /proc/driver/nvidia/gpus/0000:01:00.0/information | rg 'Model:' | sd '^Model:\s*' '')"

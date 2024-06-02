#!/usr/bin/env bash


source /etc/os-release


echo "$a╭─────────────────────── OS ──────────────────────"
echo "$b│ 󱄅 $PRETTY_NAME"
echo "$c│  $(uname -rms)"
echo "$d│  $(xprop -id $(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F'# ' '{print $2}') _NET_WM_NAME | awk -F'"' '{print $2}')"
echo "$e├──────────────────── Terminal ───────────────────"
echo "$f│  $(zsh --version | awk '{print $1, $2}')"
echo "$g│  $(zellij --version)"
echo "$h│  $(alacritty --version)"
echo "$i├──────────────────── Hardware ───────────────────"
echo "$j│  $(cat /proc/cpuinfo | rg 'model name' | head -n 1 | awk -F': ' '{print $2}')"
echo "$k│ 󰍹 $(cat /proc/driver/nvidia/gpus/0000:01:00.0/information | rg 'Model:' | awk -F: '{print $2}' | awk '{$1=$1};1')"
echo "$l│  $(free -m | awk '/^Mem:/ {printf "%.2fGi / %.2fGi\n", $3/1024, $2/1024}')"
echo "$m╰─────────────────────────────────────────────────"

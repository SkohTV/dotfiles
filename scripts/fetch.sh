#!/usr/bin/env bash


source /etc/os-release


echo "OS"
echo "- $PRETTY_NAME"
echo "- $(uname -rms)"
echo ""
echo "DE/WM"
echo "- $(xprop -id $(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F'# ' '{print $2}') _NET_WM_NAME | awk -F'"' '{print $2}')"
echo ""
echo "Terminal"
echo "- $(zsh --version | awk '{print $1, $2}')"
echo "- $(zellij --version)"
echo "- $(alacritty --version)"
echo ""
echo "Hardware"
echo "- $(cat /proc/cpuinfo | rg 'model name' | head -n 1 | awk -F': ' '{print $2}')"
echo "- $(cat /proc/driver/nvidia/gpus/0000:01:00.0/information | rg 'Model:' | awk -F: '{print $2}' | awk '{$1=$1};1')"
echo "- $(free -m | awk '/^Mem:/ {printf "%.2fGi / %.2fGi\n", $3/1024, $2/1024}')"


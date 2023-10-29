#!/bin/bash


brightness=$(brightnessctl | grep 'backlight' -A1 | tail -1 | awk '{print $4}')
brightness="${brightness:1:-2}"
echo "$brightness"

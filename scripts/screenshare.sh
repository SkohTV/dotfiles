#!/bin/bash

sleep 1
pkill xdg-desktop-portal-hyprland
pkill xdg-desktop-portal-wlr 
pkill xdg-desktop-portal
/nix/store/$(ls --color=never -la /nix/store | grep xdg-desktop-portal-1 | grep "^d" | awk '{print $9}')/libexec/xdg-desktop-portal &
sleep 2
/nix/store/$(ls --color=never -la /nix/store | grep xdg-desktop-portal-hyprland | grep "^d" | awk '{print $9}')/libexec/xdg-desktop-portal-hyprland &

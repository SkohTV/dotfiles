#!/usr/bin/env bash


fn_home() {
  zellij attach home || zellij --layout home --session home 
}

fn_nvim() {
  zellij attach nvim || zellij --layout nvim --session nvim 
}

fn_main() {
  zellij attach main || zellij --layout main --session main 
}

fn_tmp() {
  zellij attach tmp || zellij --layout tmp --session tmp 
}

case "$1" in
  "home") fn_home ;;
  "nvim") fn_nvim ;;
  "main") fn_main ;;
  "tmp") fn_tmp ;;
esac

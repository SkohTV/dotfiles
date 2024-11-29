#!/usr/bin/env bash


fn_home() {
  zellij attach home || zellij --session home --new-session-with-layout home 
}

fn_nvim() {
  zellij attach nvim || zellij --session nvim --new-session-with-layout nvim 
}

fn_main() {
  zellij attach main || zellij --session main --new-session-with-layout main 
}

fn_tmp() {
  zellij attach tmp || zellij --session tmp --new-session-with-layout tmp 
}

case "$1" in
  "home") fn_home ;;
  "nvim") fn_nvim ;;
  "main") fn_main ;;
  "tmp") fn_tmp ;;
esac

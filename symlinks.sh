#!/usr/bin/env bash


fn_unlink_link(){
  
  src="${HOME}/dev/repo/dotfiles/config/${2}"
  dest="${HOME}/${1}/${2}"

  if ! test -f "$src" && ! test -d "$src"; then
    echo "$dest does not exist"
    exit
  fi

  [ -L "$dest" ] && unlink "$dest"
  ln -s "$src" "$dest"
  echo "Linked $2"

}

fn_unlink_link '.config' 'ags'
fn_unlink_link '.config' 'alacritty'
fn_unlink_link '.config' 'btop'
fn_unlink_link '.config' 'dunst'
# fn_unlink_link '.config' 'eww'
fn_unlink_link '.config' 'hypr'
fn_unlink_link '.config' 'lazygit'
fn_unlink_link '.config' 'nvim'
fn_unlink_link '.config' 'tofi'
fn_unlink_link '.config' 'wlogout'
fn_unlink_link '.config' 'xkb'
fn_unlink_link '.config' 'zellij'
fn_unlink_link '' '.zshrc'
fn_unlink_link '' 'ags'
fn_unlink_link '.config' 'okularrc'
fn_unlink_link '.config' 'starship.toml'

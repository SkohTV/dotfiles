#!/usr/bin/env bash



__fn_unlink_link(){

  src="$1"
  dest="$2"

  if ! test -f "$src" && ! test -d "$src"; then
    echo "$dest does not exist"
    exit
  fi

  [ -L "$dest" ] && unlink "$dest"
  ln -s "$src" "$dest"
  echo "Linked $2"
}


fn_unlink_link(){
  src="${HOME}/dev/repo/dotfiles/config/${2}"
  dest="${HOME}/${1}/${2}"
  __fn_unlink_link "$src" "$dest"
}




REPO_PATH="$HOME/dev/repo/dotfiles"

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
fn_unlink_link '.config' 'zellij'
fn_unlink_link '' '.zshrc'
fn_unlink_link '.config' 'okularrc'
fn_unlink_link '.config' 'starship.toml'

__fn_unlink_link "$REPO_PATH/scripts" "$HOME/dev/scripts"
__fn_unlink_link "$REPO_PATH/wallpapers/desktop" "$HOME/.config/wallpapers"
__fn_unlink_link "$REPO_PATH/icons" "$HOME/.local/share/icons"

echo 'Finished'

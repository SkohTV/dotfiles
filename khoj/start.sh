#!/usr/bin/env bash

YML="$HOME/dev/repo/dotfiles/khoj/docker-compose.yml"


fn_down() {
    docker compose --file $YML down
}

fn_up() {
    docker compose --file $YML up
}

fn_restart() {
    fn_up
    fn_down
}

fn_delete() {
    fn_down
    docker volume rm khoj_khoj_config
    docker volume rm khoj_khoj_db
    docker volume rm khoj_khoj_models
    docker volume rm khoj_khoj_search
}



# case "$1" in
#   "down") fn_down ;;
#   "up") fn_up ;;
  # "restart") fn_restart ;;
#   "del") fn_delete ;;
# esac

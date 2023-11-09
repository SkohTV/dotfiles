fn_main() {
  zellij kill-session main
  zellij --layout main --session main 
}

fn_nvim() {
  zellij kill-session nvim
  zellij --layout nvim --session nvim 
}

case "$1" in
  "main") fn_main ;;
  "nvim") fn_nvim ;;
esac

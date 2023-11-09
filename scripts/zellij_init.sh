fn_main() {
  zellij attach main || zellij --layout main --session main 
}

fn_nvim() {
  zellij attach nvim || zellij --layout nvim --session nvim 
}

case "$1" in
  "main") fn_main ;;
  "nvim") fn_nvim ;;
esac

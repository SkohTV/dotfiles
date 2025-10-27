{ config, ... }:

let
  dotfiles = "/home/skoh/dev/repo/dotfiles/";
  fullPath = path: config.lib.file.mkOutOfStoreSymlink path;

in {

  programs.git = {
    enable = true;
    userName = "SkohTV";
    userEmail = "contact@skoh.dev";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rerere.enabled = true;
    };
  };

  home.file = {
    ".bashrc".source = fullPath "${dotfiles}/config/.bashrc";

    ".config/ags".source = fullPath "${dotfiles}/config/ags";
    ".config/alacritty".source = fullPath "${dotfiles}/config/alacritty";
    ".config/btop".source = fullPath "${dotfiles}/config/btop";
    ".config/dunst".source = fullPath "${dotfiles}/config/dunst";
    ".config/hypr".source = fullPath "${dotfiles}/config/hypr";
    ".config/lazygit".source = fullPath "${dotfiles}/config/lazygit";
    ".config/nvim".source = fullPath "${dotfiles}/config/nvim";
    ".config/tofi".source = fullPath "${dotfiles}/config/tofi";
    ".config/wlogout".source = fullPath "${dotfiles}/config/wlogout";
    ".config/zellij".source = fullPath "${dotfiles}/config/zellij";

    ".config/starship.toml".source = fullPath "${dotfiles}/config/starship.toml";
    ".config/okularrc".source = fullPath "${dotfiles}/config/okularrc";

    "dev/scripts".source = fullPath "${dotfiles}/scripts";
    ".config/wallpapers".source = fullPath "${dotfiles}/wallpapers";
    ".local/share/icons".source = fullPath "${dotfiles}/icons";

  };

  home.username = "skoh";
  home.homeDirectory = "/home/skoh/";

  # Let home manager manage itself
  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11";
}

{ config, ... }:

let
  dotfiles = "/home/skoh/dev/repo/dotfiles/";
  fullPath = path: config.lib.file.mkOutOfStoreSymlink path;

in {

  programs.git = {
    enable = true;
    userName = "SkohTV";
    userEmail = "qlpth+github@proton.me";

    extraConfig = {
        init.defaultBranch = "main";
        # pull.rebase = true; # thinking about it
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
    ".config/okularrc".source = fullPath "${dotfiles}/config/okularrc";

    ".config/starship.toml".source = fullPath "${dotfiles}/config/starship.toml";

    "dev/scripts".source = fullPath "${dotfiles}/scripts";
    ".config/wallpapers".source = fullPath "${dotfiles}/wallpapers/desktop";
    ".local/share/icons".source = fullPath "${dotfiles}/icons";

  };

  # Let home manager manage itself
  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
}

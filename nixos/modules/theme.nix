{ ... }:
{
  programs.dconf.profiles.user = {
    databases = [{
      lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          gtk-theme = "Juno:dark";
          icon-theme = "candy-icons";
        };
      };
    }];
  };

  # Hyprland fix zoom
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GTK_THEME = "Juno:dark";
  };
}

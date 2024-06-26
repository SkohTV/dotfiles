{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    ### Hypr
    hyprpaper # wallpaper
    hypridle # sleep
    hyprlock # lock
    hyprcursor # cursor

    ### Tools
    wlogout # gui logout menu
    tofi # program launcher
    dunst # notification daemon
    imv # image viewer

    grim # screenshot tool
    slurp # screenshot tool

    wl-clipboard # clipboard
    wl-clip-persist # clipboard


    ### Utils
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    ### Eww
    eww
    pamixer # change sound status
    cava # small bars for sound
    acpi # get battery remaining
    brightnessctl # change brightness
    gammastep # change screen temperature

  ];
}

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
    # dunst # notification daemon
    wired
    imv # image viewer
    libnotify # send notifs

    grim # screenshot tool
    slurp # screenshot tool

    wl-clipboard # clipboard
    wl-clip-persist # clipboard

    acpi # get battery remaining


    ### Utils
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk

    ### Ags
    ags_1
    sassc # compile css 
    brightnessctl # change brightness
    cava # small bars for sound
    sysstat # show cpu %
    lm_sensors # show temp 
    gammastep # change screen temperature
  ];
}

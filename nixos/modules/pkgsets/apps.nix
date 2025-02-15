{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    ### Tryhard
    alacritty # terminal
    obsidian # knowledge database
    spacedrive # file manager from futur

    ### Content
    obs-studio
    parsec-bin
    # steamlink

    ### Web
    brave # browser
    tor-browser # safe browser

    ### Chill
    discord # communication
    vlc # video display
    
    ### Work
    libsForQt5.okular # pdf viewer (advanced)
    zathura # pdf viewer (minimal)
    qalculate-gtk # insane calculatrice
    onlyoffice-bin # office suite
    pantheon.elementary-files # file manager

    ### Dev
    zed-editor # IDE
    # wireshark # network tracking
    # ciscoPacketTracer8 # need to download iso on website 
    qflipper # gui for flipper zero

    ### Dependancies
    xdg-utils # For embedded file manager
    glib # To customize theme with gsettings

  ];
}

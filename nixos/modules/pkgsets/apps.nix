{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    ### Tryhard
    alacritty # terminal
    obsidian # knowledge database
    spacedrive # file manager from futur

    ### Web
    brave # browser
    tor-browser # safe browser

    ### Chill
    #ytmdesktop # youtube music player
    discord # communication
    vlc # video display
    
    ### Work
    libsForQt5.okular # pdf viewer (advanced)
    zathura # pdf viewer (minimal)
    qalculate-gtk # insane calculatrice
    onlyoffice-bin # office suite

    ### Dev
    wireshark # network tracking
    # ciscoPacketTracer8 # need to download iso on website 
    qflipper # gui for flipper zero

    ### Dependancies
    xdg-utils # For embedded file manager

  ];
}

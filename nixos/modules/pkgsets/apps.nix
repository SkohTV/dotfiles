{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ### Tryhard
    alacritty # terminal
    obsidian # knowledge database

    ### Content
    obs-studio
    parsec-bin

    ### Web
    brave # browser

    ### Chill
    discord # communication
    vlc # video display

    ### Work
    libsForQt5.okular # pdf viewer (advanced)
    qalculate-gtk # insane calculatrice
    onlyoffice-bin # office suite

    ### Dependancies
    xdg-utils # For embedded file manager
  ];
}

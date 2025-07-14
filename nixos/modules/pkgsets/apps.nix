{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    alacritty
    obsidian 
    parsec-bin
    brave
    discord
    vlc 

    ### Work
    libsForQt5.okular # pdf viewer (advanced)
    qalculate-gtk # insane calculatrice
    onlyoffice-bin # office suite

    ### Dependancies
    xdg-utils # For embedded file manager
  ];
}

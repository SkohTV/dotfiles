{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    alacritty
    obsidian 
    parsec-bin
    brave
    discord
    vlc 

    libsForQt5.okular
    qalculate-gtk
    onlyoffice-bin

    xdg-utils # For embedded file manager
  ];
}

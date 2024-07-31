{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    ### Man pages
    man-pages
    man-pages-posix

    ### Files
    zip
    unzip


    ### Core
    git
    wget # download file
    bluez # bluetooth
    networkmanager # wifi connection

    ### Advanced
    hyperfine
    fzf 
    jq 
    starship # prompt

    ### Improved
    eza # ls
    bat # cat
    ripgrep # grep
    zoxide # cd
    sd # sed
    fd # find
    procs # top


    ### Terminal User Interface
    neovim # editor
    btop # ressource monitor
    pipr # preview commands
    zellij # terminal multiplexer
    lf # terminal file manager
    lazygit # git interface
    asciiquarium # screensaver
    mprocs # long running process manager


    ### Utils
    pkg-config # for cmake
    openssl # ssl
    openssh # ssh
    zplug # zsh plugin manager

  ];
}

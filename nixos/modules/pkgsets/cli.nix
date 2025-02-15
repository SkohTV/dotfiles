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
    wget # download file
    bluez # bluetooth daemo
    bluetuith # bluetooth tui
    networkmanager # wifi connection
    steam-run # for fhs required apps

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
    delta # diff preview


    ### Terminal User Interface
    btop # ressource monitor
    pipr # preview commands
    zellij # terminal multiplexer
    lf # terminal file manager
    lazygit # git interface
    asciiquarium # screensaver
    mprocs # long running process manager
    nchat # whatsapp cli


    ### Utils
    pkg-config # for cmake
    openssl # ssl
    openssh # ssh
    zplug # zsh plugin manager

  ];
}

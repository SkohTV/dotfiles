{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ### Man pages
    man-pages
    man-pages-posix

    ### Files
    zip
    unzip

    ### Core
    wget # download file
    bluez # bluetooth daemon
    bluetuith # bluetooth tui
    networkmanager # wifi connection
    steam-run # for fhs required apps
    imagemagick # for image manipulation

    ### Advanced
    linuxPackages_latest.perf # for BPF
    starship # prompt
    hyperfine
    fzf
    jq

    ### Improved
    eza # ls
    bat # cat
    ripgrep # grep
    zoxide # cd

    ### Terminal User Interface
    btop # ressource monitor
    zellij # terminal multiplexer
    lazygit # git interface
    mprocs # long running process manager

    ### Utils
    pkg-config # for cmake
    openssl # ssl
    openssh # ssh

    home-manager
  ];
}

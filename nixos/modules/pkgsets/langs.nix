{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    lua5_4_compat

    python313
    poetry

    gnat13
    gnumake 
    cmake

    rustc
    cargo

    zig

    nodejs
    bun

    bash-language-server
    shellcheck
    R
  ];
}

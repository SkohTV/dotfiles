{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

    neovim

    tree-sitter

    lua5_4_compat
    lua54Packages.luarocks
    lua-language-server

    pyright
    rust-analyzer
    zls

    clang-tools
    nodePackages_latest.typescript-language-server

    nixd
    rPackages.languageserver

    cmake-language-server
    vscode-langservers-extracted
  ];
}

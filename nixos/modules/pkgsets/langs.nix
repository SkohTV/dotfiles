{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    ### Language server
    efm-langserver 


    ### Lua
    lua5_4_compat # core
    lua54Packages.luarocks # package manager
    lua-language-server # lsp
    stylua # formatter
    lua54Packages.luacheck # linter

    ### Python
    python313 # core
    pyright # lsp
    ruff # formatter
    poetry # pkg manager

    ### C / C++
    gnat13 # core (gcc & g++)
    gnumake # make
    cmake # cmake
    cmake-language-server # cmake lsp
    clang-tools_16 # lsp (clangd / clang-tidy / clang-format)

    ### Rust
    rustc # core
    cargo # package manager
    rust-analyzer # lsp
    rustfmt # formatter

    ### Zig
    zig # core
    zls # lsp

    ### Php
    php82 # core
    php82Packages.composer # package manager
    phpactor # lsp
    php82Extensions.pgsql # Php + Postgres

    ### Nix
    nixd # lsp
    statix # linter

    ### Go
    go # core
    gopls # lsp

    ### Javascript & Typescript
    nodejs # JS core
    typescript # TS core (for tsserver)
    nodePackages_latest.typescript-language-server # lsp
    eslint_d # linter
    prettierd # formatter
    bun # package manager
    sassc # scss compiler

    ### R lang
    R # Core
    rPackages.languageserver # Lsp

  ];
}

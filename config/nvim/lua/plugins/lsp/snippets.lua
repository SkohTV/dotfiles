local config = function ()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node

    require("luasnip.loaders.from_vscode").lazy_load()

    ls.add_snippets('nix', {
      s('flk',{
        t({
          '{',
          '',
          'inputs = {',
          '  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";',
          '};',
          '',
          '',
          'outputs = {',
          '  self,',
          '  nixpkgs',
          '}:',
          '',
          'let',
          '  supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];',
          '  forAllSystems = nixpkgs.lib.genAttrs supportedSystems;',
          '  nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });',
          '',
          'in {',
          '',
          '  # `nix build`',
          '  packages = forAllSystems (system: {',
          '    default = nixpkgsFor.${system}.stdenv.mkDerivation {',
          '        # pname = "package-name";',
          '        # src = ./.;',
          '        # buildInputs = with nixpkgsFor.${system}; [ ];',
          '    };',
          '  });',
          '',
          '  # `nix develop`',
          '  devShells = forAllSystems (system: {',
          '    default = nixpkgsFor.${system}.mkShell {',
          '      inputsFrom = [ self.packages.${system}.default ];',
          '      # buildInputs = with nixpkgsFor.${system}; [ ];',
          '    };',
          '  });',
          '',
          '};',
          '',
          '}'
        })
      })
    })

end


return {
    "L3MON4D3/LuaSnip",
    event = { "BufEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = config,
}

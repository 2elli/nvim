{
  description = "Neovim Packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        default = pkgs.buildEnv {
          name = "nvim-packages";
          paths = with pkgs; [
            ### lsp ###
            basedpyright
            ruff
            lua-language-server
            typescript-language-server
            tinymist
            zls
            haskellPackages.haskell-language-server
            nil

            ### lint ###
            typos
            haskellPackages.hlint

            ### formatter ###
            haskellPackages.fourmolu
            nixfmt
          ];
        };
      };
    };
}

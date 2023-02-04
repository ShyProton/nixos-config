{ config, pkgs, ... }:
{
  imports = [
    # Language support
    # ./syntaxes.nix
    # ./lsp.nix

    # Aesthetics
    ./theme.nix
    ./ui
  ];

  programs.nixvim.enable = true;
}

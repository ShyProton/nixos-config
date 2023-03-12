/*
  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

  Neovim configuration for NixOS!
  Using the NixVim flake: https://github.com/pta2002/nixvim
*/
{ inputs, ... }:
{
  imports = [
    # Declarative Neovim configuration.
    inputs.nixvim.homeManagerModules.nixvim

    ./editor # Editor configurations.
    ./langs # Language support
    ./ui # User Interface plugins.
    ./utils # Other Utilities.
    ./theme.nix # Color theme.
  ];

  programs.nixvim.enable = true;
}

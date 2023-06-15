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
  # FIXME: Included python host doesn't have pynvim installed.
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

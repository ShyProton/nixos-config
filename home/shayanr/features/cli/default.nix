{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./tldr.nix # Short help-pages.
    ./nvim # Text editor.
  ];

  # TODO: Add aliases for the replacement utilities
  home.packages = with pkgs; [
    age
    btop
    ranger
    ripgrep
    bat
    exa
    ncdu
  ];
}

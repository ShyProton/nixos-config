{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./nvim # Text editor.
    ./zsh.nix # Shell.
    ./prompt.nix # Shell prompt.
    ./tldr.nix # Short help-pages.
  ];

  home.packages = with pkgs; [
    # Utilities.
    age

    # Interfaces.
    ranger
    btop
    ncdu
    pulsemixer

    # Replacements.
    bat
    exa
    ripgrep
  ];
}

{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./nvim # Text editor.
    ./shell # Shell configurations.

    ./git.nix # Git version control.
    ./tldr.nix # Short help-pages.
  ];

  home.packages = with pkgs; [
    # Utilities.
    age

    # Interfaces.
    ranger
    btop
    pavucontrol

    # Replacements.
    bat
    ripgrep
  ];
}

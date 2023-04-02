{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./nvim # Text editor.
    ./shell # Shell configurations.

    ./git.nix # Git version control.
    ./tldr.nix # Short help-pages.
    ./direnv.nix # Augments shell environment variables.
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

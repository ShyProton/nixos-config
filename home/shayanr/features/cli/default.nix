{ pkgs, ... }:
{
  # Command line programs.
  imports = [
    ./shell # Shell configurations.
    ./nvim # Text editor.
    ./btop # Task manager.

    ./git.nix # Git version control.
    ./tldr.nix # Short help-pages.
    ./direnv.nix # Augments shell environment variables.
  ];

  home.packages = with pkgs; [
    # Utilities.
    age

    # Replacements.
    bat
    ripgrep
  ];
}

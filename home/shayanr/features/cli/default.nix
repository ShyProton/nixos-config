{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  # Command line programs.
  imports =
    [
      ./shell # Shell configurations.
      ./nvim # Text editor.
      ./btop # Task manager.

      ./git.nix # Git version control.
      ./tldr.nix # Short help-pages.
      ./ranger.nix # File browser.
      ./direnv.nix # Augments shell environment variables.
    ]
    ++ lib.optionals (osConfig.virtualisation.podman.enable) [
      ./podman.nix # User podman settings.
    ];

  home.packages = with pkgs; [
    # Utilities.
    age

    # Replacements.
    bat
    ripgrep
  ];
}

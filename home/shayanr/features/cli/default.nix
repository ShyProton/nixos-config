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
      ./yazi.nix # File browser.
      ./direnv.nix # Augments shell environment variables.
      ./ripgrep.nix # Fast grepping.
      ./zoxide.nix # cd replacement.
      ./eza.nix # ls replacement.
      ./bat.nix # cat replacement.
    ]
    ++ lib.optionals (osConfig.virtualisation.podman.enable) [
      ./podman.nix # User podman settings.
    ];

  home.packages = with pkgs; [
    age
  ];
}

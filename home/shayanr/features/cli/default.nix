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
      ./helix # Text editor.
      ./btop # Task manager.

      ./nh.nix # Nix CLI helper.
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

    # Extra developer man-pages.
    man-pages
    man-pages-posix
  ];
}

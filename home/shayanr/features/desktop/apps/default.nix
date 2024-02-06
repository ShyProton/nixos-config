{pkgs, ...}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./firefox # Web browser.

    ./kitty.nix # Terminal emulator.
    ./spotify.nix # Music player.
    ./obsidian.nix # Note taking.
    ./reaper.nix # Audio editing.

    ./idea.nix
    ./rstudio.nix # R development.
  ];

  home.packages = with pkgs; [
    pavucontrol
    inkscape
    shotcut
    audacity
  ];
}

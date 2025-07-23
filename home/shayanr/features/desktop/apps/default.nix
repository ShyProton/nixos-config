{pkgs, ...}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./zen.nix # Web browser.
    ./kitty.nix # Terminal emulator.
    ./obsidian.nix # Note taking.
    ./godot.nix # Game development.
    ./krita.nix # Art.
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}

{pkgs, ...}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./zen.nix # Web browser.
    ./kitty.nix # Terminal emulator.
    ./signal.nix # Messenging app.
    ./obsidian.nix # Note taking.
    ./godot.nix # Game development.
    ./krita.nix # Art.
    ./lutris.nix # Windows apps.
  ];

  home.packages = with pkgs; [
    pavucontrol
    libreoffice
  ];
}

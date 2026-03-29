{pkgs, ...}: {
  # TODO: Make shorthand function to quickly add apps that only need the package
  # added and a config directory persisted.
  imports = [
    ./zen.nix # Web browser.
    ./thunderbird.nix # Email client.
    ./kitty.nix # Terminal emulator.
    ./signal.nix # Messenging app.
    ./krita.nix # Art.
  ];

  home.packages = with pkgs; [
    pavucontrol
    chromium
  ];
}

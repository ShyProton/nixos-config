{
  imports = [
    ./niri.nix # Window manager.
    ./hypridle.nix # Idling behaviour.
    ./hyprlock.nix # Locking behaviour.
    ./wofi.nix # App launcher.
    ./widgets
    ./waybar # Desktop bar.
    ./swaync # Notification center.
  ];

  services.swww.enable = true; # Wallpapers.
}

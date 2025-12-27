{
  imports = [
    ./niri.nix # Window manager.
    ./hyprland
    ./hypridle.nix # Idling behaviour.
    ./hyprlock.nix # Locking behaviour.
    ./wofi.nix # App launcher.
    ./widgets
    ./swww.nix # Wallpapers.
    ./waybar # Desktop bar.
    ./swaync # Notification center.
  ];
}

{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix # Machine-specific hardware.

    ../common/global # Implemented by all machines.

    # Defining User(s).
    ../common/users/shayanr.nix

    # Optional features.
    ../common/optional/boot/efi.nix # Boot configurations for EFI systems.
    ../common/optional/persistence/btrfs.nix # Type of opt-in persistence.
    ../common/optional/networkmanager.nix # NetworkManager configurations.
    ../common/optional/pipewire.nix # Pipewire for audio/video multimedia.
    ../common/optional/bluetooth.nix # Bluetooth configurations.
    ../common/optional/backlight.nix # Screen backlight configurations.

    ../common/optional/hyprland-cache.nix # Hyprland package cache.
    ../common/optional/podman.nix # Rootless containers.
  ];

  networking.hostName = "mob";
  time.timeZone = "Canada/Eastern";

  services = {
    blueman.enable = true;
    tlp.enable = true;
  };

  hardware.opengl = {
    enable = true;

    driSupport = true;
    driSupport32Bit = true;

    package = pkgs.mesa_drivers;
  };

  system.stateVersion = "23.05";
}
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
  ];

  networking.hostName = "alphonse";
  time.timeZone = "Canada/Eastern";

  services = {
    blueman.enable = true;
    xserver.videoDrivers = [ "nvidia" ]; # Nvidia driver definition.
  };

  hardware = {
    opengl.enable = true;
    nvidia = {
      modesetting.enable = true;
      prime = {
        offload.enable = true;

        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  # Hyprland package cache.
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  system.stateVersion = "22.11";
}

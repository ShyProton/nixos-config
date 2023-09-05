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
    ../common/optional/fprintd.nix # Fingerprint authentication.
    ../common/optional/tlp.nix # Power management.

    ../common/optional/virtualization.nix # For virtual machines.
    ../common/optional/podman.nix # Rootless containers.
    ../common/optional/postgres.nix # PostgreSQL
  ];

  networking.hostName = "mob";
  time.timeZone = "Canada/Eastern";

  services = {
    blueman.enable = true;
    fstrim.enable = true;
  };

  system.stateVersion = "23.05";
}

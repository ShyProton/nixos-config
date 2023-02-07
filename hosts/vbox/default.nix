{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Machine-specific hardware

    ../common/global # Implemented by all machines.

    # Defining User(s)
    ../common/users/shayanr.nix

    # Optional features
    ../common/optional/persistence/btrfs.nix # Type of opt-in persistence
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.hostName = "vbox"; # Define your hostname.

  time.timeZone = "Canada/Eastern";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  services.openssh.enable = true;

  # TODO: Probably do this using overlays
  security.sudo = {
    package = pkgs.sudo.override {
      withInsults = true;
    };
    extraConfig = ''
      Defaults lecture = never
    '';
  };

  system.stateVersion = "22.11";
}


{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Machine-specific hardware.

    ../common/global # Implemented by all machines.

    # Defining User(s).
    ../common/users/shayanr.nix

    # Optional features.
    ../common/optional/persistence/btrfs.nix # Type of opt-in persistence.
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "alphonse"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Canada/Eastern";

  # TODO: Enable pipewire for sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    pciutils
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.nvidiaPersistenced = true;

  hardware.nvidia.prime = {
    offload.enable = true;

    amdgpuBusId = "PCI:5:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  services.openssh = {
    enable = true;
    hostKeys = [
      {
        path = "/persist/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
      {
        path = "/persist/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
      }
    ];
  };

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


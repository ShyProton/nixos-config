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
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "alphonse";
    networkmanager.enable = true;
  };

  time.timeZone = "Canada/Eastern";

  # TODO: Enable pipewire for sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    pciutils
  ];

  services = {
    xserver.videoDrivers = [ "nvidia" ]; # Nvidia driver definition.
    openssh = {
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


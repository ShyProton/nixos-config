{ config, lib, pkgs, modulesPath, ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" ];
    };
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "space_cache=v2"
        "ssd"
        "noatime"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "space_cache=v2"
        "ssd"
        "noatime"
      ];
    };

    "/persist" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      neededForBoot = true;
      options = [
        "subvol=persist"
        "compress=zstd"
        "space_cache=v2"
        "ssd"
        "noatime"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/SWAP"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}


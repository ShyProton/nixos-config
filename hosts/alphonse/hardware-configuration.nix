{ config, lib, pkgs, modulesPath, ... }:

let hostname = config.networking.hostName;
in
{
  # imports = [ ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtw88 ];
  boot.kernelParams = [
    "radeon.si_support=0"
    "amdgpu.si_support=1"
    "radeon.cik_support=0"
    "amdgpu.cik_support=1"
  ];

  hardware.firmware = [ pkgs.rtw88-firmware ];

  fileSystems."/" = {
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

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  fileSystems."/nix" = {
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

  fileSystems."/persist" = {
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

  # TODO: Add Large

  swapDevices = [
    { device = "/dev/disk/by-label/SWAP"; }
  ];

  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

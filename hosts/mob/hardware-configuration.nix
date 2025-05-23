{
  pkgs,
  config,
  lib,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "nvme" "ahci" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelModules = ["kvm-amd" "acpi_call"];
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];
  };

  fileSystems = let
    global-options = ["compress=zstd" "space_cache=v2" "ssd" "noatime"];
  in {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=root"] ++ global-options;
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=nix"] ++ global-options;
    };

    "/persist" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      neededForBoot = true;
      options = ["subvol=persist"] ++ global-options;
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-label/SWAP";}
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    bluetooth.powerOnBoot = false;
    opentabletdriver.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        libvdpau-va-gl
        vaapiVdpau
      ];
    };
  };
}

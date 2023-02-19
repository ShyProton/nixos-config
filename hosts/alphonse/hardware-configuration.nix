{ config, lib, pkgs, modulesPath, ... }:

let hostname = config.networking.hostName;
in
{
  # TODO: Adjust to default hardware-configuration settings for alphonse.
  # imports = [ ];
  # boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  # boot.initrd.kernelModules = [ ];
  # boot.kernelModules = [ ];
  # boot.extraModulePackages = [ ];

  # TODO: Determine appropriate subvolume options specifically for the
  # type of drive that alphonse has.
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

  # TODO: Adjust to default hardware-configuration settings for alphonse.
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;
  # nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  # hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

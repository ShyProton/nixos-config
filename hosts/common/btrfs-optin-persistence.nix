{ lib, config, ... }:
let hostname = config.networking.hostName;
in
{
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  boot.initrd.postDeviceCommands = lib.mkBefore ''
    mkdir -p /mnt

    mount -o subvol=/ /dev/disk/by-label/${hostname} /mnt

    echo "Removing ephemeral files..."
    btrfs subvolume list -o /mnt/root |
      cut -f9 -d' ' |
      while read subvolume; do
        echo "Deleting /${subvolume} subvolume..."
        btrfs subvolume delete "/mnt/${subvolume}"
      done &&

    echo "Deleting /root subvolume..." &&
    btrfs subvolume delete /mnt/root

    echo "Restoring clean machine state..."
    btrfs subvolume snapshot /mnt/root-blank /mnt/root

    umount /mnt
    rm /mnt
  '';
}

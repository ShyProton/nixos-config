{ pkgs, lib, config, ... }:
let
  # Script for showing the diff between the root and root-blank subvolumes.
  # This shows the ephemeral files which will be deleted on boot.
  hostName = config.networking.hostName;

  fs-diff = pkgs.writeShellScriptBin "fs-diff" ''
    set -euo pipefail

    sudo mount -o subvol=/ /dev/disk/by-label/${hostName} /mnt

    OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/root-blank 9999999) 
    OLD_TRANSID=''${OLD_TRANSID#transid marker was}

    sudo btrfs subvolume find-new "/mnt/root" "$OLD_TRANSID" |
    sed '$d' |
    cut -f17- -d' ' |
    sort |
    uniq |
    while read path; do
      path="/$path"
      if [ -L "$path" ]; then
        : # The path is a symbolic link, probably handled by NixOS already
      elif [ -d "$path" ]; then
        : # The path is a directory, ignore
      else
        echo "$path"
      fi
    done

    sudo umount /mnt
  '';
in
{
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  boot.initrd.postDeviceCommands = lib.mkBefore ''
    mkdir -p /mnt

    mount -o subvol=/ /dev/disk/by-label/${config.networking.hostName} /mnt

    echo "Removing ephemeral files..."
    btrfs subvolume list -o /mnt/root |
      cut -f9 -d' ' |
      while read subvolume; do
        echo "Deleting /$subvolume subvolume..."
        btrfs subvolume delete "/mnt/$subvolume"
      done &&

    echo "Deleting /root subvolume..." &&
    btrfs subvolume delete /mnt/root

    echo "Restoring clean machine state..."
    btrfs subvolume snapshot /mnt/root-blank /mnt/root

    umount /mnt
  '';

  environment.systemPackages = [ fs-diff ];
}

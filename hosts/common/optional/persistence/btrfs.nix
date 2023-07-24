{ pkgs, lib, ... }:
let
  # Script for showing the diff between the root and root-blank subvolumes.
  # This shows the ephemeral files which will be deleted on boot.
  fs-diff = pkgs.writeShellScriptBin "fs-diff" ''
    set -euo pipefail

    sudo mkdir /mnt/fs-diff
    sudo mount -o subvol=/ /dev/disk/by-label/ROOT /mnt/fs-diff

    OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/fs-diff/root-blank 9999999) 
    OLD_TRANSID=''${OLD_TRANSID#transid marker was}

    sudo btrfs subvolume find-new "/mnt/fs-diff/root" "$OLD_TRANSID" |
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

    sudo umount /mnt/fs-diff
    sudo rmdir /mnt/fs-diff
  '';
in
{
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  boot.initrd.postDeviceCommands = lib.mkBefore ''
    mkdir -p /mnt

    mount -o subvol=/ /dev/disk/by-label/ROOT /mnt

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
    rmdir /mnt
  '';

  environment.systemPackages = [ fs-diff ];
}

{ inputs, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  programs.fuse.userAllowOther = true;

  # Defining which system directories/files persist every boot.
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/ssh"

      "/var/log"
      "/var/lib/systemd"

      "/srv"
      "/mnt"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}

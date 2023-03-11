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
      "/var/lib/bluetooth" # Persist bluetooth connections.

      "/srv"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}

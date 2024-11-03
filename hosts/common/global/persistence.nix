{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  programs.fuse.userAllowOther = true;

  # TODO: Remove these when this issue is resolved!!
  # https://github.com/nix-community/impermanence/issues/229
  boot.initrd.systemd.suppressedUnits = ["systemd-machine-id-commit.service"];
  systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

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

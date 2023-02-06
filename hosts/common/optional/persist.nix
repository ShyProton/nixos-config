{
  programs.fuse.userAllowOther = true;

  # Defining which system directories/files persist every boot.
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"

      "/var/log"
      "/var/lib/systemd"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}

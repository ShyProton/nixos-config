{
  networking.networkmanager.enable = true;

  environment.persistence."/persist".directories = [
    "/etc/NetworkManager/system-connections"
    "/var/lib/NetworkManager"
  ];

  # Ensure networkmanager group exists.
  users.groups.networkmanager = {};
}

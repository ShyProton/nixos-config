{
  hardware.bluetooth.enable = true;

  environment.persistence."/persist".directories = [
    "/var/lib/bluetooth" # Persist bluetooth connections.
  ];
}

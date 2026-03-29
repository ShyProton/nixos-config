{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  environment.persistence."/persist".directories = [
    "/var/lib/upower"
    "/var/lib/power-profiles-daemon"
  ];
}

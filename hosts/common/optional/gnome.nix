# Quick and simple gnome configuration, mostly used for testing desktop apps.
{
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
      };
    };
  };
}

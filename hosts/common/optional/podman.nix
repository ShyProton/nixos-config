{ pkgs, ... }:
{
  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  environment = {
    systemPackages = with pkgs; [ podman-compose ];
    persistence."/persist".directories = [ "/var/lib/containers" ];
  };
}

{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      podman
      podman-compose
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".local/share/containers"
    ];
  };
}

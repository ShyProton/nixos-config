{ config, ... }:
{
  xdg.configFile."containers/storage.conf".text = ''
    [storage]
    driver = "overlay"
    runroot = "/run/user/1000"
    graphroot = "/persist${config.home.homeDirectory}/.local/share/containers/storage"
  '';
}

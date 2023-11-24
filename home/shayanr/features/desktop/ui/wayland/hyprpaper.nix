# NOTE: Not in 'hyprland' directory since hyprpaper is not hyprland-specific.
{
  config,
  lib,
  ...
}: {
  xdg.configFile."hypr/hyprpaper.conf".text = let
    paths = map (monitor:
      with monitor; "${config.home.homeDirectory}/Pictures/wallpapers/${toString width}x${toString height}/${wallpapers.desktop}")
    config.monitors;

    preload-configs = map (path: "preload = ${path}") paths;
    wallpaper-configs = map ({
      fst,
      snd,
    }: "wallpaper = ${fst.name},${snd}")
    (lib.lists.zipLists config.monitors paths);
  in ''
    ${builtins.concatStringsSep "\n" preload-configs}
    ${builtins.concatStringsSep "\n" wallpaper-configs}
    ipc = off
  '';
}

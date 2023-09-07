{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    ranger
  ];

  xdg.configFile."ranger/rc.conf".text = lib.mkIf config.programs.kitty.enable ''
    set preview_images_method kitty
  '';
}

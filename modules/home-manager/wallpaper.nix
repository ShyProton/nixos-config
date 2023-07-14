{ lib, ... }:
let inherit (lib) types mkOption;
in
{
  options.wallpapers = {
    desktop = mkOption {
      type = types.path;
      default = "";
      description = ''
        Path to desktop wallpaper
      '';
    };

    lockscreen = mkOption {
      type = types.path;
      default = "";
      description = ''
        Path to lockscreen wallpaper
      '';
    };
  };
}

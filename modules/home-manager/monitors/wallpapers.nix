{lib}: let
  inherit (lib) types mkOption;
in
  types.submodule {
    options = {
      desktop = mkOption {
        type = types.str;
        default = "";
        description = ''
          Path to desktop wallpaper
        '';
      };

      lockscreen = mkOption {
        type = types.str;
        default = "";
        description = ''
          Path to lockscreen wallpaper
        '';
      };
    };
  }

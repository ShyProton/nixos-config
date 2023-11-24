{lib, ...}: let
  inherit (lib) types mkOption;
in {
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
      options = {
        name = mkOption {
          type = types.str;
          example = "DP-1";
        };

        width = mkOption {
          type = types.int;
          example = 1920;
        };

        height = mkOption {
          type = types.int;
          example = 1080;
        };

        refreshRate = mkOption {
          type = types.int;
          example = 60;
        };

        x = mkOption {
          type = types.int;
          default = 0;
        };

        y = mkOption {
          type = types.int;
          default = 0;
        };

        enabled = mkOption {
          type = types.bool;
          default = true;
        };

        wallpapers = mkOption {
          type = import ./wallpapers.nix {inherit lib;};
        };
      };
    });
  };
}

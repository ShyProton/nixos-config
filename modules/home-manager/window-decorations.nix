{lib, ...}: let
  inherit (lib) types mkOption;
in {
  options.window-decorations = {
    gap-size = mkOption {
      type = types.int;
      default = 0;
      description = ''
        Gap size between windows in px
      '';
    };

    border-radius = mkOption {
      type = types.int;
      default = 0;
      description = ''
        Border radius of windows in px
      '';
    };
  };
}

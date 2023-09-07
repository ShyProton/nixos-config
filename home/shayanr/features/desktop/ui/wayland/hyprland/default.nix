{
  inputs,
  pkgs,
  config,
  osConfig,
  lib,
  ...
}: {
  home = {
    # WM Packages.
    packages = with pkgs;
      [
        swaybg # Wallpaper utility.

        wlr-randr
        wl-clipboard
      ]
      ++ (with inputs.hyprwm-contrib.packages.${pkgs.system}; [
        grimblast
        scratchpad
      ]);

    sessionVariables = lib.mkMerge [
      {
        HYPRLAND_LOG_WLR = 1;
        NIXOS_OZONE_WL = 1;
      }

      # Conditionally add extra session variables if the system has nvidia.
      (
        lib.mkIf
        (builtins.elem "nvidia" osConfig.services.xserver.videoDrivers)
        {
          LIBVA_DRIVER_NAME = "nvidia";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          WLR_NO_HARDWARE_CURSORS = 1;
        }
      )
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # Enable nvidia patches if the system has the nvidia driver.
    enableNvidiaPatches =
      lib.mkIf
      (builtins.elem "nvidia" osConfig.services.xserver.videoDrivers)
      true;

    settings = import ./config.nix {inherit config;};
  };
}

{ inputs, pkgs, config, osConfig, lib, ... }:
let
  wallpaper = "Pictures/wallpapers/gruvbox_waves.png";
in
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  # WM Packages.
  home = {
    packages = with pkgs; [
      inputs.hyprwm-contrib.packages.${system}.grimblast # Screenshots.
      swaybg # Wallpaper utility.

      wlr-randr
      wl-clipboard
    ];

    sessionVariables = lib.mkMerge [
      {
        HYPRLAND_LOG_WLR = 1;
        NIXOS_OZONE_WL = 1;
      }

      # Conditionally add extra session variables if the system has nvidia.
      (lib.mkIf
        (builtins.elem "nvidia" osConfig.services.xserver.videoDrivers)
        {
          LIBVA_DRIVER_NAME = "nvidia";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          WLR_NO_HARDWARE_CURSORS = 1;
        }
      )
    ];
  };

  # TODO: Hyprland desktop portal: must enable system wide.
  # NOTE: Doesn't work here is because the home-manager module is being used.

  wayland.windowManager.hyprland = {
    enable = true;
    # Enable nvidia patches if the system has the nvidia driver.
    nvidiaPatches = lib.mkIf
      (builtins.elem "nvidia" osConfig.services.xserver.videoDrivers)
      true;

    extraConfig = import ./config.nix { inherit config wallpaper; };
  };
}

{ inputs, pkgs, config, ... }:
let
  wallpaper = "Pictures/wallpapers/girl-reading-book.png";
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

    sessionVariables = {
      HYPRLAND_LOG_WLR = 1;

      # TODO: Only enable these if the host system has nvidia.
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  # Automatically enter Hyprland when logging into tty1.
  programs.zsh = {
    loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';

    profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
    nvidiaPatches = true; # TODO: Only enable if the host system has nvidia.
    extraConfig = import ./config.nix { inherit config wallpaper; };
  };
}

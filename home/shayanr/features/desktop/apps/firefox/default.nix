{ pkgs, config, osConfig, lib, inputs, ... }:
{
  imports = [
    ./settings.nix # Firefox settings. 
    ./style.nix # Firefox styling.
    ./extensions.nix # Firefox extensions.
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
      };
    };
  };

  home = {
    sessionVariables = lib.mkMerge [
      {
        BROWSER = "firefox";
        MOZ_ENABLE_WAYLAND = 1;
      }

      # Conditionally add extra session variables if the system has nvidia.
      (lib.mkIf
        (builtins.elem "nvidia" osConfig.services.xserver.videoDrivers)
        {
          MOZ_DRM_DEVICE = "/dev/dri/card0";
        }
      )
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".mozilla/firefox"
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}

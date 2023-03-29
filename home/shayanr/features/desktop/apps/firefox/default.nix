{ pkgs, config, inputs, ... }:
{
  imports = [
    ./settings.nix # Firefox settings. 
    ./style.nix # Firefox styling.
    ./extensions.nix # Firefox extensions.
  ];

  # Essential fonts.
  home.packages = with pkgs; [
    liberation_ttf
    dejavu_fonts
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
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = 1;
    };

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

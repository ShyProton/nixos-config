{ pkgs, config, ... }:
{
  home = {
    packages = [
      (pkgs.discord-canary.override {
        withOpenASAR = true;
      })
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/discordcanary"
    ];
  };

  xdg.configFile."discordcanary/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true,
      "openasar": {
        "setup": true,
        "quickstart": true,
        "css": "${
          builtins.replaceStrings [ "\n" ] [ "" ] (import ./style.nix {
            colors = config.colorScheme.colors;
          })
        }"
      },
      "IS_MAXIMIZED": false,
      "IS_MINIMIZED": false,
      "WINDOW_BOUNDS": {
        "x": 52,
        "y": 12,
        "width": 1856,
        "height": 1056
      },
      "OPEN_ON_STARTUP": false
    }
  '';
}

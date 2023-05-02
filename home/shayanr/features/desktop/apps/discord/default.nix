{ pkgs, config, ... }:
{
  # WARN: On package update, an imperative step is involved where openASAR must
  # be disabled then re-enabled in order for discord to function correctly.
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
      "SKIP_HOST_UPDATE": false,
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

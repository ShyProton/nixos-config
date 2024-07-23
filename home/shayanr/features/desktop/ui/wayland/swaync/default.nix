{config, ...}: let
  inherit (config) monitors;
  inherit (config.window-decorations) gap-size border-radius;
  inherit (config.colorScheme) palette;
in {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "left";
      positionY = "top";
      control-center-margin-top = gap-size;
      control-center-margin-bottom = gap-size;
      control-center-margin-left = gap-size;
      control-center-margin-right = gap-size;
      notification-icon-size = 48;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      control-center-width = (builtins.head monitors).width / 4; # 25% width of primary monitor.

      timeout = 5;
      timeout-low = 5;
      timeout-critical = 20;
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear ";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        mpris = {
          image-size = 96;
          image-radius = border-radius;
        };
      };
    };

    style = import ./style.nix {inherit config;};
  };
}

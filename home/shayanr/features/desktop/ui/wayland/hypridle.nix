{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dipatch dpms on";
      };

      listener = [
        {
          timeout = 3 * 60; # 3 minutes.
          on-timeout = "light -O && light -S 0";
          on-resume = "light -I";
        }
        {
          timeout = 4 * 60; # 4 minutes.
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 5 * 60; # 5 minutes.
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}

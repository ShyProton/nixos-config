{
  config,
  lib,
  pkgs,
  ...
}: let
  is-locked = "pgrep -x swaylock";
  lock-time = 4 * 60; # 4 minutes.

  mkEvent = time: start: resume: ''
    timeout ${toString (lock-time + time)} '${start}' ${lib.optionalString (resume != null) "resume '${resume}'"}
    timeout ${toString time} '${is-locked} && ${start}' ${lib.optionalString (resume != null) "resume '${is-locked} && ${resume}'"}
  '';
in {
  home.packages = with pkgs; [swayidle];

  xdg.configFile."swayidle/config".text =
    ''
      before-sleep 'swaylock'
      timeout ${toString lock-time} 'swaylock'
    ''
    + lib.optionalString config.wayland.windowManager.hyprland.enable
    (mkEvent 60 "hyprctl dispatch dpms off" "hyprctl dispatch dpms on");
}

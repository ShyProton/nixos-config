{pkgs, ...}: let
  random-1920x1080 = "$(find ~/Pictures/wallpapers/1920x1080 -type f \\( -iname \"*.jpg\" -o -iname \"*.png\" -o -iname \"*.jpeg\" \\) | shuf -n 1)";
  random-1920x1200 = "$(find ~/Pictures/wallpapers/1920x1200 -type f \\( -iname \"*.jpg\" -o -iname \"*.png\" -o -iname \"*.jpeg\" \\) | shuf -n 1)";

  switch-wallpapers = pkgs.writeShellScriptBin "switch-wallpapers" ''
    swww img -t wipe -o eDP-1 ${random-1920x1200} --transition-fps 60 --transition-angle 30
    swww img -t wipe -o HDMI-A-1 ${random-1920x1080} --transition-fps 144 --transition-angle 30
  '';
in {
  home.packages = [switch-wallpapers];

  services.swww.enable = true;
}

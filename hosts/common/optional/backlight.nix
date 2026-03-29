{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  # Ensure video group exists.
  users.groups.video = {};
}

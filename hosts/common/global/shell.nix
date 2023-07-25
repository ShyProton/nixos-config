{
  pkgs,
  config,
  lib,
  ...
}:
lib.mkIf (config.users.users.shayanr.shell == pkgs.zsh) {
  programs.zsh.enable = true;
}

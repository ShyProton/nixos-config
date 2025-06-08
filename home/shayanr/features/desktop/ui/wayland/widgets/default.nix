{
  inputs,
  pkgs,
  ...
}: {
  qt.enable = true;

  home.packages = [inputs.quickshell.packages.${pkgs.system}.default];
}

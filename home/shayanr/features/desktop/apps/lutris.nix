{pkgs, ...}: {
  home.packages = with pkgs; [
    lutris
    bottles
    wineWowPackages.waylandFull
  ];
}

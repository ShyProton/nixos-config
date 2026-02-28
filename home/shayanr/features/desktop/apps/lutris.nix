{pkgs, ...}: {
  home.packages = with pkgs; [
    lutris
    bottles
    wineWow64Packages.waylandFull
  ];
}

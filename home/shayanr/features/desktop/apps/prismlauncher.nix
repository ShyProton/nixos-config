{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      prismlauncher
    ];

    persistence."/persist".directories = [
      ".local/share/PrismLauncher"
    ];
  };
}

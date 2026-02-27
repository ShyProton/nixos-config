{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      signal-desktop
    ];

    persistence."/persist".directories = [
      ".config/Signal"
    ];
  };
}

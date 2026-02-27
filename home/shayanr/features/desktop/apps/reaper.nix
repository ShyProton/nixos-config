{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      reaper
    ];

    persistence."/persist".directories = [
      ".config/REAPER"
    ];
  };
}

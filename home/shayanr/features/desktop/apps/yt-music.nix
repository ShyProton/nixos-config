{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      youtube-music
    ];

    persistence."/persist".directories = [
      ".config/YouTube Music"
    ];
  };
}

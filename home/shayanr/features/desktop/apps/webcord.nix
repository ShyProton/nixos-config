{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      webcord
    ];

    persistence."/persist".directories = [
      ".config/WebCord"
    ];
  };
}

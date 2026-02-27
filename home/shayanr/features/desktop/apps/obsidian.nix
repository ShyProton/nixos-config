{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      obsidian
    ];

    persistence."/persist".directories = [
      ".config/obsidian"
    ];
  };
}

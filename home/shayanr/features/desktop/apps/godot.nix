{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      godot
    ];

    persistence."/persist".directories = [
      ".config/godot"
      ".local/share/godot"
    ];
  };
}

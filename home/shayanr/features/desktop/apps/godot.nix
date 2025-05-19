{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      godot
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".config/godot"
      ".local/share/godot"
    ];
  };
}

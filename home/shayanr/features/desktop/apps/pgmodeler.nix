{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      pgmodeler
    ];

    persistence."/persist".directories = [
      ".config/pgmodeler-1.0"
    ];
  };

  xdg.desktopEntries.pgmodeler = {
    name = "pgModeler";
    genericName = "Database Modeler";
    exec = "pgmodeler";
    terminal = false;
    categories = ["Application"];
    icon = "pgmodeler";
  };
}

{pkgs, ...}: {
  home = {
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
    };

    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = 24;
    };
  };

  gtk.cursorTheme = {
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}

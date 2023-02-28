{ pkgs, ... }:
{
  home = {
    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 22;
      gtk.enable = true;
    };

    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = 22;
    };
  };

  gtk = {
    enable = true; # TODO: Move to dedicated gtk.nix file.
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 22;
    };
  };
}

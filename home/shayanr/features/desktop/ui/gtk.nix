{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Kanagawa-B";
      package = pkgs.kanagawa-gtk-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}

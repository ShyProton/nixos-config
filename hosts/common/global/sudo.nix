{pkgs, ...}: {
  security.sudo = {
    package = pkgs.sudo.override {
      withInsults = true;
    };

    extraConfig = ''
      Defaults lecture = never
    '';
  };
}

{pkgs, ...}: {
  programs = {
    yazi = {
      enable = true;
      shellWrapperName = "y";
    };
    jq.enable = true;
    fzf.enable = true;
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer
    unar
    poppler
    fd
  ];
}

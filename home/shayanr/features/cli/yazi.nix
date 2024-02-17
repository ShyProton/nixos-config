{pkgs, ...}: {
  programs = {
    yazi.enable = true;
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

{pkgs, ...}: {
  programs.yazi.enable = true;

  home.packages = with pkgs; [
    ffmpegthumbnailer
    unar
    jq
    poppler
    fd
    fzf
    zoxide
  ];
}

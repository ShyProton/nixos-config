{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

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

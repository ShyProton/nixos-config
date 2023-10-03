{
  programs.nixvim.plugins.hardtime = {
    enable = true;
    disabledFiletypes = [
      "qf"
      "netrw"
      "NvimTree"
      "lazy"
      "mason"
      "oil"
      "sagaoutline"
    ];
  };
}

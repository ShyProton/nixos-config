{
  programs.nixvim.plugins.hardtime = {
    enable = true;
    disabledFiletypes = [
      "NvimTree"
      "sagaoutline"
      "sagafinder"
      "saga_codeaction"
    ];
  };
}

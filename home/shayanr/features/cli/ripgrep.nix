{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--colors=line:none"
      "--colors=line:style:bold"
      "--max-columns=150"
      "--max-columns-preview"
      "--smart-case"
    ];
  };
}

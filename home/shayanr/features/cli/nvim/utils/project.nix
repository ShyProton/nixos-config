{
  programs.nixvim.plugins.project-nvim = {
    enable = true;
    detectionMethods = ["pattern"];
    silentChdir = true;
    showHidden = false;
    manualMode = false;
    # TODO: Make 'data' path persistent
    # dataPath = "~/.local/share/nvim"
    patterns = [
      ".git"
      "_darcs"
      ".hg"
      ".bzr"
      ".svn"
      "Makefile"
      "package.json"
      "pubspec.yaml"
    ];
  };
}

{
  programs = {
    bat = {
      enable = true;
      config.theme = "gruvbox-dark";
    };

    bash.shellAliases.cat = "bat";
    zsh.shellAliases.cat = "bat";
    fish.shellAliases.cat = "bat";
    ion.shellAliases.cat = "bat";
  };
}

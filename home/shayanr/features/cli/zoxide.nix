{config, ...}: {
  programs = {
    zoxide.enable = true;
    zsh.shellAliases.cd = "z";
  };

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".local/share/zoxide"
  ];
}

{...}: {
  programs = {
    zoxide.enable = true;
    zsh.shellAliases.cd = "z";
  };

  home.persistence."/persist".directories = [
    ".local/share/zoxide"
  ];
}

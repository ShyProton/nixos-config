{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell.enable = true;
  home.persistence."/persist".directories = [
    ".config/noctalia"
  ];
}

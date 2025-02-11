{pkgs, ...}: {
  programs = let
    aliases = {
      cat = "bat";
      man = "batman";
    };
  in {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [batman];
      config.theme = "ansi";
    };

    bash.shellAliases = aliases;
    zsh.shellAliases = aliases;
    fish.shellAliases = aliases;
    ion.shellAliases.cat = aliases;
  };
}

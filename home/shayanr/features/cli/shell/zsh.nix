{
  pkgs,
  config,
  osConfig,
  lib,
  ...
}:
# NOTE: Only configures zsh if it's defined as the default user shell.
lib.mkIf (osConfig.users.users.shayanr.shell == pkgs.zsh) {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    history = {
      save = 10000;
      path = "/persist${config.home.homeDirectory}/.zsh_history";
    };

    initExtra = ''
      KEYTIMEOUT=1
    '';
  };
}

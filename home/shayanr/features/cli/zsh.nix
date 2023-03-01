{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    history = {
      save = 10000;
      path = "/persist${config.home.homeDirectory}/.zsh_history";
    };

    shellAliases = {
      ls = "exa --header --icons";
      cat = "bat";
      grep = "rg --colors=line:none --colors=line:style:bold --max-columns=150 --max-columns-preview --smart-case";
    };
  };
}

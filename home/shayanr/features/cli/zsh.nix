{ config, ... }:
{
  programs = {
    zsh = {
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

    # TODO: Move to prompt file to be more shell-agnostic.
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # TODO: Prompt settings.
      };
    };
  };

  home.sessionVariables.NIX_SHELL_PRESERVE_PROMPT = 1;
}

{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      settings.user = {
        name = "ShyProton";
        email = "shayanr1001@gmail.com";
        core.editor = "hx";
      };
    };

    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
      settings.stripLeadingSymbols = false;
    };

    gh = {
      enable = true;
      # TODO: Test if this is needed.
      gitCredentialHelper.enable = true;

      extensions = with pkgs; [gh-markdown-preview];

      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
          Hostname ssh.github.com
          Port 443
          User git
      '';
    };
  };

  home.persistence."/persist".directories = [
    ".config/gh"
  ];
}

{
  pkgs,
  config,
  ...
}: {
  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      userName = "ShyProton";
      userEmail = "shayanr1001@gmail.com";

      diff-so-fancy = {
        enable = true;
        stripLeadingSymbols = false;
      };
    };

    gh = {
      enable = true;
      # TODO: Test if this is needed.
      enableGitCredentialHelper = true;

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

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".config/gh"
  ];
}

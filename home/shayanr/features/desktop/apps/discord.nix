{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    vesktop = {
      enable = true;
      settings = {
        discordBranch = "stable";
        minimizeToTray = false;
        arRPC = true;
        tray = false;
      };
      state.firstLaunch = false;
    };
  };

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".config/discord"
    ".config/vesktop/sessionData"
  ];
}

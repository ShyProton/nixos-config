{inputs, ...}: {
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

  home.persistence."/persist".directories = [
    ".config/discord"
    ".config/vesktop/sessionData"
  ];
}

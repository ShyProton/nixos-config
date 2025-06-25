{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };

  home.persistence."/persist${config.home.homeDirectory}".directories = [
    ".zen"
  ];
}

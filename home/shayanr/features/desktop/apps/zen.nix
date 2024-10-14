{
  pkgs,
  config,
  inputs,
  ...
}: {
  home = {
    packages = [
      inputs.zen-browser.packages."${pkgs.system}".default
    ];

    persistence."/persist${config.home.homeDirectory}".directories = [
      ".zen"
    ];
  };
}

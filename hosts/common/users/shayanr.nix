# Common home configurations for every system.
{ pkgs, config, inputs, ... }:
let
  ifTheyExist = groups: builtins.filter
    (group: builtins.hasAttr group config.users.groups)
    groups;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users = {
    mutableUsers = false;
    users.shayanr = {
      isNormalUser = true;
      passwordFile = config.age.secrets.shayanr-password.path;
      shell = pkgs.zsh; # Default user shell.
      extraGroups = [
        "wheel"
      ] ++ ifTheyExist [
        "video"
        "networkmanager"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMqm+dODcOsPVZNmaAkVjiD1g5ZVgucyuoMSIAbwLsvRlhZTiG61g8w2+hsvm7zcqkO/yyMlaCSd33gv11HMz0H0JVDPCRSMZ6pxzoXhAwv9SpPXEvYa4E2xyh/IkqohvCvdVFRh8SOGgQ/ZjBaYXvf4VWoIGSfkn5WxRXfqd0tYTsvCTiZXI9nETXuK4bERdczZRlVznxq1LfahPPV7ZsyE/ybO6hGqWFxXGHjhrJ/OhbYUhyeOrX1eCcUyu0ENeWL9cC7B90GpXGYIVIwvdRKUZK9mf4QDKMCUDhgB4CSp1ICOA8xuIYWR9Vd2ldqTKhETbO/89ugwmqvVQ/lWOs3QDRdB3Sq2ck3/5YNRIaGrobmMTjeaowLl35ho+3wEdE+Cpq8g25SilKRPEi9rQWGDau40qoZd2k1+mxX64yCatQ8iIgR/iaLympMDvnDN7eB6kWVCXN5ZKT7FgzgP2Sx20faaJGOCyAM0G2goz2lu/PFbHgoGNHbE6vKMOHIEU= shayanr"
      ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users.shayanr = {
      imports = [
        # Impermanence for home-manager.
        inputs.impermanence.nixosModules.home-manager.impermanence
        # Declarative Neovim configuration.
        inputs.nixvim.homeManagerModules.nixvim
        # Declarative system colorscheme.
        inputs.nix-colors.homeManagerModule
        # Window manager.
        inputs.hyprland.homeManagerModules.default

        # Home configurations.
        ../../../home/shayanr/${config.networking.hostName}.nix
      ];
    };
  };
}

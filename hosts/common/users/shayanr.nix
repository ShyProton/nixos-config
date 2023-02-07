# Common home configurations for every system.
{ config, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  sops.secrets.shayanr-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  users.mutableUsers = false;
  users.users.shayanr = {
    isNormalUser = true;
    initialPassword = "password"; # Fallback password.
    passwordFile = config.sops.secrets.shayanr-password.path;
    extraGroups = [ "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.shayanr = {
    imports = [
      # Impermanence for home-manager.
      inputs.impermanence.nixosModules.home-manager.impermanence
      # Declarative Neovim configuration.
      inputs.nixvim.homeManagerModules.nixvim

      # Home configurations.
      ../../../home/shayanr/${config.networking.hostName}.nix
    ];
  };
}

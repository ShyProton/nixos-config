# Common home configurations for every system.
{ config, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users = {
    mutableUsers = false;
    users.shayanr = {
      isNormalUser = true;
      initialPassword = "password";
      # passwordFile = "/home/shayanr/something.txt";
      extraGroups = [ "wheel" ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.shayanr = {
      imports = [
        # Impermanence for home-manager.
        inputs.impermanence.nixosModules.home-manager.impermanence
        # Declarative Neovim configuration.
        inputs.nixvim.homeManagerModules.nixvim

        # Home configurations.
        ../../../home/shayanr/${config.networking.hostName}.nix
      ];
    };
  };
}

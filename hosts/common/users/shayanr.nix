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
<<<<<<< HEAD
      passwordFile = config.age.secrets.shayanr-password.path;
=======
      initialPassword = "password";
      # passwordFile = "/home/shayanr/something.txt";
>>>>>>> d77308659d2ec9251d7a73b2a82a72f36498e8cd
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

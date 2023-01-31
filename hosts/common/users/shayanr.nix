# Common home configurations for every system.
{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.mutableUsers = false;
  users.users.shayanr = {
    isNormalUser = true;
    # TODO: Set hashedpassword or use secrets
    initialPassword = "password";
    extraGroups = [ "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.shayanr = {
    imports = [
      inputs.impermanence.nixosModules.home-manager.impermanence
      ../../../home/shayanr/${config.networking.hostName}.nix
    ];
  };
}

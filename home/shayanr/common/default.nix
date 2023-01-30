# Common home configurations for every system.
{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.shayanr = {
    home = {
      username = "shayanr";
      homeDirectory = "/home/${config.home-manager.users.shayanr.home.username}";
    };

    # System-specific home configurations.
    imports = [
      ../${config.networking.hostName}
    ];
  };
}

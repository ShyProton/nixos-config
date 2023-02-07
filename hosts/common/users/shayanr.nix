# Common home configurations for every system.
{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.shayanr-password = {
      sopsFile = ../secrets.yaml;
      neededForUsers = true;
    };
  };

  users.mutableUsers = false;
  users.users.shayanr = {
    isNormalUser = true;
    initialPassword = "password"; # Fallback.
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

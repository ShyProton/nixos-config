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
      # passwordFile = config.age.secrets.shayanr-password.path;
      extraGroups = [ "wheel" "networkmanager" ];

      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQXTq6EUd4Oex2avjzDxgVAg3P/e9JnanklbZ2GCXB9AvNrFSjLdhVIfz9IQF7kZGdci6ytvWMjpu6FwWWAyvnHBgfrXC+GpVZ3C+d5e6mY1x4Wg0h7QATtBfUbLKft/6y0mkRKFG++sBCO5M8ZI1d6IbTHUga7/1WEP2MwFhLK0Fog37hDSHzaUyl7Vxsj22/WrWuZ0EKT4Au7G5GMHhPUAmWAiHsePMsJ3M+5Iyv/nE0Xz/x/UuwnAwhAEp3AT6O8GVTmLdhA2KaFBYBksxAZlBGRDxREgJa10oxF0j4Mv3TwEGOwKdMdDKwQY/oIR35fkk+7+4gvmZrFLjdmh8j53uL/LUCdJ07znYRi4+08rBc+nUuIOwLvqBUZFZVyHCENbILDVk5R5Hep/XnG+qk23PB0cuSB3f1Mt+CtNAeWEUAgY9mA7CO809O5VkelnSLSnq8TA57e3lr+EHuWpqnO60KMvBtzbGXMPVj2UjiDrAnd9f1x2guqFTNHBVWkZE= shayanr"
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

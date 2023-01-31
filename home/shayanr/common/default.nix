# Common home configurations for every system.
{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];
}

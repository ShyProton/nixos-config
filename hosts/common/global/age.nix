{ inputs, ... }:
{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age.secrets = {
    shayanr-password.file = ../secrets/shayanr-password.age;
  };
}

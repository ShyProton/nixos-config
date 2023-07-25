{inputs, ...}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age = {
    identityPaths = [
      "/persist/etc/ssh/ssh_host_ed25519_key"
      "/persist/etc/ssh/ssh_host_rsa_key"
    ];
    secrets = {
      shayanr-password.file = ../secrets/shayanr-password.age;
    };
  };
}

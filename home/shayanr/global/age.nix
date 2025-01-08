{inputs, ...}: {
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  age = {
    identityPaths = [
      "/persist/etc/ssh/ssh_host_ed25519_key"
      "/persist/etc/ssh/ssh_host_rsa_key"
    ];
    secrets = {
      copilot-api-key = {
        file = ../../../hosts/common/secrets/copilot-api-key.age;
        path = "/etc/copilot-api-key";
      };
    };
  };
}

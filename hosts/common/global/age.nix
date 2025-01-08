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
      # TODO: Make this work! Currently just reads the file from the desktop
      # which is very suboptimal!!
      shayanr-password.file = ../secrets/shayanr-password.age;
    };
  };
}

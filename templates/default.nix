{
  rust = {
    path = ./rust;
    description = "Rust environment (Cargo)";
    welcomeText = ''
      # Rust/Cargo Template
      Template for a rust/cargo project using crane.

      ## More info
      - Rust language: https://www.rust-lang.org
      - NixOS Wiki entry: https://nixos.wiki/wiki/rust
    '';
  };

  node = {
    path = ./node;
    description = "Node environment";
    welcomeText = ''
      # NodeJS Template
      Template for a NodeJS project.

      ## More info
      - NixOS Wiki entry: https://nixos.wiki/wiki/Node.js
    '';
  };

  python = {
    path = ./python;
    description = "Python environment";
    welcomeText = ''
      # Python Template
      Template for a Python project using Poetry.

      ## More info
      - NixOS Wiki for Python: https://nixos.wiki/wiki/Python
      - Poetry: https://github.com/nix-community/poetry2nix
    '';
  };

  kernel-mod = {
    path = ./kernel-mod;
    description = "Kernel Module development environment using C";
    welcomeText = ''
      # Kernel Module Template
      Template for a Kernel Module project using C.
    '';
  };

  pico-8 = {
    path = ./pico-8;
    description = "Pico-8 development environment";
    welcomeText = ''
      # PICO-8 Template
      Template for a PICO-8 project using Lua.
    '';
  };
}

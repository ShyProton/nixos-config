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
}

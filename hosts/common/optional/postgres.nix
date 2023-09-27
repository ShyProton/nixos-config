{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    ensureDatabases = ["mydb"];
    enableTCPIP = true;

    authentication = pkgs.lib.mkOverride 11 ''
      #...
      #type database DBuser origin-address auth-method
      # ipv4
      local  all      all                   trust
      # ipv6
      host all       all     ::1/128        trust
    '';

    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      CREATE DATABASE nixcloud;
      GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
    '';
  };

  environment.persistence."/persist".directories = ["/var/lib/postgresql"];
}

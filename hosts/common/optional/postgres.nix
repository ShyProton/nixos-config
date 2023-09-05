{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    ensureDatabases = ["mydb"];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser auth-method
      local all      all    trust
    '';
  };

  environment.persistence."/persist".directories = ["/var/lib/postgresql"];
}

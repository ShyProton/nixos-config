{pkgs, ...}: {
  # Packages to be implemented on all machines.
  environment.systemPackages = with pkgs; [
    vim
    wget
    pciutils
    psmisc
    zip
    unzip
  ];

  programs = {
    dconf.enable = true;
    nix-ld.enable = true;
  };
}

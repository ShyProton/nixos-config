{pkgs, ...}: {
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  environment.systemPackages = with pkgs; [virt-manager];

  # Ensure libvirtd group exists.
  users.groups.libvirtd = {};

  environment.persistence."/persist".directories = [
    "/var/lib/libvirt"
    "/var/cache/libvirt"
  ];
}

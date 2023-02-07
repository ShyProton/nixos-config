# NOTE: It can be debated on whether or not impermanence should be a global
# feature for all machines, mostly up to personal preference.
# I choose to implement it on all machines since I want all my systems
# to be as declarative as possible: any state not specified as persistent or
# otherwise unspecified in the configuration should be removed.
{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  programs.fuse.userAllowOther = true;

  # Defining which system directories/files persist every boot.
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"

      "/var/log"
      "/var/lib/systemd"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}

{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  fileSystems."/run/media/leo/Data" = {
    device = "/dev/disk/by-uuid/eaaa67f3-17b8-4399-ad84-6785dae0014a";
    fsType = "ext4";
  };
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dnsmasq
    podman-tui
    # podman-compose
  ];

  networking.firewall.trustedInterfaces = [ "virbr0" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    # docker = {
    #   enable = false;

    #   rootless = {
    #     enable = true;
    #     setSocketVariable = true;
    #   };
    # };
  };

  programs.virt-manager.enable = true;
}

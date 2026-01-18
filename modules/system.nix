{ pkgs, ... }:

{
  system.stateVersion = "25.11";

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 100;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking = {
    enableIPv6 = true;

    hostName = "nixos";
    # wireless.enable = true;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [
        80
        443
      ];
      allowedUDPPorts = [ 53317 ];
      allowedTCPPortRanges = [
        {
          from = 0;
          to = 65535;
        }
      ];
    };
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    wget
    eza
    # unrar
    nil
    nixd
  ];

  programs = {
    git.enable = true;
    gamemode.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    tuned.enable = true;
    upower.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      # libinput.enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing.enable = true;

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
      # media-session.enable = true;
    };

    # openssh.enable = true;
  };
}

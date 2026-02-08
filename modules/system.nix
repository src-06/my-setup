{ pkgs, ... }:

# let
#   VioletEvergardenGrubTheme = pkgs.stdenv.mkDerivation {
#     name = "violet-evergarden-grub-theme";
#     src = ../customs/grub-theme;
#     dontBuild = true;
#     installPhase = ''
#       cp -r violet-evergarden/ $out/
#     '';
#   };
# in
{
  system.stateVersion = "25.11";

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      systemd-boot.enable = false;

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        # theme = VioletEvergardenGrubTheme;
        # splashImage = "${VioletEvergardenGrubTheme}/background.png";
        font = "${pkgs.inter}/share/fonts/truetype/Inter-Regular.ttf";
        gfxmodeEfi = "1920x1080";
        extraConfig = ''
          set gfxpayload=keep
          set menu_color_normal=light-gray/black
          set menu_color_highlight=dark-gray/light-gray
        '';
      };

      efi.canTouchEfiVariables = true;
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
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
    git
    gh
    wget
    eza
    rsync
    tree
    unrar
    nil
    nixd
    vim
  ];

  programs = {
    # direnv.enable = true;
    gamemode.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    # logind.settings.Login = {
    #   PowerKeyIgnoreInhibited = true;
    #   HandleLidSwitch = "suspend";
    #   HandleLidSwitchDocked = "ignore";
    #   HandleSuspendKey = "suspend";
    #   HandleLowBattery = "suspend";
    # };

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

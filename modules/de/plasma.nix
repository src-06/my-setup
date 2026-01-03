{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.kdegraphics-thumbnailers
    kdePackages.partitionmanager
    kdePackages.kate
    # kdePackages.sddm-kcm
    kdePackages.plasma-firewall
    firewalld
    mpv
    haruna
  ];

  services = {
    # displayManager.sddm.enable = true;

    xserver.displayManager.lightdm = {
      enable = true;
      greeters.slick = {
        enable = true;
        font = {
          name = "Inter Nerd Font 11";
          package = pkgs.inter-nerdfont;
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
        theme.name = "Adwaita-dark";
        draw-user-backgrounds = true;
      };
      background = "/usr/background/1309619-mirror.png";
    };

    desktopManager.plasma6.enable = true;
  };
}

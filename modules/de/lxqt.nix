{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    gvfs
    ffmpegthumbnailer
    evince
  ];

  services.xserver = {
    displayManager.lightdm = {
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
        draw-user-backgrounds = true;
      };
      background = "/usr/share/backgrounds/1309619-mirror.png";
    };

    desktopManager.lxqt.enable = true;
  };
}

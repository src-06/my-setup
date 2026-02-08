{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # mpv
      gvfs
      ffmpegthumbnailer
      evince
      kdePackages.ark
    ];

    lxqt.excludePackages = with pkgs; [
      lxqt.qterminal
      lxqt.lxqt-archiver
      lxqt.lximage-qt
    ];
  };

  services.xserver.desktopManager.lxqt.enable = true;
}

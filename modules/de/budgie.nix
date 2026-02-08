{ pkgs, ... }:

{
  environment.budgie.excludePackages = with pkgs; [
    nemo
    mate.atril
    mate.engrampa
    mate.mate-system-monitor
    gnome-terminal
  ];

  services.desktopManager.budgie.enable = true;
}

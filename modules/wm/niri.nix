{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    kdePackages.qt6ct
    nwg-look
    wl-mirror
    # kanshi
    kitty
  ];

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };

    xwayland.enable = true;
  };

  security.polkit.enable = true;
}

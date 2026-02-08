{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      xwayland-satellite
      kdePackages.qt6ct
      nwg-look
      wl-mirror
      kitty
    ];

    variables = {
      TERMINAL = "kitty";
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
  };

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
    xwayland.enable = true;
  };

  # security.polkit.enable = true;
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    polkit_gnome
    kdePackages.qt6ct
    nwg-look
    wl-mirror
    # kanshi
    kitty
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };

    xwayland.enable = true;
  };

  security.polkit.enable = true;
}

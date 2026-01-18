{ pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "src-06";
  home.homeDirectory = "/home/src-06";

  home.packages = with pkgs; [
    # Display device informations
    fastfetch

    # Icon themes
    papirus-icon-theme

    # Browsers
    brave
    firefox

    # Text editors
    fresh-editor
    vscode
    zed-editor

    # Design
    # pinta

    # Office
    wpsoffice

    # Softwares
    gucharmap
    vesktop
    localsend
    obs-studio
    github-desktop
    yt-dlp
    pear-desktop

    # Game launchers
    (bottles.override { removeWarningPopup = true; })
    steam

    # Game Engine
    # godot
  ];

  xdg.configFile."fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."niri/config".source = ./config/niri/config;
  xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;

  xdg.dataFile."icons/Imouto".source = ./data/icons/Imouto;
}

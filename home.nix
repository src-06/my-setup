{ pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "leo";
  home.homeDirectory = "/home/leo";

  home.packages = with pkgs; [
    # Display device informations
    fastfetch

    # Icon themes
    papirus-icon-theme

    # Browsers
    firefox
    chromium

    # Text editors
    vscode
    zed-editor

    # Design
    pinta

    # Office
    # kdePackages.calligra
    # libreoffice
    # onlyoffice-desktopeditors
    wpsoffice

    # Softwares
    gucharmap
    vesktop
    localsend
    github-desktop
    yt-dlp
    pear-desktop

    # Game launchers
    steam
    lutris

    # Game Engine
    godot
  ];

  xdg.configFile."kitty/kitty.conf".source = ./config/kitty/kitty.conf;
  xdg.configFile."niri/config".source = ./config/niri/config;
  xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;

  xdg.dataFile."icons/Imouto".source = ./data/icons/Imouto;
}

{ pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "src-06";
  home.homeDirectory = "/home/src-06";

  home.packages = with pkgs; [
    # Display device informations
    fastfetch

    # Folder icons
    (papirus-icon-theme.override { color = "yaru"; })

    # Browsers
    brave
    google-chrome
    firefox

    # OpenCode AI
    opencode

    # Text editors
    fresh-editor
    vscode
    zed-editor

    # Image editing
    pinta
    krita
    # gimp

    # 3D modeling
    blender

    # Office
    wpsoffice

    # Softwares
    thunderbird-bin
    vesktop
    obs-studio
    github-desktop
    pear-desktop

    # Tools
    gucharmap
    localsend
    yt-dlp

    # Game launchers
    # (bottles.override { removeWarningPopup = true; })
    lutris
    steam
    # protonup-qt

    # Game Engine
    # godot
    # unityhub

    # Development
    bun
    clang
    clang-tools
    nodePackages.nodejs
    nodePackages.pnpm
    nodePackages.yarn
    php82
    php82Packages.composer

    # Database Viewer and Editor
    antares

    # RDBMS
    mariadb
    postgresql
  ];

  xdg.configFile."fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."niri/config".source = ./config/niri/config;
  xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
}

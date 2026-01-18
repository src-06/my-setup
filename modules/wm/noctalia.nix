{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
    cliphist
    wtype
    matugen
    wlsunset
    pywalfox-native
  ];

  programs.noctalia-shell = {
    enable = true;

    settings = {
      general = {
        scaleRatio = 0.95;
        showScreenCorners = true;
        forceBlackScreenCorners = true;
      };

      ui = {
        fontDefault = "Inter Nerd Font";
        fontFixed = "JetBrainsMono Nerd Font Mono";
        fontFixedScale = 0.8;
        panelBackgroundOpacity = 1;
      };

      colorSchemes = {
        darkMode = true;
        useWallpaperColors = true;
        matugenSchemeType = "scheme-rainbow";
      };

      templates = {
        # UI
        gtk = true;
        qt = true;

        # Compositor
        niri = true;

        # Programs
        discord = true;
        pywalfox = true;
        cava = true;
      };

      wallpaper = {
        overviewEnabled = true;
        hideWallpaperFilenames = true;
      };

      bar = {
        floating = true;
        backgroundOpacity = 1;
        hideOnOverview = true;

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "SystemMonitor";
              compactMode = false;
              showNetworkStats = true;
            }
            { id = "ActiveWindow"; }
          ];

          center = [
            {
              id = "Workspace";
              labelMode = "none";
              hideUnoccupied = false;
              showApplications = true;
              unfocusedIconsOpacity = 0.5;
              groupedBorderOpacity = 0.5;
            }
          ];

          right = [
            {
              id = "MediaMini";
              showAlbumArt = true;
              showVisualizer = true;
            }
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Volume"; }
            { id = "Brightness"; }
            {
              id = "Battery";
              alwaysShowPercentage = false;
              warningThreshold = 30;
            }
            { id = "Bluetooth"; }
            { id = "WiFi"; }
            {
              id = "Clock";
              formatHorizontal = "h:mm AP";
              formatVertical = "h mm AP";
            }
            { id = "SessionMenu"; }
          ];
        };
      };

      dock.enabled = false;

      controlCenter = {
        position = "top_left";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "DarkMode";
            }
            {
              id = "WallpaperSelector";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };

      appLauncher = {
        position = "follow_bar";
        showCategories = false;
        enableClipboardHistory = true;
        autoPasteClipboard = true;
        sortByMostUsed = false;
        terminalCommand = "kitty -e";
      };

      osd.enabledTypes = [
        0
        1
        2
        3
      ];

      sessionMenu = {
        position = "top_right";
        showNumberLabels = false;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = false;
          }
          {
            action = "hibernate";
            enabled = false;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };

      calendar.cards = [
        {
          enabled = true;
          id = "calendar-header-card";
        }
        {
          enabled = true;
          id = "calendar-month-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
      ];

      location = {
        name = "Gunung Putri";
        monthBeforeDay = true;
        use12hourFormat = true;
      };
    };
  };
}

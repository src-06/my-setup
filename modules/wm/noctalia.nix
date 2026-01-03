{ pkgs, ... }:

{
  home.packages = with pkgs; [
    quickshell
    xdg-desktop-portal
    gpu-screen-recorder
    cava
    cliphist
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
        matugenSchemeType = "scheme-content";
      };

      templates = {
        # UI
        gtk = true;
        qt = true;
        kcolorscheme = true;

        # Compositor
        niri = true;

        # Terminal
        kitty = true;

        # Programs
        discord = true;
        pywalfox = true;
        cava = true;
      };

      wallpaper = {
        overviewEnabled = true;
        hideWallpaperFilenames = true;
        randomEnabled = true;
      };

      bar = {
        backgroundOpacity = 1;

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
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
            { id = "ScreenRecorder"; }
            { id = "NoctaliaPerformance"; }
            {
              id = "Battery";
              alwaysShowPercentage = false;
              warningThreshold = 30;
            }
            { id = "Volume"; }
            { id = "DarkMode"; }
            { id = "NightLight"; }
            { id = "Brightness"; }
            {
              id = "Clock";
              formatHorizontal = "h:mm AP";
              formatVertical = "h mm AP";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            { id = "SessionMenu"; }
          ];
        };
      };

      dock.enabled = false;

      controlCenter = {
        position = "top_left";
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
        sortByMostUsed = false;
        terminalCommand = "kitty -e";
      };

      osd.enabledTypes = [
        0
        1
        2
        3
        4
      ];

      sessionMenu = {
        position = "top_right";
        showNumberLabels = false;
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
          enabled = false;
          id = "timer-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
      ];

      location = {
        name = "Desa Gunung Putri, Indonesia";
        monthBeforeDay = true;
        use12hourFormat = true;
      };
    };
  };
}

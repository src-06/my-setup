{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cava
    # cliphist
    # wtype
    # matugen
    # wlsunset
    # swayidle
    # mpvpaper
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
        panelBackgroundOpacity = 0.8;
      };

      colorSchemes = {
        darkMode = true;
        useWallpaperColors = true;
        generationMethod = "rainbow";
        # predefinedScheme = "Nord";
      };

      templates = {
        # UI
        gtk = true;
        qt = true;

        # Compositor
        # niri = true;

        # Programs
        cava = true;
        discord = true;
        pywalfox = true;
      };

      wallpaper = {
        overviewEnabled = true;
        hideWallpaperFilenames = true;
      };

      bar = {
        backgroundOpacity = 0.8;
        floating = true;
        hideOnOverview = true;

        widgets = {
          left = [
            {
              id = "Launcher";
              usePrimaryColor = true;
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
              showPowerProfiles = true;
              showNoctaliaPerformance = true;
            }
            { id = "Bluetooth"; }
            { id = "WiFi"; }
            {
              id = "Clock";
              formatHorizontal = "h:mm AP - ddd MMM dd";
              tooltipFormat = "h:mm AP - dddd, dd MMMM yyyy";
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };

      dock.enabled = false;

      controlCenter = {
        position = "top_right";
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
        position = "top_left";
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
            action = "logout";
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
            action = "reboot";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };

      location = {
        name = "Gunung Putri";
        monthBeforeDay = true;
        use12hourFormat = true;
      };

      # hooks = {
      #   enabled = true;
      #   screenLock = "swayidle -w timeout 210 'niri msg action power-off-monitors' timeout 600 'systemctl suspend' before-sleep 'noctalia-shell ipc call lockScreen lock'";
      #   screenUnlock = "kill swayidle";
      # };
    };

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        kaomoji-provider = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        # mpvpaper = {
        #   enabled = true;
        #   sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        # };
        translator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 1;
    };

    # pluginSettings = {
    #   mpvpaper = {
    #     active = true;
    #     currentWallpaper = "/home/src-06/Pictures/Wallpapers/violet-evergarden-sleep-live.mp4";
    #   };
    # };
  };
}

{
  programs.plasma = {
    enable = true;

    hotkeys.commands = {
      "obs-save-replay" = {
        name = "OBS Save Replay";
        key = "Meta+F12";
        command = "obs-cmd replay save";
      };

      "open-terminal" = {
        name = "Open Terminal";
        key = "Meta+T";
        command = "kitty";
      };
    };

    shortcuts = {
      kwin = {
        "Quit" = "Meta+Q";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch Window to Desktop 1" = "Meta+Shift+1";
        "Switch Window to Desktop 2" = "Meta+Shift+2";
        "Switch Window to Desktop 3" = "Meta+Shift+3";
        "Switch Window to Desktop 4" = "Meta+Shift+4";
      };
    };

    fonts = {
      fixedWidth = {
        family = "JetBrains Mono Nerd Font";
        pointSize = 10;
      };
      general = {
        family = "JetBrains Mono";
        pointSize = 10;
      };
      menu = {
        family = "JetBrains Mono";
        pointSize = 10;
      };
      small = {
        family = "JetBrains Mono";
        pointSize = 8;
      };
      toolbar = {
        family = "JetBrains Mono";
        pointSize = 10;
      };
      windowTitle = {
        family = "JetBrains Mono";
        pointSize = 10;
      };
    };

    kwin = {
      effects = {
        desktopSwitching.animation = "off";
        blur = {
          enable = true;
        };
      };
    };

    powerdevil.AC = {
      autoSuspend.action = "nothing";
      dimDisplay.enable = false;
      displayBrightness = 100;
      turnOffDisplay.idleTimeout = 180; # 3 minutes idle for display to turn off
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
  };
}
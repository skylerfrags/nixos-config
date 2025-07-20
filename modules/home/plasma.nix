{
  programs.plasma = {
    enable = true;

    hotkeys.commands."obs-save-replay" = {
      name = "OBS Save Replay";
      key = "Meta+F12";
      command = "obs-cmd replay save";
      comment = "Save OBS replays using obs-cmd and websockets";
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

    powerdevil.AC = {
      autoSuspend.action = "nothing";
      dimDisplay.enable = false;
      displayBrightness = 100;
      turnOffDisplay.idleTimeout = 180; # 3 minutes idle for display to turn off
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
  };
}
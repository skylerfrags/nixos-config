{
  programs.plasma = {
    enable = true;

    shortcuts = {
      "services/net.local.obs-cmd.desktop"."_launch" = "Meta+F12"; # obs-cmd Websocket for replay buffer
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
  };
}
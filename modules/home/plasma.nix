{
  programs.plasma = {
    enable = true;

    shortcuts = {
      "services/net.local.obs-cmd.desktop"."_launch" = "Meta+F12"; # obs-cmd Websocket for replay buffer
    };

    fonts = {
      general = {
        family = "JetBrains Mono Nerd Font";
        pointSize = 10;
      };
    };
  };
}
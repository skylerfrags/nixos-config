{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };
    settings = {
      background_opacity = 0.75;
      hide_window_decorations = false; # enable when using niri
    };
  };

  programs.zellij = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    bashrcExtra = "eval $(starship init bash)";
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}

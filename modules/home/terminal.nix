{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      background_opacity = 0.5;
      hide_window_decorations = true;
    };
  };

  programs.zellij = {
    enable = true;
  };
}
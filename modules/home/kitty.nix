{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    extraConfig = "hide_window_decorations yes";
  };
}
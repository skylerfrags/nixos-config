{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    themeFile = "Catppuccin-Mocha";

    settings = {
      background_opacity = "0.75";
    };
  };
}
{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      #background_opacity = 0.5;
      hide_window_decorations = true;
    };
  };

  programs.zellij = {
    enable = true;
  };
}
{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      #background_opacity = 0.5;
      hide_window_decorations = false; # enable when using plasma
    };
  };

  programs.zellij = {
    enable = true;
  };
}

{ pkgs, ... }:
{
  
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    fuzzel
  ];

  programs.niri.config = builtins.readFile ./config.kdl;

  services.swww.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
  };

}
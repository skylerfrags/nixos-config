{ pkgs, ... }:

{

  imports = [
    ./hyprland.nix
    #./rofi.nix
    #./waybar.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
    waybar
    hyprshot
    dunst
    swww
    pavucontrol
  ];

}
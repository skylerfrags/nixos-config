{ config, pkgs, ... }:
{
  services = {
    ## kde
    # desktopManager.plasma6.enable = true;
  
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  ## hyprland
  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };
}
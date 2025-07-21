{ inputs, config, pkgs, ... }:
{
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.package = pkgs.kdePackages.sddm;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = false;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.xwayland.enable = true;

  programs.niri.enable = true;
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  #programs.niri.settings.xwayland-satellite.enable = true;
}

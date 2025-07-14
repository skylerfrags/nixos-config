{ inputs, config, pkgs, ... }:
{
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    kate
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.xwayland.enable = true;

  programs.niri.enable = false;
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  #programs.niri.settings.xwayland-satellite.enable = true;
}

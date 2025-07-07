{ inputs, config, pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = false;
  
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.niri.enable = true;
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;
}

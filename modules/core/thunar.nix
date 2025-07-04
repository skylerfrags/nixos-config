{ config, pkgs, ... }:

{
  programs.thunar = {
    enable = true;
  };

  services = {
    gvfs.enable = true;    # Mounting and other stuff
    tumbler.enable = true; # Thumbnails
  };
}
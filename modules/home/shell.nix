{ config, pkgs, ... }:
{

  programs.bash = {
    enable = true;
    bashrcExtra = "eval $(starship init bash)";
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
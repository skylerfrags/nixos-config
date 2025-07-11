{ config, pkgs, ... }:
{
  stylix.targets = {
    cava.rainbow.enable = true;
    vesktop.enable = false;
    neovim.enable = false;
    vscode.enable = false;
    waybar.enable = false;
    chromium.enable = false;
  };
}
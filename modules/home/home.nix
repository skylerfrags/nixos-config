{ inputs, config, pkgs, ... }:

{

  imports = [

    ## desktops
    ./niri
    #./plasma.nix

    ## programs with configuration
    ./git.nix
    ./terminal.nix
    #./zen.nix       # Firefox Fork
    ./brave.nix    # Chromium Fork
    ./obs.nix
    ./cava.nix
    
  ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
    cursors = {
      enable = true;
      flavor = "mocha";
      accent = "dark";
    };
    gtk = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
      icon = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
      };
    };
    cava.transparent = true;
    nvim.enable = false;
    waybar.enable = false;
  };

  home.packages = with pkgs; [

    ## general
    unzip
    ripgrep
    fzf
    htop
    bitwarden
    wget
    easyeffects
    ffmpeg
    #grayjay           # 04/07/2025, doesnt build, sha256:c1053553fbff49e3bc136efcf3612ab3639baec7914fa407472a8e74b440ff4d is not a valid attribute name: prebuilt/.gitattributes:2
    davinci-resolve
    krita
    #gimp              # 16/07/2025, doesnt build with current lock file

    ## gaming
    lutris
    protonplus
    #crispy-doom
    #dsda-doom
    #chocolate-doom
    #bottles
    #dolphin-emu
    cemu
    ryujinx
    #rpcs3
    #dolphin-emu
    #mupen64plus
    #prismlauncher

    ## dev
    vscode
    neovim
    odin                # May build it from master branch instead at some point
    gcc

  ];

  # enabling programs with no configuration
  programs = {
    btop.enable = true;
    spotify-player.enable = true;
    mpv.enable = true;
    lazygit.enable = true;
    mangohud.enable = true;
    vesktop.enable = true;
  };

  home.username = "skyler";
  home.homeDirectory = "/home/skyler";
  home.stateVersion = "25.05";
}

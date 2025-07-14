{ inputs, config, pkgs, ... }:

{

  imports = [

    #./desktops/niri
    # I wanna add kde plasma as a 2nd option but
    # i cba to learn plasma-manager rn

    ./git.nix
    ./terminal.nix
    ./shell.nix
    ./zen.nix       # Firefox Fork
    #./brave.nix    # Chromium Fork
    ./obs.nix
    ./cava.nix
    
  ];

  home.packages = with pkgs; [

    ## general
    unzip
    ripgrep
    fzf
    htop
    bitwarden
    wget

    ## audio and video
    obs-cmd             # WHY DOES WAYLAND NOT HAVE GLOBAL KEYBINDS??????????????
    easyeffects
    ffmpeg
    # grayjay           # 04/07/2025, doesnt build, sha256:c1053553fbff49e3bc136efcf3612ab3639baec7914fa407472a8e74b440ff4d is not a valid attribute name: prebuilt/.gitattributes:2
    davinci-resolve
    krita
    gimp

    ## gaming
    lutris
    protonplus
    #crispy-doom
    #dsda-doom
    #chocolate-doom
    #bottles
    #dolphin-emu
    #cemu
    #ryujinx
    #rpcs3
    #dolphin-emu
    #mupen64plus
    #prismlauncher

    ## dev
    vscode
    neovim
    odin                # May build it from master branch instead at some point
    gcc

    ## fun terminal stuff
    pipes
    tty-clock

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

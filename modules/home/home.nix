{ config, pkgs, ... }:

{

  imports = [

    ./desktops/niri
    # I wanna add kde plasma as a 2nd option but
    # i cba to learn plasma-manager rn

    ./git.nix
    ./discord.nix
    ./kitty.nix
    ./shell.nix
    ./brave.nix
    ./obs.nix
    ./cava.nix
    
  ];

  catppuccin = {
    enable = true;
    accent = "pink";
    flavor = "mocha";
    cursors.enable = true;
    cursors.flavor = "mocha";
    cursors.accent = "dark";
    gtk.enable = true;
    cava.transparent = true;
  };

  home.packages = with pkgs; [

    ## general
    unzip
    ripgrep
    fzf
    htop
    bitwarden
    wget

    ## audio and video
    easyeffects
    ffmpeg
    # grayjay           # 04/07/2025, doesnt build, sha256:c1053553fbff49e3bc136efcf3612ab3639baec7914fa407472a8e74b440ff4d is not a valid attribute name: prebuilt/.gitattributes:2
    davinci-resolve

    ## gaming
    lutris
    protonplus
    #dolphin-emu
    #cemu
    #ryujinx
    #prismlauncher

    ## dev
    vscode
    neovim
    odin                # May build it from master branch instead at some point
    gcc

    ## fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji

  ];

  # enabling programs with no configuration for catppuccin flake
  programs = {
    btop.enable = true;
    spotify-player.enable = true;
    mpv.enable = true;
    lazygit.enable = true;
    mangohud.enable = true;
  };

  home.username = "skyler";
  home.homeDirectory = "/home/skyler";
  home.stateVersion = "25.05";
}

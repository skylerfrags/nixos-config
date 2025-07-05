{ config, pkgs, ... }:

{

  imports = [
    ./git.nix
    ./discord.nix
    ./kitty.nix
    ./shell.nix
    ./brave.nix
  ];

  home.packages = with pkgs; [

    ## cli
    maxfetch
    unzip
    ripgrep
    fzf
    btop
    htop
    neovim
    lazygit

    ## general
    bitwarden
    wget

    ## audio and video
    spotify
    obs-studio
    easyeffects
    mpv
    ffmpeg
    # grayjay           # 04/07/2025, doesnt build, sha256:c1053553fbff49e3bc136efcf3612ab3639baec7914fa407472a8e74b440ff4d is not a valid attribute name: prebuilt/.gitattributes:2
    davinci-resolve

    ## gaming
    lutris
    protonplus
    #dolphin-emu
    #prismlauncher

    ## dev
    vscode
    odin                # May build it from master branch instead at some point

    ## fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji

  ];

  home.username = "skyler";
  home.homeDirectory = "/home/skyler";
  home.stateVersion = "25.05";
}

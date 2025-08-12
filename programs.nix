{ pkgs, ... }:
{
  
  environment.systemPackages = with pkgs; [

    ## general
    ghostty
    unzip
    brave
    ripgrep
    vesktop
    starship
    fastfetch
    fzf
    htop
    btop
    bitwarden
    wget
    easyeffects
    mpv
    ffmpeg
    grayjay
    davinci-resolve
    krita
    #gimp
    sonusmix
    obs-cmd

    ## gaming
    lutris
    mangohud
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
    zellij
    lazygit
    vscode
    neovim
    odin
    gcc

  ];

  programs.bash.promptInit = ''eval "$(starship init bash)"'';

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = true;};
    plugins = with pkgs.obs-studio-plugins; [
      obs-multi-rtmp
      obs-pipewire-audio-capture
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.dconf.enable = true;

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  programs.git = {
    enable = true;
  };
}

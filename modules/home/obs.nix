{ config, pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = true;};
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-multi-rtmp
      obs-pipewire-audio-capture
    ];
  };

  home.packages = with pkgs; [
    obs-cmd  # enable global hotkeys via websockets
  ];
}
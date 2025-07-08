{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 240;
        autosens = 1;
        bars = 0;
        center_align = 0;
      };
      output = {
        channels = "mono";
        mono_option = "average";
      };
      smoothing = {
        monstercat = 1;
        waves = 0;
        noise_reduction = 25;
      };
    };
  };
}
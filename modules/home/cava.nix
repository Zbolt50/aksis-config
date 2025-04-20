{ pkgs, ... }:
{
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;
      color = {
        background = "'#101010'";
        foreground = "'#cd2029'";
      };
    };
  };

}

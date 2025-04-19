{ pkgs, ... }:
{
  # Enable MPD for music
  home.packages = with pkgs; [
    mpc # For controlling MPD via command line
  ];
  services.mpd = {
    enable = true;
    package = pkgs.mpd;

    # This is handled by xdg by default
    # musicDirectory = "/home/${username}/Music/";

    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
         type "pipewire"
         name "My PipeWire Output"
      }
      audio_output {
          type                    "fifo"
          name                    "my_fifo"
          path                    "/tmp/mpd.fifo"
          format                  "44100:16:2"
      }
    '';
  };
  services.mpd-mpris = {
    enable = true;
    package = pkgs.mpd-mpris;
  };
}

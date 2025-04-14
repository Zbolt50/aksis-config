{ pkgs, ... }:
{
  # Enable MPD for music

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
    '';
  };
  services.mpd-mpris = {
    enable = true;
    package = pkgs.mpd-mpris;
  };
}

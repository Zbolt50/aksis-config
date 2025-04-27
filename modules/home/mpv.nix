{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv-unwrapped.wrapper {
      mpv = pkgs.mpv-unwrapped.override { vapoursynthSupport = true; };
      youtubeSupport = true;
    };
    config = {
      keep-open = true;
      profile = "gpu-hq";
      force-window = true;
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}

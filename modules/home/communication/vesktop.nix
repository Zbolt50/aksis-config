{ ... }:
# I love having to break discord TOS just to screenshare
{
  programs.vesktop = {
    enable = true;
    settings = {
      splashBackground = "#101010";
      splashColor = "#ce2029";
      splashThemeing = true;
    };
    vencord = {
      settings = {
        autoUpdate = false;
        notifyAboutUpdates = false;
        plugins = {
          # Add plugins
          YoutubeAdblock = {
            enabled = true;
          };
        };
      };
    };
  };
}

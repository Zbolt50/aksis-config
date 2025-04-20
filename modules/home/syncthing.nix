{ pkgs, username, ... }:
{
  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;
    guiAddress = "localhost:8384";
    tray = {
      enable = true;
    };
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = { };
      folders = { };
    };
  };
}

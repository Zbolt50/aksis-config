{ pkgs, ... }:
{
  services.syncthing = {
    enable = true;
    package = pkgs.syncthing;
    guiAddress = "localhost:7777";
  };
}

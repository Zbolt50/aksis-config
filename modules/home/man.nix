{ pkgs, ... }:
# Allows man pages to link properly. This could probably go somewhere else..
{
  programs.man = {
    enable = true;
    package = pkgs.man;
    generateCaches = true;
  };
}

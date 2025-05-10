{ pkgs, ... }:
{
  programs.neomutt = {
    enable = true;
    vimKeys = true;
  };
  home.packages = with pkgs; [
    w3m
  ];
}

{ pkgs, host, ... }:
let
  hostVars = import ../../hosts/${host}/variables.nix;
  inherit (hostVars)
    browser
    terminal
    fileBrowser
    ;
in
{
  home.packages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "${browser}.desktop";
        "text/plain" = "nvim.desktop";
        "application/pdf" = "zathura.desktop";
        "application/zip" = "ark.desktop";
        "inode/directory" = "${fileBrowser}.desktop";
        # x-scheme-handlers
        "x-scheme-handler/http" = "${browser}.desktop";
        "x-scheme-handler/https" = "${browser}.desktop";
        "x-scheme-handler/terminal" = "${terminal}.desktop";
      };
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config.common.default = "hyprland";
      configPackages = [
        pkgs.hyprland
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

}

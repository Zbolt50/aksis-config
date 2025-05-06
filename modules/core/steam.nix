{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    steam.enable = lib.mkEnableOption "Enable Steam and other Gaming Utils";
  };
  config = lib.mkIf config.steam.enable {

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    programs.gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}

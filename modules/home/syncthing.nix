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
      devices = {
        "aksis" = {
          id = "IVR4HNF-H772KYL-626U5VX-77IVCE4-IQUMVW6-ZZC2OG7-5XTCWLA-SABFJQD";
        };
        "saladin" = {
          id = "JSQEZ7I-JBHJRZU-C7Z5GFS-6WUWFHG-X4HYIW5-6ODZYEH-7FFWDCA-EYVH3QF";
        };
      };
      folders = {
        "Music" = {
          path = "~/Music";
          devices = [
            "aksis"
            "saladin"
          ];
        };
        "Projects" = {
          path = "~/Projects";
          devices = [
            "aksis"
            "saladin"
          ];
        };
        "Vaults" = {
          path = "~/Vaults";
          devices = [
            "aksis"
            "saladin"
          ];
        };
      };
    };
  };
}

{ pkgs, hostname, ... }:
{
  programs.spotify-player = {
    enable = true;
    package = pkgs.spotify-player;
    settings = {

    };
    keymaps = [
      {
        command = "FocusNextWindow";
        key_sequence = "l";
      }
      {
        command = "FocusPreviousWindow";
        key_sequence = "h";
      }
    ];
  };

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "zbolt50";
        ### ENCRYPT THIS BEFORE COMMITING YOU DOLT ###
        password = "";
        device_name = "nix";
      };
    };
  };
}

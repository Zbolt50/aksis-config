{ pkgs, ... }:

# TODO: Enable this only if mpd is enabled
{
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp;

    # Keybinds
    bindings = [
      {
        key = "h";
        command = "previous_column";
      }
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "l";
        command = "next_column";
      }
      {
        key = "g";
        command = "move_home";
      }
      {
        key = "G";
        command = "move_home";
      }

    ];

    settings = {
      ncmpcpp_directory = "~/.local/share/ncmpcpp";
      lyrics_directory = "~/.local/share/ncmpcpp";
      execute_on_song_change = "~/.local/share/ncmpcpp/albumart";
    };
  };

  home.file.".local/share/ncmpcpp/albumart" = {
    source = ./albumart.sh;
    executable = true;
  };
}

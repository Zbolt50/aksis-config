{
  host,
  pkgs,
  ...
}:
let
  hostVars = import ../../hosts/${host}/variables.nix;
  inherit (hostVars)
    browser
    terminal
    fileBrowser
    windowManager
    ;
in
{
  imports = [
    ./${terminal}/${terminal}.nix
    # Make this import folder with a default.nix inside each one
    #./${windowManager}/${windowManager}.nix
    ./${windowManager}
    # Home-manager the filebrowser stuff
    ./${fileBrowser}.nix
    ./${browser}.nix
    ./zsh/zsh.nix

    # Make toggleable
    ./communication

    ./editors/neovim/neovim.nix

    # TODO: send programs to seperate folder to be sourced
    ./git.nix
    ./fastfetch
    ./tmux.nix
    ./fzf.nix
    ./wofi.nix
    ./waybar.nix
    ./zathura.nix
    ./gtk/gtk.nix
    ./virtualization.nix
    ./mangohud.nix
    ./xdg.nix
    ./dunst.nix
    ./syncthing.nix
    # Music
    ./music
    ./cava.nix
  ];

  home.packages = with pkgs; [
    #php
  ];

}

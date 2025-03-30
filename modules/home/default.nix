{ inputs, host, username, ... }:
let
  hostVars = import ../../hosts/${host}/variables.nix;
  inherit (hostVars) browser terminal fileBrowser windowManager;
in
{
  imports = [
    ./${terminal}.nix 
    # Make this import folder with a default.nix inside each one
    #./${windowManager}/${windowManager}.nix
    ./${windowManager}
    # Home-manager the filebrowser stuff
    ./${fileBrowser}.nix
    ./${browser}.nix
    ./zsh/zsh.nix
    ./dotfiles.nix

    # TODO: MAKE NEOVIM NIX AGAIN
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

  ];
}

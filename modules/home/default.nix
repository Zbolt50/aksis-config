{ inputs, host, username, hostVars, ... }:
let
  #inherit (import ../../hosts/${host}/variables.nix) terminal fileBrowser windowManager;
  inherit (hostVars) browser terminal fileBrowser windowManager;
in
{
  imports = [
    ./${terminal}.nix 
    ./${windowManager}/${windowManager}.nix
    ./${fileBrowser}.nix
    ./${browser}.nix
    ./zsh/zsh.nix
    ./dotfiles.nix

    # TODO: MAKE NEOVIM NIX AGAIN
    ./editors

    # TODO: send programs to seperate folder to be sourced
    ./git.nix
    ./fastfetch.nix
    ./tmux.nix
    # Remove this and home-manager stops working
    ./home.nix
  ];



}

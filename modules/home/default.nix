{ inputs, host, username, hostVars, ... }:
let
  #inherit (import ../../hosts/${host}/variables.nix) terminal fileBrowser windowManager;
  inherit (hostVars) terminal fileBrowser windowManager;
in
{
  imports = [
    ./${terminal}.nix 
    ./${windowManager}/${windowManager}.nix
    ./${fileBrowser}.nix
    ./dotfiles.nix
    # This might work ?
    ./home.nix
    # Makes home-manager work
    #inputs.home-manager.nixosModules.home-manager
  ];



}

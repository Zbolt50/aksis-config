{ pkgs, config, inputs, username, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];          
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    # Add home.nix import?
  }
  # Add more home-manager configs
  home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.11";
  };
}

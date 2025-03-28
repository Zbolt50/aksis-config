{ pkgs, inputs, username, host,  ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];          
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs username host;};
    users.${username} = {
        imports = [./../home];
        home = {
            username = "${username}";
            homeDirectory = "/home/${username}";
            stateVersion = "24.11";
            #programs.home-manager.enable = true;
        };
        programs.home-manager.enable = true;
    };
  };

  # Users
  users.mutableUsers = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    isNormalUser = true; 
    description = username; # No need for quotes inside Nix strings unless necessary
    extraGroups = [ "networkmanager" "wheel" "uinput" ];
    # Make this a variable later?
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  # Ensure user has permission to use Nix
  nix.settings.allowed-users = [ username ]; # Corrected to a proper list
}

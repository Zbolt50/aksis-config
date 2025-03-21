{ pkgs, inputs, username, profile, ... }:

# User Setup
{
  # TODO:  move this to ZSH file later
  programs.zsh.enable = true;
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

  # Ensure user has permission to use Nix
  nix.settings.allowed-users = [ username ]; # Corrected to a proper list
}

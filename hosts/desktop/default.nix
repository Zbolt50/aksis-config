{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/default.nix
    ../../profiles/amd/default.nix
    ./desktop.nix
  ];
  # Toggleable config options per host
  steam.enable = true;
  home-row-mods.enable = true;

}

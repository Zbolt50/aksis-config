{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./thinkpad.nix
    ../../modules/core/default.nix
  ];
  # Toggleable config options per host
  steam.enable = true;
  home-row-mods.enable = true;

}

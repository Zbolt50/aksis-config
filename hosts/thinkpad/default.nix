{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/default.nix
    ../../profiles/intel/default.nix
    ./thinkpad.nix
  ];
  # Toggleable config options per host
  steam.enable = true;
  home-row-mods.enable = true;

}

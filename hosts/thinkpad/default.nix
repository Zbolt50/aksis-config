{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./thinkpad.nix
    ../../modules/core/default.nix
  ];

  steam.enable = false;
}

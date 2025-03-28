{ config, ... }:
{
  # Bootloader config
  boot.loader = {
    systemd-boot.enable = false; 
    grub = {
      enable = true; 
      efiSupport = true;
      device = "nodev";
      # keep ten generations in bootloader
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true; 
      efiSysMountPoint = "/boot";
    };
  };
}

{ config, ... }:
{
  # Bootloader config
  boot.loader = {
    systemd-boot.enable = false; 
    grub = {
      enable = true; 
      efiSupport = true;
      device = "nodev";
    };
    efi = {
      canTouchEfiVariables = true; 
      efiSysMountPoint = "/boot";
    };
  };
}

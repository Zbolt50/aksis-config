{ pkgs, ... }:
{
  imports = [
    ./bootloader.nix
    ./configuration.nix
    ./fonts.nix
    ./hardware.nix
    ./networking.nix
    ./pipewire.nix
    ./users.nix
  ];
  environment.systemPackages = with pkgs; [
    wget
    efibootmgr
    tree
    # System Utils
    pciutils
    usbutils
    ripgrep
    qmk
    #R # For PPL 
    #rstudio # For PPL
    cmatrix
    cava
    pavucontrol
  ];
  

}

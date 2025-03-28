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
    #./sddm.nix
    ./xserver.nix
    ./services.nix
  ];
  environment.systemPackages = with pkgs; [
    wget
    efibootmgr
    tree
    # System Utils
    pciutils
    usbutils
    gparted 
    btop
    # Bluetooth
    bluetui
    bluez
    # Other stuff
    ripgrep
    qmk
    #R # For PPL 
    #rstudio # For PPL
    cmatrix
    cava
    pavucontrol
    zip
    unzip
  ];
  

}

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
    ./greetd.nix
    ./xserver.nix
    ./services.nix
    ./virtualization.nix
    ./kanata.nix
  ];
  # Default systemPackages that everyone and their mother needs
  environment.systemPackages = with pkgs; [
    wget
    efibootmgr
    tree
    # System Utils
    pciutils
    usbutils
    inetutils
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
    pipes
    zip
    unzip
    lftp
    # Communication/Email - will migrate to diff folder soon
    vesktop
    thunderbird
  ];

}

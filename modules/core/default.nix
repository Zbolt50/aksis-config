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
    ./greetd.nix
    ./xserver.nix
    ./services.nix
    ./virtualization.nix
    ./steam.nix
    ./kanata.nix
  ];
  # Default systemPackages that everyone and their mother needs
  environment.systemPackages = with pkgs; [

    wget
    tree
    killall
    vim

    # System Utils
    pciutils
    usbutils
    inetutils
    btop

    # Disk Tools
    gparted
    efibootmgr

    # Bluetooth
    bluetui
    bluez

    # Audio/Music Utilities
    ffmpeg
    playerctl

    # Files/Archiving
    zip
    unzip

    # Other stuff
    ripgrep
    qmk

    R # For PPL
    rstudio # For PPL

    # Fun stuff
    aseprite
    tiled
    cowsay
    cmatrix
    pipes

    # Communication/Email - will migrate to diff folder soon
    vesktop
    thunderbird
    zoom-us

    # Switch Homebrew
    fusee-nano
    fusee-launcher
    fusee-interfacee-tk

    # CD/DVD Reading
    kdePackages.k3b
    #libsForQt5.k3b

  ];
  # Testing this, might fix screen sharing
  programs.hyprland.enable = true;

  # Java
  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

}

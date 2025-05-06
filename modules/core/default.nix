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

    # Essential tools to keep me from hating my life
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
    file-roller

    # Other stuff
    ripgrep
    qmk

    R # For PPL
    rstudio # For PPL

    # Silly Terminal Stuff
    cowsay
    cmatrix
    pipes
    sl

    # Communication/Email - will migrate to diff folder soon
    vesktop
    zoom-us

    # Switch Homebrew
    fusee-nano
    fusee-launcher
    fusee-interfacee-tk

    # Images
    nomacs

    # CD/DVD Reading
    kdePackages.k3b

    # Music tools
    tagger
    easytag
    spotdl

    # Notes/Office
    obsidian # would really like to make a home-manager option for this and get that merged

    # Games/Fun
    prismlauncher # for Minecraft

    # Misc
    xdg-desktop-portal

    # NUR PKGS
    #nur.repos.mic92.hello-nur

  ];
  # Testing this, might fix screen sharing
  programs.hyprland.enable = true;

  # Java
  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

}

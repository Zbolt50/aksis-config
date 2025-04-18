{ username, ... }:
{
  # System Defaults that will never change
  system.stateVersion = "24.11";

  # Set your time zone.
  time.timeZone = "America/New_York";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Auto clean old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-7d";
  };

  nixpkgs.config.allowUnfree = true;

  # Creates necesary directories for my workflow if they do not exist
  system.activationScripts.createDirectories.text = ''
    if [ ! -d /home/${username}/Projects ]; then
      mkdir -p /home/${username}/Projects
      chown ${username}:users /home/${username}/Projects
    fi

    if [ ! -d /home/${username}/Vaults ]; then
      mkdir -p /home/${username}/Vaults
      chown ${username}:users /home/${username}/Vaults
    fi
  '';
}

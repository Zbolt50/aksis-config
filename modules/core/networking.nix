{
  hostname,
  ...
}:
{
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;
  # Might migrate this to a seperate services file
  services.openssh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  networking.firewall = {
    enable = true;
  };
}

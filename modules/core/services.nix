{
  inputs,
  pkgs,
  ...

}:
# Anything that should be enabled as a service should be put here.
{
  #############imports = [
  # stuff for Switch Homebrew
  #inputs.nixtendo-switch.nixosModules.nixtendo-switch
  #];
  #services.switch-boot.enable = true;

  # File Services
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Might if/else it if hyprland is chosen
  security.pam.services.hyprlock = { };
  services.xserver.excludePackages = [ pkgs.xterm ];

}

{ ... }:
{
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  #services.blueman.enable = true;
  # need this
  # Might if/else it if hyprland is chosen
  security.pam.services.hyprlock = { };

}

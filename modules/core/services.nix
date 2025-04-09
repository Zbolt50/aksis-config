{ ... }:
{
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  #services.blueman.enable = true;
  # need this
  # Might if/else it if hyprland is chosen
  security.pam.services.hyprlock = { };
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{manufacturer}=="NVIDIA Corp.", ATTRS{product}=="APX", GROUP="nintendo_switch"
  '';

}

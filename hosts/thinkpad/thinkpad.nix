{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    acpi
    # Packages specifically for the thinkpad
  ];
  # Might make a laptop general config to source from
  services.power-profiles-daemon.enable = true;

  # Services for the built-in fingerprint reader
  # This seems to be impossible rn with nix, at least what I tried. so we'll figure it out later
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  # Other driver in case this doesn't work
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}

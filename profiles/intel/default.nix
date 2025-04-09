{ host, pkgs, ... }:
# Intel System Config
# Might add hardware input here and add if else logic
{
  #imports = [
  #  ../../hosts/${host}
  #];

  # Potentially need to add drivers in the near future
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # List pkgs as needed for intel graphics
    ];
  };
}

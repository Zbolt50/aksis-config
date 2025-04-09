{ host, ... }:
# Graphics Drivers for AMD-GPU systems
{
  imports = [
    ../../hosts/${host}
  ];

  # Enable AMD Graphics drivers
  # Most of this should work OOTB, but just to be safe
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}

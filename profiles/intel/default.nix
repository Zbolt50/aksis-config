{ host, ... }:
# Intel System Config
# Might add hardware input here and add if else logic
{
  imports = [
    ../../hosts/${host}
  ];
  # Potentially need to add drivers in the near future
  #drivers.amdgpu.enable = false;
  #drivers.nvidia.enable = false;
  #drivers.nvidia-prime.enable = false;
  #drivers.intel.enable = true;
  #vm.guest-services.enable = false;
}

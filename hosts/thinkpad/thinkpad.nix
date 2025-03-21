{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [                                                                                                                                              
    acpi                                                                                                                                                                                 
    # Packages specifically for the thinkpad
  ];                                                                                                                                                                                     
  # Services for the built-in fingerprint reader                                                                                                                                         
  #services.fprintd.enable = true;                                                                                                                                                        
  #services.fprintd.tod.enable = true;                                                                                                                                                    
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;                                                                                                                           
  # Other driver in case this doesn't work                                                                                                                                               
  #services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}

{ pkgs, home-manager, ... }:
# Hyprland
{

  programs.hyprland = {
    enable = true; 
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
     wofi                                                                                  
     waybar                                                                                
     hyprpaper                                                                             
     dunst                                                                                 
     libnotify                                                                             
     nwg-displays   
  ];
}

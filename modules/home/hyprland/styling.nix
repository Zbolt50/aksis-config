{ ... }:
# Styling/Animations for hyprland
{
  wayland.windowManager.hyprland.settings = {
  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    # Make these controlled by stylix in future
    "col.active_border" = "rgba(ff0000ee)";
    #col.inactive_border = rgba(ff000066)
    "col.inactive_border" =  "rgba(800000ee)";
    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = true; 
    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false;
    layout = "dwindle";
    };
  };
}

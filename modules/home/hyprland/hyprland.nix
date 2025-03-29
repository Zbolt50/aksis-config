{ config, pkgs, home-manager, ... }:
# Hyprland
{ 
  wayland.windowManager.hyprland = {
    enable = true; 
    xwayland.enable = true;
    # Idk if this is even necessary but its staying 
    systemd = {
        enable = true;
        enableXdgAutostart = true;
        variables = ["--all"];
    };
    settings = {
	# Moving these later
	# environment vars
	exec-once = [
		"hyprpaper"
		"waybar"
		"dunst"
		"dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
       	"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
	];

	env = [
	"NIXOS_OZONE_1L, 1"
	"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
    # Make this source this from somewhere else later for
    # ultimate modularity
    	"HYPRCURSOR_THEME,Bibata-Modern-Ice"
    	"HYPRCURSOR_SIZE,22"
   	];

	gestures = {
		workspace_swipe = true;
	};
    };
    # external settings need this in the file
    # wayland.windowManager.hyprland.settings
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [
	"xdg-desktop-autostart.target"
  ];
  home.packages = with pkgs; [
     hyprland
     hyprpaper                                                                             
     hyprcursor
     dunst                                                                                 
     libnotify                                                                             
     nwg-displays   
     wl-clipboard
     hyprpolkitagent
     # Add screenshot tool
  ];
}

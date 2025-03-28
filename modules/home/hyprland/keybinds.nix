{ host, ... }:
let
  hostVars = import ../../../hosts/${host}/variables.nix;
  inherit (hostVars) browser terminal fileBrowser;
in
{
   wayland.windowManager.hyprland.settings = {
    # Keybinds
    "$mainMod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";
    "$ctrlMod" = "SUPER_CTRL";
    "$altMod" = "SUPER_ALT";
    bind = [
    	"$mainMod,R,exec,wofi --show drun"
	"$mainMod,Q,exec,${terminal}"
	#"$mainMod,Q,exec,kitty"
	"$mainMod,C, killactive"
	# Might need if/else logic if dolphin is selected
	"$mainMod,E,exec,${fileBrowser}"

	# Vim-like window-navigation
	"$mainMod, h, movefocus, l"
	"$mainMod, j, movefocus, d"
	"$mainMod, k, movefocus, u"
	"$mainMod, l, movefocus, r"

	"$shiftMod, h, movewindow, l"
	"$shiftMod, j, movewindow, d"
	"$shiftMod, k, movewindow, u"
	"$shiftMod, l, movewindow, r"

	"$ctrlMod, h, resizeactive, -20 0"
	"$ctrlMod, j, resizeactive, 0 20"
	"$ctrlMod, k, resizeactive, 0 -20"
	"$ctrlMod, l, resizeactive, 20 0"

	# Window Binds
	"$mainMod, M, togglesplit"
	"$mainMod, F, fullscreen"
	"$mainMod, P, pseudo"
    "$mainMod, V, togglefloating"

	# Workspace Binds
	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	
	# Move active window to workspace
	"$shiftMod, 1, movetoworkspace, 1"
	"$shiftMod, 2, movetoworkspace, 2"
	"$shiftMod, 3, movetoworkspace, 3"
	"$shiftMod, 4, movetoworkspace, 4"
	"$shiftMod, 5, movetoworkspace, 5"
	"$shiftMod, 6, movetoworkspace, 6"
	"$shiftMod, 7, movetoworkspace, 7"
	"$shiftMod, 8, movetoworkspace, 8"
	"$shiftMod, 9, movetoworkspace, 9"

	# Special Workspace
	"$mainMod, S, togglespecialworkspace, scratchpad"
	"$shiftMod, S, movetoworkspace, special:scratchpad"

	# Mouse
	"$mainMod, mouse_down, workspace, e+1"
	"$mainMod, mouse_up, workspace, e-1"

	# Laptop Binds
    ];
    # Mouse Binds
    bindm = [
    	# Resize windows with mainMond and LMB/RMB and dragging
	"$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
    ];
    bindel = [
	" ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	" ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	" ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	" ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	" ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	" ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
   }; 
}
	
	

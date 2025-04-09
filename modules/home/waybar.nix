{
  host,
  lib,
  ...
}:
# NOTE: modularity can be achived using NIX if/else branching, ergo we can
# specify waybar to output certain bars to certain places on connect/detection
# One issue might be waybar needing updated upon monitor connect, but we will see, this might be handled with a script
# Another idea- if thinkpad- enable second battery module
let
  hostVars = import ../../hosts/${host}/variables.nix;
  inherit (hostVars) terminal;
in
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
          "tray"
        ];
        modules-center = [
          "cpu"
          "memory"
          "temperature"
        ];
        modules-right =
          [
            # TODO: Add some spacing between each bar module

            "pulseaudio"
            "network"
            "bluetooth"

            #  Options for laptops
            # Unless your desktop has a battery. Then more power to you! (LITERALLY!!)
            # Host specific module setups
          ]
          ++ lib.optionals (host == "thinkpad") [
            "power-profiles-daemon"
            "battery"
          ]
          ++ [

            "clock"

          ];
        # Module Formatting
        "cpu" = {
          interval = 5;
          format = "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5} {usage:>2}% ";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          tooltip-format = "{{avg_frequency}}";
        };
        "memory" = {
          interval = 5;
          format = "{}% ";
          max-length = 10;
        };
        "temperature" = {
          critical-threshold = 80;
          format = "{temperatureC}°C ";
          format-critical = "{temperatureC}°C ";
          tooltip = false;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        # Might add other battery module config for 2 battery setups
        "network" = {
          format-wifi = "{icon} ";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = "󰈀 {bandwidthDownOctets}";
          tooltip-format-wifi = "{essid} | {signalStrength}% | {ipaddr}";
          tooltip-format-ethernet = "{ipaddr} / {cidr}";
          format-disconnected = "";
          tooltip = true;
          on-click = "${terminal} -e nmtui";
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-muted = " {format_source}";
          format-bluetooth-muted = "  {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };
        "bluetooth" = {
          format = "";
          interval = 1;
          format-disabled = "";
          format-connected = " {num_connections}";
          tooltip-format = "{controller_alias} | {controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "${terminal} -e bluetui";
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Profile: {profile}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "clock" = {
          format = "{:%a. %b %d | %I:%M %p}";
          format-alt = "{:%I:%M %p}";
          tooltip = true;
          tooltip-format = "{:%m-%d-%Y}";
          timezone = "America/New_York";
        };
        # Import .css from a folder of some kind, or nixifiy it to use stylix in some way
        # Second option is more likely
      }
    ];
    style = ''
          
      *{
          /* `otf-font-awesome` is required to be installed for icons */
          font-size: 14px;
      }
      #waybar {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 12px;
          opacity: 0.9;
      }

      #window {
          padding: 0 10px;
      }
      #waybar.modules-left{
          border-top: 2px solid #800000; 
      }

      window#waybar {
          border: none;
          box-shadow: none;
          text-shadow: none;
          transition-duration: 0s;
          color: rgba(217, 216, 216, 1);
          background: rgba(0, 0, 0, 0.87);
      }
      /*:hover{
          background-color: #333
      }
      */
      window#waybar.solo {
          background: #750303;
      }

      window#waybar.empty {
          /* display: none; */
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      #workspaces {
          margin: 0 5px;
      }

      #workspaces button {
          border-top: 2px solid #800000;
         /* padding: 0  8px;*/
      }

      #workspaces button.visible {
          color: rgba(217, 216, 216, 1);
      }

      #workspaces button.active {
          border-top: 3px solid #ce2029;
      }

      #workspaces button.urgent {
          background-color: #943432;
          color: white;
      }

      #workspaces button:hover {
          border-color: #B76262;
          color: #888888;
      }

      /* Repeat style here to ensure properties are overwritten as there's no !important and button:hover above resets the colour */

      #workspaces button.focused {
          color: #800000;
      }
      #tray,
      #mode,
      #temperature,
      #cpu,
      #memory,
      #pulseaudio{
          padding: 0 5px;
          border-top: 2px solid #800000;
      }
      #pulseaudio:hover{
          border-top: 2px solid #ce2029;
      }
      #bluetooth{
          padding: 0 5px 0 5px;
          border-top: 2px solid #800000;
      }

      #bluetooth:hover {
          border-top: 2px solid #ce2029;
      }
      #power-profiles-daemon{
          padding: 0 10px 0 5px;
          border-top: 2px solid #800000;
      }
      #power-profiles-daemon:hover{
          border-top: 2px solid #ce2029;
      }
      #network{
          padding: 0 5px 0 5px;
          border-top: 2px solid #800000;
      }
      #network:hover {
          border-top: 2px solid #ce2029;
      }
      #custom-media {
          margin: 0px 0px 0px 10px;
          padding: 0 5px 0 5px;
          border-top: 2px solid #800000; 
      }
      #clock {
          border-top: 2px solid #800000;
          margin:  0px 16px 0px 10px;
      } 
      #clock:hover {
          margin: 0px 16px 0px 10px;
          border-top: 2px solid #ce2029;
      }
      #battery {
          margin: 0px 10px 0px 10px;
      }
      #battery.warning {
          color: rgba(255, 210, 4, 1);
      }

      #battery.critical {
          color: rgba(238, 46, 36, 1);
      }

      #battery.charging {
          color: rgba(0, 216, 0, 1);
      }
      #battery.plugged {
          color: rgba(0, 216, 0, 1);
      }
      #custom-power {
          margin : 0px 10px 0px 10px;
      }
      #custom-album-art {
          font-size : 20px;
          background-image : url("/tmp/kunst.png");
      }
      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }
      #cpu {
      	padding: 0 5px 0 5px;
      	margin: 0px 10px 0px 10px;
          	border-top: 2px solid #800000;
      }
      tooltip {
        font-family: "JetBrainsMono Nerd Font";
        color: white;
        background-color: #000000;
        text-shadow: none;
        border-color : #800000;
      }
    '';
  };
}

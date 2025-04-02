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
            headphone = "";
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
  };
}

{
  username,
  ...
}:
{
  # TODO: Make this work
  # Also, add music widget
  # Perhaps use the old random text script for a login screen
  programs.hyprlock = {
    enable = true;
    importantPrefixes = [
    ];
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 100;
        hide_cursor = false;
      };
      background = [
        {
          path = "/home/${username}/aksis-config/modules/stylix/wallpapers/sivawallpaper.png";
          blur_passes = 1;
          blur_size = 5;
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -200";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_family = "JetBrainsMono Nerd Font";
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          placeholder_text = "<i>Password...  </i>";
          shadow_passes = 2;
        }
      ];
      label = [
        # Want more labels? do this.
        {
          # When I get the time...
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%-I:%M:%S %p")"''; # 12 Hour time
          color = "rgb(206, 32, 41)";
          font_size = 34;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 300";
          halign = "right";
        }
        {
          # Date
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A %b %d")"'';
          color = "rgb(255, 255, 255)";
          font_size = 34;
          font_family = "JetBrainsMono Nerd Font Mono ExtraBold";
          position = "0, 200";
          halign = "right";
        }
      ];
    };
  };
}

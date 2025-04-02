{
  username,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        no_fade_in = true;
        no_fade_out = true;
      };
      background = [
        {
          path = "/home/${username}/aksis-config/modules/stylix/wallpapers/sivawallpaper.png";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          size = "250, 60";
          position = "0, -200";
          outline_thickness = 2;
          outer_color = "rgb(CE2029)";
          inner_color = "rgb(101010)";
          font_family = "JetBrainsMono Nerd Font";
          font_color = "rgb(FFFFFF)";

          placeholder_text = "Password ... ";
        }
      ];

    };
  };
}

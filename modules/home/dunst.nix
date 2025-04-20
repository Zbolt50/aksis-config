{
  pkgs,
  ...
}:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = {
        monitor = 1;
        #follow = "keyboard";
        origin = "top-right";
        offset = "15x15";
        width = "320";
        height = "220";
        transparency = 20;
        separator_height = 2;
        separator_color = "auto";
        sort = true;
        font = "JetBrainsMono Nerd Font 14";
        line_height = 0;
        markup = "full";

        # Message Format
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = 40;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_cout = true;
        show_indicators = false;
        icon_position = "left";
        min_icon_size = 16;
        max_icon_size = 96;
        enable_recursive_icon_lookup = true;
      };

      urgency_low = {
        background = "#101010";
        foreground = "#707070";
        frame_color = "#400000";
        timeout = 5;
      };
      urgency_normal = {
        background = "#101010";
        foreground = "#707070";
        frame_color = "#800000";
        timeout = 5;
      };
      urgency_critical = {
        background = "#101010";
        foreground = "#ededed";
        frame_color = "#ce2029";
        timeout = 10;
      };
    };
  };

}

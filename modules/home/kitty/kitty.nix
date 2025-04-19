{
  config,
  lib,
  username,
  ...
}:
# Kitty 🐱 :7
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      background_opacity = "1";
      background_blur = 5;

      # Cursor
      cursor = "#ce2029";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = -1;
      cursor_stop_blinking_after = 15.0;
      cursor_trail = 1;

      # Font
      font_size = "12.0";
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Themeing
      # Fixing this to be in kitty folder later
      include = "siva.conf";

      # Urls
      url_color = "#fa8072";
      url_style = "curly";
      open_url_with = "default";
      detect_urls = "yes";

    };
  };
  xdg.configFile."kitty/siva.conf" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/${username}/aksis-config/modules/home/kitty/siva.conf;
  };

}

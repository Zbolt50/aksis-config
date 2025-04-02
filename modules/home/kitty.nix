{ lib, ... }:
# Kitty 🐱 :7
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      background_opacity = "0.7";
      background_blur = 5;
      cursor = "#ce2029";
      cursor_shape_unfocused = "hollow";
      # Font
      font_size = "12.0";
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      # Fixing this to be in kitty folder later
      include = "current-theme.conf";

    };
  };
}

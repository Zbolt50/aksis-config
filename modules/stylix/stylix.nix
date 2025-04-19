{ pkgs, ... }:
# NOTE: I don't really use this for anything right now, but until I get this red color scheme into a perfect
# base-16 format, I'll use this
{
  stylix = {
    enable = true;
    image = ./wallpapers/sivawallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    # TODO: Whenever I get a free waking moment, make a base 16 colorscheme that doesn't suck
    polarity = "dark";
    # Stylix Fonts
    fonts = {
      monospace = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
      # TODO: Add serif fonts

      sizes = {
        terminal = 12;
      };
    };
  };
  stylix.cursor = {
    package = pkgs.material-cursors;
    name = "Red";
  };

}

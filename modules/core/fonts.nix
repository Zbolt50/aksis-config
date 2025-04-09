{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      font-awesome
      nerd-fonts.jetbrains-mono
      # Find a serif font at some point.
    ];
  };
}

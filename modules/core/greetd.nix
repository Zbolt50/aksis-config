{ pkgs, username, ... }:
{
  # greetd config
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = username;
        # Modularize this later
        command = "${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };
}

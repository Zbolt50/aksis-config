{ pkgs, username, ... }:
{
  # greetd config
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };
}

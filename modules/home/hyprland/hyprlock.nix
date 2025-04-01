{ config, pkgs, ... }:
{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                disable_loading_bar = true;
                grace = 10;
                no_fade_in = false;
            };
        };
    };

    # need this
    security.pam.services.hyprlock = {};
}

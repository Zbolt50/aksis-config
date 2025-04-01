{ pkgs, ... }:
{
	services.gvfs.enable = true;
	services.tumbler.enable = true;
    #services.blueman.enable = true;
    # need this
    security.pam.services.hyprlock = {};


}

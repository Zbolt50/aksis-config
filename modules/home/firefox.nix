{ pkgs, inputs, username, ... }:
{
    programs.firefox = {
        enable = true;
        profiles.${username} = {
        extensions = with pkgs.inputs.firefox-addons; [
            ublock-origin
        ];
        };
    };


}

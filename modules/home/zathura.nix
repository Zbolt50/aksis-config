{ pkgs, ... }:
# Zathura
{
    programs.zathura = {
        enable = true;
        options = {
            default-bg = "#101010";
            default-fg = "#FFFFFF";
            font = "JetBrainsMono Nerd Font";
            selection-clipboard = "clipboard";
        };
    };
}

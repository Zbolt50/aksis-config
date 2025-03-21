{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = false;
        vimdiffAlias = true;
    }
    # Plugin time
}

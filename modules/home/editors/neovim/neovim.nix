{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
    };
    programs.neovim.plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
    
}

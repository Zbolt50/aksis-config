{ pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

	plugins = with pkgs; [
        	pkgs.vimPlugins.nvim-treesitter.withAllGrammars
	];

	extraPackages = with pkgs;  [
		lua-language-server
		stylua
		ripgrep
		fzf
	];
    };
    home.file.".config/nvim" = {
		source = ./plugins/nvim;
		recursive = true;
    };
}

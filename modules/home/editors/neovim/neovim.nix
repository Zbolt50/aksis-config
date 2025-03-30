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
        # Lua 
		lua-language-server
        luarocks
		stylua
        # Nix
        nil
        nixfmt-rfc-style
        # Neovim dependencies
		ripgrep
		fzf
	];
    };
    home.file.".config/nvim" = {
		source = ./plugins/nvim;
		recursive = true;
    };
}

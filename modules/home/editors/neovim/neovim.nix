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
        # These don't work right atm, but this will be solved later.
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

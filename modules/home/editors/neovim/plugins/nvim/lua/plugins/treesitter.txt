return {
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"python",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"r",
				"rnoweb",
				"yaml",
				"latex",
				"csv",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

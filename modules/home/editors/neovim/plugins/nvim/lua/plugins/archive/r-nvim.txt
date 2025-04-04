return {
	-- plugins for R
	-- If that damn lsp server would work that'd be real cool
	{
		"R-nvim/R.nvim",
		-- Only required if you also set defaults.lazy = true
		lazy = false,
		-- R.nvim is still young and we may make some breaking changes from time
		-- to time. For now we recommend pinning to the latest minor version
		-- like so:
		version = "~0.1.0",
		config = function() end,
	},
	{
		"R-nvim/cmp-r",
		config = function()
			require("cmp_r").setup({})
		end,
	},
}

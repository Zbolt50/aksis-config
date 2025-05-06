-- Plugins related to UI and status pluginsui
return {
	{
		-- vimbegood | not to be confused with johnny b goode
		"ThePrimeagen/vim-be-good",
	},
	{
		-- dressing.nvim
		"stevearc/dressing.nvim",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvim-treesitter/playground",
	},
	{
		-- vim-airline
		"vim-airline/vim-airline",
		dependencies = {
			"vim-airline/vim-airline-themes",
		},
		config = function()
			vim.cmd("let g:netrw_liststyle = 3")
			vim.cmd("let g:airline_theme='blood_red'")
			vim.cmd("let g:airline_left_sep = ''")
			vim.cmd("let g:airline_right_sep= ''")
			vim.cmd("let g:airline#extensions#nvimlsp#enabled = 1")
			vim.cmd("let g:airline#extensions#branch#enabled = 1")
			vim.cmd("let g:airline#extensions#branch#enabled = 1")
		end,
	},

	-- nvim-colorizer | useful for like 3 things I use
	{
		"catgoose/nvim-colorizer.lua",
		lazy = true,
		event = "BufReadPre",
		opts = {
			-- set to setup table
		},
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					names = false,
				},
			})
		end,
	},

	{
		-- siva.nvim | by yours truly :7
		--"Zbolt50/siva.nvim",
		dir = "~/Projects/siva.nvim",
	},
}

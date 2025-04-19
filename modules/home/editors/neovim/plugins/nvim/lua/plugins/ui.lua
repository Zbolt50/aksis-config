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
		"Zbolt50/siva.nvim",
		-- dir = "~/Projects/siva.nvim",
	},
	{
		-- snacks.nvim
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					-- stylua: ignore start 
				header = [[
         

                      █████                       
                     ████████                     
                   ████████████                   
                 ████████████████                 
               ████████████████████               
             ███████████ ███████████              
           ███████████     ███████████            
         ███████████         ███████████          
        ███████████            ███████████        
                 █            ███████████         
               ███          ███████████ ██        
             █████        ███████████ ████        
           ███████       ██████████ ██████        
         █████████       ████████ ████████        
       ███████████       ██████ ██████████        
       ██████████        █████ █████████          
       ████████          ███ █████████            
       ██████            █ █████████              
       ████              ██████████               
       ██                ████████                 
                         ██████                   
                         ████                     
                         ██                       
       
       consume. enhance. replicate.


                    ]],
					--stylua: ignore end
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{
							icon = " ",
							key = "n",
							desc = "New File",
							action = ":ene | startinsert",
						},
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						--[[
						{
							icon = "",
							key = "O",
							desc = "Obsidian Notes",
							--action = ":e ~/Documents/Vaults/",
							action = ":ObsidianSearch",
						},
                        --]]
						--[[
						{
							icon = " ",
							key = "p",
							desc = "Open Project",
							action = ":Telescope projects",
						},
                        --]]
						{
							icon = "",
							key = "c",
							desc = "Neovim Config",
							--action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
							action = ":e ~/nixconf/modules/home/editors/neovim/plugins/",
						},
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
						},
						--[[
						{
							icon = "",
							key = "M",
							desc = "Mason",
							action = ":Mason",
						},
                        ]]
						--
						{
							icon = " ",
							key = "q",
							desc = "Quit",
							action = ":qa",
						},
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", padding = 1 },
					{ section = "startup" },
				},
			},
		},
	},
}

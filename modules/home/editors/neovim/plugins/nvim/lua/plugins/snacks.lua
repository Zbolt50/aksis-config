return {
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
				-- stylua: ignore end
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
          --]]
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
}

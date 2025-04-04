return {

	-- obsidian.nvim
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			local obsidian = require("obsidian")
			obsidian.setup({
				workspaces = {
					{
						name = "Vaults",
						path = "~/Documents/Vaults/",
						strict = true,
					},
				},
				daily_notes = {
					-- Optional, if you keep daily notes in a separate directory.
					folder = "Notes/DailyNotes",
					-- Optional, if you want to change the date format for the ID of daily notes.
					date_format = "%Y-%m-%d",
					-- Optional, if you want to change the date format of the default alias of daily notes.
					alias_format = "%B %-d, %Y",
					-- Optional, default tags to add to each new daily note created.
					default_tags = { "daily-notes" },
					-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
					template = nil,
				},
				completion = {
					-- Set to false to disable completion.
					nvim_cmp = true,
					-- Trigger completion at 2 chars.
					min_chars = 2,
				},
				new_notes_location = "current_dir",
				picker = {
					-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
					name = "telescope.nvim",
					-- Optional, configure key mappings for the picker. These are the defaults.
					-- Not all pickers support all mappings.
					note_mappings = {
						-- Create a new note from your query.
						new = "<C-x>",
						-- Insert a link to the selected note.
						insert_link = "<C-l>",
					},
					tag_mappings = {
						-- Add tag(s) to current note.
						tag_note = "<C-x>",
						-- Insert a tag at the current location.
						insert_tag = "<C-l>",
					},
				},
				open_notes_in = "current",
				templates = {
					folder = "~/Documents/Vaults/Templates/",
					date_format = "%Y-%m-%d-%a",
				},

				mappings = {
					-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
					["gf"] = {
						action = function()
							return require("obsidian").util.gf_passthrough()
						end,
						opts = { noremap = false, expr = true, buffer = true },
					},
					-- Toggle check-boxes.
					["<leader>ch"] = {
						action = function()
							return require("obsidian").util.toggle_checkbox()
						end,
						opts = { buffer = true },
					},
					-- Smart action depending on context, either follow link or toggle checkbox.
					["<cr>"] = {
						action = function()
							return require("obsidian").util.smart_action()
						end,
						opts = { buffer = true, expr = true },
					},
				},
				vim.keymap.set(
					"n",
					"<leader>oo",
					":ObsidianOpen<CR>",
					{ desc = "Opens Current Note in Obsidian", silent = true }
				),
				vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New Obsidian Note" }),
				vim.keymap.set(
					"n",
					"<leader>ot",
					":ObsidianNewFromTemplate<CR>",
					{ desc = "New Obsidian Note From a Template" }
				),
			})
		end,
	},
}

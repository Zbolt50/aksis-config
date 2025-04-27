return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Vaults/Boggle's Brain/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Vaults/Boggle's Brain/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim", -- Does anyone NOT use this library?
	},
	opts = {
		workspaces = {
			{
				name = "Boggle's Brain",
				path = "~/Vaults/Boggle's Brain",
				overrides = {
					notes_subdir = "Notes",
					daily_notes = {
						folder = "Daily Notes",
						date_format = "%m-%d-%Y",
						default_tags = { "daily-notes" },
						-- NOTE: LOOK HERE FOR DAILY NOTE BOGGLE
						template = nil, -- For now, no template
					},
					new_notes_subdir = "notes_subdir",
				},
			},
			-- Add more vaults here
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			--vim.fn.jobstart({ "open", url }) -- Mac OS
			vim.fn.jobstart({ "xdg-open", url }) -- linux
			-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
			vim.ui.open(url) -- need Neovim 0.10.0+
		end,
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "assets/imgs", -- This is the default

			-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
			---@return string
			img_name_func = function()
				-- Prefix image names with timestamp.
				return string.format("%s-", os.time())
			end,

			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
	},
}

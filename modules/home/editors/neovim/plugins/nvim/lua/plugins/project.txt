return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			{
				-- Manual mode doesn't automatically change your root directory, so you have
				-- the option to manually do so using `:ProjectRoot` command.
				manual_mode = false,

				-- Methods of detecting the root directory. **"lsp"** uses the native neovim
				-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
				-- order matters: if one is not detected, the other is used as fallback. You
				-- can also delete or rearangne the detection methods.
				detection_methods = { "pattern" },

				-- All the patterns used to detect root dir, when **"pattern"** is in
				-- detection_methods
				patterns = { ".git", "qmk_firmware/keyboards/*/.git" },

				-- Table of lsp clients to ignore by name
				-- eg: { "efm", ... }
				ignore_lsp = { "clangd" },

				-- Don't calculate root dir on specific directories
				-- Ex: { "~/.cargo/*", ... }
				exclude_dirs = { "~/qmk_firmware", "~/boggle-neo", "~/boggle", "~/" },

				show_hidden = true,

				silent_chdir = false,

				-- What scope to change the directory, valid options are
				-- * global (default)
				-- * tab
				-- * win
				scope_chdir = "global",

				-- Path where project.nvim will store the project history for use in
				-- telescope
				datapath = vim.fn.stdpath("data"),
				vim.keymap.set("n", "<leader>cr", ":ProjectRoot<CR>", { desc = "Change root to project directory" }),
				vim.keymap.set("n", "<leader>cd", function()
					vim.cmd("cd " .. vim.fn.expand("%:p:h"))
				end, { desc = "Change to the directory of the current buffer" }),
			},
		})
	end,
}

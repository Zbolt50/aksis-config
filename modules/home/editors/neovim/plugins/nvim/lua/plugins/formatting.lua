return {
	{
		-- conform.nvim
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					cpp = { "clang-format" },
					c = { "clang-format" },
					lua = { "stylua" },
					python = { "black" },
					-- Web Dev Hell
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					php = { "php-cs-fixer" },
				},
				formatters = {
					["php-cs-fixer"] = {
						command = "php-cs-fixer",
						args = {
							"fix",
							"$FILENAME",
						},
						stdin = false,
					},
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
				notify_on_error = true,
			})

			-- Commands to disable/enable formatting
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
			local keymap = vim.keymap
			keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}

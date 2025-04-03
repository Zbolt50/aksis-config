return {
	{
		-- nvim-lspconfig | rip null-ls
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig["clangd"].setup({
				capabilities = capabilities,
			})
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})
			lspconfig["nil_ls"].setup({
				capabilities = capabilities,
				settings = {
					["nil"] = {
						formatting = {
							command = {
								"nixfmt",
							},
						},
					},
				},
			})
		end,
	},
}

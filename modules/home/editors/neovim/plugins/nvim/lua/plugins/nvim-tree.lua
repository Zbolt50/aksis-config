return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- API MAPS
			vim.keymap.set("n", "<C-r>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
		end
		require("nvim-tree").setup({
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
			},
			sort = {
				sorter = "case_sensitive",
				folders_first = true,
			},
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = true,
							color = true,
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				custom = { "^.git" },
			},
			on_attach = on_attach,
			vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
		})
	end,
}

return {
	"akinsho/nvim-toggleterm.lua",
	lazy = true,
	config = function()
		local toggleterm = require("toggleterm")
		vim.keymap.set({ "n", "t" }, "<leader>tt", ":ToggleTerm<CR>", { desc = "Horizontal ToggleTerm" })
		toggleterm.setup({
			open_mapping = [[<leader-t>]],
			hide_number = true,
			start_in_insert = true,
			direction = "horizontal", -- vertical | float | tab
			border = "double",
		})
	end,
}

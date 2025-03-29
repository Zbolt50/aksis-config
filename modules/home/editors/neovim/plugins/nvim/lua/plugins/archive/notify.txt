return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		vim.keymap.set({ "n", "v" }, "<leader>nc", function()
			vim.notify.dismiss()
		end, { desc = "Dismiss notifications", noremap = true })
	end,
}

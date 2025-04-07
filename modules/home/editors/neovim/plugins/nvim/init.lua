require("config.keymaps")
require("config.lazy")
-- Updates highlight groups for italicized comments
local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end
update_hl("Comment", { italic = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.pdf",
	callback = function(args)
		local filepath = vim.fn.fnameescape(args.file)
		vim.fn.jobstart({ "zathura", filepath }, { detach = true })
		vim.cmd("bd!") -- close the buffer
	end,
})

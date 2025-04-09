-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- VIM Options

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- python. only reason this is here		i

-- Window Options
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Essentials
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.g.mapleader = " "

-- Undo Options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Highlighting and Colors
vim.opt.termguicolors = true
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.opt.conceallevel = 1

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "siva" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
})

-- Disable Mouse Popup
vim.cmd("autocmd VimEnter * silent! aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-1-")
vim.cmd("colorscheme siva")
-- Plugin Specific Options
vim.g.nvim_tree_respect_buf_cwd = 1
-- vimtex
vim.g.vimtex_view_method = "zathura"

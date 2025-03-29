local keymap = vim.keymap

local defaults = { noremap = true, silent = true }
-- VIM KEYMAPS
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- Quick Exit
keymap.set("n", "<leader>w", ":w<CR>", defaults)
keymap.set("n", "<leader>wq!", ":wq<CR>", defaults)
keymap.set("n", "<leader>a", ":wqa<CR>", defaults)
keymap.set("n", "<leader>q", ":q!<CR>", defaults)
keymap.set("n", "<leader>qa", ":qa!<CR>", defaults)

-- Copy and Paste
keymap.set("n", "<leader>ya", "ggyG")

-- Escape Insert mode
keymap.set({ "i", "t" }, "jj", "<Esc>", defaults)

-- Make items executable without leaving nvim!
-- keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- Switch Windows
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
-- Switch Tabs
keymap.set("n", "<leader>nt", ":tabnew<CR>", defaults)
-- Window Resizing
keymap.set("n", "<A-h>", ":vertical resize +2<CR>", defaults)
keymap.set("n", "<A-j>", ":resize +2<CR>", defaults)
keymap.set("n", "<A-k>", ":resize -2<CR>", defaults)
keymap.set("n", "<A-l>", ":vertical resize -2<CR>", defaults)
-- Insert empty line without entering insert mode

keymap.set("n", "<S-o>", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)

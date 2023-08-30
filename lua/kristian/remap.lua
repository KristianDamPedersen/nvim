vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted rows around
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")


-- When half page jumping with C-d and C-u, keep the cursor in the middle
vim.keymap.set("n", "<C-d", "<C-d>zz")
vim.keymap.set("n", "<C-u", "<C-u>zz")

--- When searching and scrolling through terms keep the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Enable copying and pasting from neovim
vim.opt.clipboard = 'unnamedplus'







































































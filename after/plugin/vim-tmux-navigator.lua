-- Configuration for vim-tmux-navigator
-- Overrides nescessary for nvim and tmux to behave nicely
vim.keymap.set("n", "<C-h>", function() vim.cmd.TmuxNavigateLeft(cr) end)
vim.keymap.set("n", "<C-l>", function() vim.cmd.TmuxNavigateRight(cr) end)
vim.keymap.set("n", "<C-j>", function() vim.cmd.TmuxNavigateDown(cr) end)
vim.keymap.set("n", "<C-k>", function() vim.cmd.TmuxNavigateUp(cr) end)

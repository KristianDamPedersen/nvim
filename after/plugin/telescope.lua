-- After we've ensured that telescope is installed, we define the keybindings here
local builtin = require('telescope.builtin')
-- Search all files (pf = project files)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search only files in git
vim.keymap.set('n', '<C-p', builtin.git_files, {})
-- Grep (ps = project search)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Add a breakpoint at line
vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint)

-- Open debuggin sidebar
vim.keymap.set("n", "<leader>dus", function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end
)

-- Debug go test
vim.keymap.set("n", "<leader>dgt", function() require('dap-go').debug_test() end)

-- Debug last go test
vim.keymap.set("n", "<leader>dgl", function() require('dap-go').debug_last() end)


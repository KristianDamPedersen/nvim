-- OBS: These will need to be installed using go install!
local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = {
    sources = {
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines
    }
}
return opts

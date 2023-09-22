local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Which lsps? This is where we add lsps, make sure to install them with Mason
lsp.ensure_installed({
	"gopls",
	"tsserver",
	"eslint",
    "pyright",
    "svelte",
    "rust_analyzer",
    "volar" -- Vue language server
})


-- Keybindings
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

-- This will happen on every buffer
-- This sets keymaps that only live for the lifespan of the current buffer.
-- I.e. gd will use the lsp's go to definition first, before it tries to use vims own.
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	-- view definition
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	-- Perform code action
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	-- View references
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	-- Rename
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.references() end, opts)
	-- Signature help
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
-- LSP SETTINGS
-- Gopls settings
require('lspconfig').gopls.setup({
    on_attach = on_attach,
    settings = {
        gopls = {
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            }
        }
    }
})

lsp.setup()
-- SPARQL settings
local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.sparql then 
    lsp_configurations.sparql = { 
        default_config = {
            name = 'sparql',
            cmd = { "node", os.getenv("NVM_BIN") .. "/sparql-language-server", "--stdio" },
            filetypes = {'sparql', 'rq'},
            root_dir = require('lspconfig.util').find_git_ancestor or vim.fn.getcwd(),
            single_file_support = true
        }
}
end

require('lspconfig').sparql.setup({})





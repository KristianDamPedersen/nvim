-- Packer is our plugin manager of choice
-- Here we make sure that the plugins are installed, most are then configured in the own files under plugin/after
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Color scheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    vim.cmd('colorscheme rose-pine')

    -- Tree sitter, syntax highlighting
    use (
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
    )	

    -- Harpoon file navigation
    use ( 'theprimeagen/harpoon' )

    -- Undotree - history over actions
    use ( 'mbbill/undotree' )

    -- Lsp zero - Language server manager
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    -- Vim navigation integration with Tmux
    use ( 'christoomey/vim-tmux-navigator', { lazy = false } )

    -- Null ls - auto formatter
    use ( 'jose-elias-alvarez/null-ls.nvim' )

    -- NVIM DAP - debugger
    use ( 'mfussenegger/nvim-dap' )

    -- Nvim-dap-go - Integrating Delve go debugger into nvim dap
    use { 'dreamsofcode-io/nvim-dap-go',
            ft = 'go',
            dependencies = 'mfussenegger/nvim-dap'
    }

    -- Gopher-nvim - More go functionality
    use {
        'olexsmir/gopher.nvim',
        ft = 'go',
        -- build = function()
            -- vim.cmd.GoInstallDeps()
        -- end
    }
    -- Comment.nvim - Commenting functionality
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Rust tools
    use ( 'simrat39/rust-tools.nvim' )

    -- Jupyter notebooks
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

end)

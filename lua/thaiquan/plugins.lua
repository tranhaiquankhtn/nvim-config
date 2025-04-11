local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    "numToStr/Comment.nvim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                signs = {
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "﫠"
                },
                use_diagnostic_signs = false
            })
        end
    },

    -- themes
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme rose-pine]])
        end,
    },
    { 'nvim-treesitter/nvim-treesitter',            build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                map_cr = true,       --  map <CR> on insert mode
                map_complete = true, -- it will auto insert `(` after select function or method item
                auto_select = false, -- auto select first item
            })
        end
    },

    {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },

    {
        'mg979/vim-visual-multi', branch = 'master'
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    -- nvim-tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-tree').setup()
        end
    },

    {
        'mg979/vim-visual-multi',
        branch = 'master',

    },

    -- LSP config
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     dependencies = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },             -- Required
    --         { 'williamboman/mason.nvim' },           -- Optional
    --         { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },     -- Required
    --         { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    --         { 'L3MON4D3/LuaSnip' },     -- Required

    --         -- rust tools
    --         { 'simrat39/rust-tools.nvim' },

    --     }
    -- },
    -- Mason
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true
    },

    -- Autocompletion
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-vsnip",
    --         "hrsh7th/cmp-nvim-lsp-signature-help",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-buffer",
    --         'L3MON4D3/LuaSnip',
    --         'saadparwaiz1/cmp_luasnip',
    --         "hrsh7th/vim-vsnip",
    --     },
    -- },

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
    },



    -- Rust tools
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'mfussenegger/nvim-dap' },

    -- Java ls extension
    { 'mfussenegger/nvim-jdtls' }
}

local opts = {}
require("lazy").setup(plugins, opts)

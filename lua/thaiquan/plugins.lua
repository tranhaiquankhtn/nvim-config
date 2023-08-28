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
        tag = '0.1.1',
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
    -- { 'sainnhe/gruvbox-material' },
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

    -- nvim-tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-tree').setup()
        end
    },

    -- LSP config
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
}

local opts = {}
require("lazy").setup(plugins, opts)

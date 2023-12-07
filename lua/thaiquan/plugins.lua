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

    -- LSP config
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.configure('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            lsp_zero.set_sign_icons({
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠"
            })

            lsp_zero.format_on_save({
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ['tsserver'] = { 'javascript', 'typescript' },
                    ['rust_analyzer'] = { 'rust' },
                    ['pylsp'] = { 'python' },
                    ['lua_ls'] = { 'lua' },
                    ['taplo'] = { 'toml' },
                }
            })

            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

                -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })")
            end)

            lsp_zero.setup({})
        end

    },
    -- Mason
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            "hrsh7th/vim-vsnip",
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
                    { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
                    { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
                    { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
                    { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
                },

                -- formatting = cmp_format,
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            vsnip = '⋗',
                            buffer = 'Ω',
                            path = '',
                        }
                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    -- [",."] = cmp.mapping.close(),

                    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                    ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = 'insert' })
                        else
                            cmp.complete()
                        end
                    end),

                },

            })
        end
    },

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
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'tsserver',
                    'eslint',
                    'lua_ls',
                    'rust_analyzer',
                    'pylsp',
                    'volar',
                    'gopls',
                    'jdtls',
                },
                handlers = {
                    lsp_zero.default_setup,
                    -- lua ls
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,

                    -- rust-analyzer
                    rust_analyzer = function()
                        require('lspconfig').rust_analyzer.setup({
                            settings = {
                                ['rust_analyzer'] = {
                                    imports = {
                                        granularity = {
                                            group = "module",
                                        },
                                        prefix = "self",
                                    },
                                    cargo = {
                                        buildScripts = {
                                            enable = true,
                                        },
                                    },
                                    procMacro = {
                                        enable = true
                                    },
                                    checkOnSave = {
                                        command = "clippy",
                                    },
                                }
                            }
                        })
                    end,
                }
            })
        end
    },


    -- Rust tools
    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' }
        },
        config = function()
            local opts = {
                tools = {
                    runnables = {
                        use_telescope = true,
                    },
                    inlay_hints = {
                        auto = true,
                        show_parameter_hints = false,
                        parameter_hints_prefix = "",
                        other_hints_prefix = "",
                    },
                },

                server = {
                    -- on_attach = on_attach,
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy",
                            },
                        },
                    },
                },
            }

            require("rust-tools").setup(opts)
        end
    },
    { 'nvim-lua/plenary.nvim' },
    { 'mfussenegger/nvim-dap' },
}

local opts = {}
require("lazy").setup(plugins, opts)

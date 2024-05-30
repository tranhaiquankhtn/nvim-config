local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.highlight_symbol(client, bufnr)
end)

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyzer'] = { 'rust' },
        ['jdtls'] = { 'java' },
        ['lua_ls'] = { 'lua' },
        ['tsserver'] = { 'javascript', 'typescript' },
    }
})

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'tsserver', 'lua_ls', 'jdtls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

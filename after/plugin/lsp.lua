vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.diagnostic.config({
    virtual_text = {
        current_line = true
    }
})

-- lsp_zero.set_sign_icons({
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = '»'
-- })


-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
--     '/node_modules/@vue/language-server'

-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = { 'rust_analyzer', 'ts_ls', 'lua_ls', 'jdtls', 'pylsp' },
--     handlers = {
--         function(server_name)
--             require('lspconfig')[server_name].setup({})
--         end,
--     },
-- })

-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = vim.fn.expand(mason_registry.get_package('vue-language-server') ..
--     '/node_modules/@vue/language-server')
return {
    cmd = { "typescript-language-server", "--stdio" },
    single_file_support = true,
    init_options = {
        hostInfo = "neovim",
        plugins = {
            -- {
            --     name = '@vue/typescript-plugin',
            --     location = vue_language_server_path,
            --     languages = { "javascript", "typescript", "vue" },
            -- },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
    },
}

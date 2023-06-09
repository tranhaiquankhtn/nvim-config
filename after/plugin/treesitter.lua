require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "java", "javascript", "typescript", "python", "rust", "go" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    context_commentstring = {
        enable = true,
        config = { typescript = { __default = '// %s', __multiline = '/* %s */' } }
    }
}

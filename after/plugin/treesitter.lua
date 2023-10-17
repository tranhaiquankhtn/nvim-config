require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "java", "javascript", "typescript", "python", "rust", "go" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = true,
        config = { typescript = { __default = '// %s', __multiline = '/* %s */' } }
    }
}

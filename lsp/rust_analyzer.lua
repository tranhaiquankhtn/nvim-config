return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    settings = {
        ['rust_analyzer'] = {
            checkOnSave = true,
            check = {
                command = 'clippy'
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            procMacro = {
                enable = true
            },
        }
    }
}

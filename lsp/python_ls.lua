return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
    },
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                },

                black = { enabled = true },
                autopep8 = { enabled = false },
                autoflake = { enabled = true },
                yapf = { enabled = false },
                pyls_isort = { enabled = true },
                pyflakes = { enabled = false },
                -- rope_autoimport = {
                --     enabled = true,
                --     code_actions = { enabled = true }
                -- }
            }

        }
    }
}

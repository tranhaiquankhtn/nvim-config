require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- javascript = { { "prettierd", "prettier" } },
        -- typescript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        yaml = { "yamlfix" },
        sh = { "shfmt" },
        java = { "google-java-format" },
        python = function(bufnr)
            if require("conform").get_formatter_info("ruff_format", bufnr).available then
                return { "ruff_format" }
            else
                return { "isort", "black" }
            end
        end,
    },
    format_on_save = {
        async = false,
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

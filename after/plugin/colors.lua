require('rose-pine').setup({
    disable_background = true,
    variant = 'main',
    highlight_groups = {
        -- Keyword = { bg = 'highlight_high' },
        -- Function = { bg = 'none', blend = 10 },
    }
})

function ColorScheme(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)

    vim.o.termguicolors = true
    vim.g.nvcode_termcolors = 256
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorScheme()

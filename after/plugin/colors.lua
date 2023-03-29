require('rose-pine').setup({
    dark_variant = 'main',
    disable_background = true,
})

function SetColorScheme(color)
    color = color or "rose-pine" -- "gruvbox-material"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()

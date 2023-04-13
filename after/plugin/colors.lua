function ColorScheme(color)
    color = color or 'rose-pine' --"gruvbox-material"
    vim.cmd.colorscheme(color)

    vim.o.termguicolors = true
    vim.g.nvcode_termcolors = 256
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorScheme()

vim.opt.guicursor = "i:ver25"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.showtabline = 2
vim.opt.numberwidth = 5
vim.opt.encoding = 'UTF-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.textwidth = 80
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cmdheight = 2
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 50
vim.opt.list = true

vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
--vim.opt.listchars= 'tab:>-,trail:-,eol:↵'
--
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Autoreload
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

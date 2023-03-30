vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', '<C-c>', '<cmd>noh<CR>') -- Clear highlights
-- vim.keymap.set('i', '<c-c>', '<Esc>')


-- vim.keymap.set('n', '<Space>', '<NOP>')
-- vim.keymap.set('n', '<C-\\>', ':NvimTreeToggle<CR>')
-- vim.keymap.set('n', '<Leader>r', ':NvimTreeRefresh<CR>')

-- navigate between buffers
-- vim.keymap.set('n', '<C-q>', ':bw<CR>')
-- vim.keymap.set('n', '<TAB>', ':bnext<CR>')
-- vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')

-- navigate between windows
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

-- resize windows
-- nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
vim.keymap.set('n', '<C-w><', ':vertical resize +5<CR>')
vim.keymap.set('n', '<C-w>>', ':vertical resize -5<CR>')

vim.keymap.set('n', '<C-w>+', ':resize +5<CR>')
vim.keymap.set('n', '<C-w>-', ':resize -5<CR>')


-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- TAB Completion
-- vim.keymap.set('i', '<expr><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"')

-- move line up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')


-- greatest remap ever
vim.keymap.set('v', '<Leader>p', '\"_dP')

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set('n', '<Leader>y', '\"+y')
-- vim.keymap.set('v', '<Leader>y', '\"+y')
vim.keymap.set('n', '<Leader>Y', 'gg\"+yG')
vim.keymap.set('n', 'Y', 'y$')

-- vim.keymap.set('n', '<Leader>d', '\"_d')
-- vim.keymap.set('v', '<Leader>d', '\"_d')
--- JDTLS mappings
vim.keymap.set("n", "<Leader>coa", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
vim.keymap.set("n", "<Leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>")
vim.keymap.set("n", "<Leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
vim.keymap.set("v", "<Leader>crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
vim.keymap.set("n", "<Leader>crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
vim.keymap.set("v", "<Leader>crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
vim.keymap.set("n", "<Leader>crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")

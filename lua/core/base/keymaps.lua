vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Save all
vim.keymap.set('n', '<C-s>', ':wa<CR>')

-- Open new tab
vim.keymap.set('n', '<C-t>', ':tabe<CR>')

-- Switch tabs
vim.keymap.set('n', '<C-a>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-d>', ':tabnext<CR>')

-- Move tabs
vim.keymap.set('n', '<C-q>', ':tabmove -1<CR>')
vim.keymap.set('n', '<C-e>', ':tabmove +1<CR>')

-- Go to terminal normal mode with ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Go up and down visually when wrapping is on
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

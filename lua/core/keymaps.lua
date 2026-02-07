local set = vim.keymap.set
local function keymap(mode, map, action, desc)
    set(mode, map, action, { silent = true, noremap = true, desc = desc or nil })
end

-- Window
keymap('n', '<leader>q', '<cmd>q<cr>', 'Close window')
keymap('n', '<leader>Q', '<cmd>qa!<cr>', 'Close Neovim [No Save]')

-- Buffer
keymap('n', '<leader>c', '<cmd>bd<cr>', 'Close buffer')
keymap('n', '<leader>C', '<cmd>bd!<cr>', 'Close buffer')
keymap('n', '<leader>w', '<cmd>w<cr>', 'Write buffer')

-- Scrolling
keymap('n', '<C-d>', '<C-d>zz', 'Scroll down centered')
keymap('n', '<C-u>', '<C-u>zz', 'Scroll up centered')
keymap('n', '<C-f>', '<C-f>zz', 'Page down + center')
keymap('n', '<C-b>', '<C-b>zz', 'Page up + center')

-- Visual noise
keymap('n', '<Esc>', '<cmd>noh<cr>', 'Clear search highlights')

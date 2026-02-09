local keymap = require('utils.keymaps')

-- [ Window ]
keymap.silent_noremap('n', '<leader>q', '<cmd>q<cr>', 'Close window')
keymap.silent_noremap('n', '<leader>Q', '<cmd>qa!<cr>', 'Close Neovim [No Save]')
keymap.silent_noremap('n', '<M-,>', '<C-w>5<', 'Decrease width')
keymap.silent_noremap('n', '<M-.>', '<C-w>5>', 'Increase width')
keymap.silent_noremap('n', '<M-l>', '<C-w>-', 'Decrease height')
keymap.silent_noremap('n', '<M-;>', '<C-w>+', 'Increase height')

-- [ Buffer ]
keymap.silent_noremap('n', '<leader>c', '<cmd>bd<cr>', 'Close buffer')
keymap.silent_noremap('n', '<leader>C', '<cmd>bd!<cr>', 'Close buffer')
keymap.silent_noremap('n', '<leader>w', '<cmd>w<cr>', 'Write buffer')

-- [ Scrolling ]
keymap.silent_noremap('n', '<C-d>', '<C-d>zz', 'Scroll down centered')
keymap.silent_noremap('n', '<C-u>', '<C-u>zz', 'Scroll up centered')
keymap.silent_noremap('n', '<C-f>', '<C-f>zz', 'Page down + center')
keymap.silent_noremap('n', '<C-b>', '<C-b>zz', 'Page up + center')

-- [ Visual Noise ]
keymap.silent_noremap('n', '<Esc>', '<cmd>noh<cr>', 'Clear search highlights')

-- [ Quick Access ]
keymap.silent_noremap('n', '<C-x>', '<cmd>so %<cr>', 'Quick source of file')

require('neogit').setup({})

local keymaps = require('utils.keymaps')

keymaps.silent_noremap('n', '<leader>g', '<cmd>Neogit<cr>', 'Open Neogit')

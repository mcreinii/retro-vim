require('fzf-lua').setup({

    fzf_opts = { ['--layout'] = 'reverse' },
    winopts = {
        height = 0.85,
        width = 0.85,
        preview = { hidden = 'nohidden', vertical = 'down:45%', title = ' Preview ' },
        border = 'single',
    },
})

local keymaps = require('utils.keymaps')

keymaps.silent_noremap('n', '<leader>ff', '<cmd>FzfLua files<cr>', 'Find files')
keymaps.silent_noremap('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', 'Live Grep')
keymaps.silent_noremap('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', 'Buffers')
keymaps.silent_noremap('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', 'Help tags')
keymaps.silent_noremap('n', '<leader>fr', '<cmd>FzfLua oldfiles<cr>', 'Recent files')
keymaps.silent_noremap('n', '<leader>fc', '<cmd>FzfLua commands<cr>', 'Commands')
keymaps.silent_noremap('n', '<C-p>', '<cmd>FzfLua files<cr>', 'Quick find files')

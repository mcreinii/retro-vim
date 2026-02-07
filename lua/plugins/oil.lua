require('oil').setup({
    default_file_explorer = true,
    view_options = {
        natural_order = true,
    },
    float = {
        padding = 2,
        max_width = 60,
        max_height = 0.8,
    },
    keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
    },
})

local keymaps = require('utils.keymaps')

keymaps.silent_noremap('n', '-', '<cmd>Oil<cr>', 'Open parent directory')
keymaps.silent_noremap('n', '<leader>e', '<cmd>Oil --float<cr>', 'Open floating explorer')

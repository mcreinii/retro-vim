local keymaps = require('utils.keymaps')

keymaps.silent_noremap({ 'n', 'x', 'o' }, '<leader>s', function() require('flash').jump() end, 'Flash')
keymaps.silent_noremap({ 'n', 'x', 'o' }, '<leader>S', function() require('flash').treesitter() end, 'Flash Treesitter')
keymaps.silent_noremap('o', 'r', function() require('flash').remote() end, 'Remote Flash')
keymaps.silent_noremap({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, 'Treesitter Search')
keymaps.silent_noremap({ 'c' }, '<c-s>', function() require('flash').toggle() end, 'Toggle Flash Search')

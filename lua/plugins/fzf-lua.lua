local get_border = require('utils.ui').get_border()
require('fzf-lua').setup({
	fzf_opts = { ['--layout'] = 'reverse' },
	winopts = {
		height = 0.85,
		width = 0.85,
		preview = { hidden = 'nohidden', vertical = 'down:45%', title = ' Preview ', border = get_border },
		border = get_border,
	},
})

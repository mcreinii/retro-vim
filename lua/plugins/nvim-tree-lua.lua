require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = '+',
				edge = '|',
				item = '|',
				bottom = '-',
				none = ' ',
			},
		},
		icons = {
			show = { file = false },
			web_devicons = {
				file = { enable = false },
				folder = { enable = false },
			},
			glyphs = {
				folder = {
					arrow_closed = '>',
					arrow_open = 'v',
					default = '[-]',
					open = '[O]',
					empty = '[ ]',
				},
				git = {
					unstaged = '[~]',
					staged = '[+]',
					unmerged = '[=]',
					renamed = '[^]',
					untracked = '[?]',
					deleted = '[-]',
				},
			},
		},
	},
	git = {
		enable = true,
	},
})

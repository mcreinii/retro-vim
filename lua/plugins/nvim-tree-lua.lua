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
				corner = '└',
				edge = '│',
				item = '│',
				bottom = '─',
				none = ' ',
			},
		},
		icons = {
			show = { file = false },
			web_devicons = {
				file = {
					enable = false,
				},
				folder = {
					enable = false,
				},
			},
			glyphs = {
				folder = {
					-- Use simple arrows for folder status
					arrow_closed = '>',
					arrow_open = 'v',
					-- Use standard folder representations
					default = '[-]',
					open = '[O]',
					empty = '[ ]',
				},
				git = {
					-- Use simple symbols for git status
					unstaged = '[~]', -- star for untracked/modified
					staged = '[+]', -- plus for staged
					unmerged = '[=]',
					renamed = '[^]',
					untracked = '[?]',
					deleted = '[-]',
				},
			},
		},
	},
	-- Disable git badge color highlights if you want a monochrome look
	git = {
		enable = true, -- can keep the indicators, just use simple glyphs above
		-- You may need to adjust your colorscheme itself for true retro colors
	},
})

local keymaps = require('utils.keymaps')

keymaps.silent_noremap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', 'Toggle side explorer')

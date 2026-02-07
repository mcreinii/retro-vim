require('blink.cmp').setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono',
	},
	signature = { enabled = true },
	sources = {
		default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },

		providers = {
			lazydev = {
				name = 'LazyDev',
				module = 'lazydev.integrations.blink',
				score_offset = 100,
			},
		},
	},
	fuzzy = {
		implementation = 'lua',
	},
})

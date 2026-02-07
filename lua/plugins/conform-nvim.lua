require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		javascript = { 'prettier' },
		typescript = { 'prettier' },
		javascriptreact = { 'prettier' },
		typescriptreact = { 'prettier' },
	},
	format_on_save = {
		timeout_ms = 5000,
		lsp_format = 'fallback',
	},
})

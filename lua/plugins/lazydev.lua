if vim.fn.getcwd() ~= vim.fn.stdpath('config') then return end

require('lazydev').setup({
	library = {
		{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
	},
})

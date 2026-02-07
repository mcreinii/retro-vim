if vim.g.loaded_lazydev ~= true then
	vim.g.loaded_lazydev = true
	require('lazydev').setup({
		library = {
			{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
		},
	})
end

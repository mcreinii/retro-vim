local M = {}

M.fallback = 'everforest'

M.config = {
	theme = 'everforest',
}

function M.black_bg()
	local function set_all_black()
		local black = '#000000'

		vim.api.nvim_set_hl(0, 'Normal', { bg = black, ctermbg = 0 })
		vim.api.nvim_set_hl(0, 'NormalNC', { bg = black, ctermbg = 0 })

		vim.api.nvim_set_hl(0, 'StatusLine', { bg = black })
		vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = black })

		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = black, ctermbg = 0 })
		vim.api.nvim_set_hl(0, 'FloatBorder', { bg = black, ctermbg = 0 })

		vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = black, ctermbg = 0 })
		vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { bg = black, ctermbg = 0 })
		vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = black, ctermbg = 0 })
	end
	set_all_black()

	vim.api.nvim_create_autocmd('ColorScheme', {
		callback = function() set_all_black() end,
	})
end

function M.setup(opts)
	for opt, value in pairs(opts or {}) do
		M.config[opt] = value
	end

	local success, _ = pcall(vim.cmd, 'colo ' .. M.config.theme)

	if not success then
		vim.notify('Theme ' .. M.config.theme .. ' does\'nt exist, falling back to industry')
		vim.cmd('colo ' .. M.fallback)
		return
	end
end

return M

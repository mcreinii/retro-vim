local M = {}

M.fallback = 'industry'

M.config = {
	theme = 'industry',
}

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

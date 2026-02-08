local M = {}

function M.setup(plugin)
    pcall(require, plugin or '')
end

return M

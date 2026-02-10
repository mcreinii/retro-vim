local M = {}

function M.get_border() return vim.o.winborder or 'single' end

return M

local M = {}

M.map = vim.keymap.set

function M.silent_noremap(mode, mapping, action, desc)
    M.map(mode, mapping, action, { silent = true, noremap = true, desc = desc or nil })
end

return M

local alpha = require('alpha')
local startify = require('alpha.themes.startify')

startify.section.header.val = [[
RetroVim
Clean, nostalgic and fun.
]]

startify.file_icons.enabled = false

alpha.setup(startify.config)

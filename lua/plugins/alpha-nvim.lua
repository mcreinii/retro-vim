-- Alpha setup with startify theme
local alpha = require('alpha')
local startify = require('alpha.themes.startify')

-- Optional: Custom Header
startify.section.header.val = [[
RetroVim
Clean, nostalgic and fun.
]]

-- Setup alpha with the startify theme configuration
alpha.setup(startify.config)

-- [ Globals ]

-- Mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [ Variables ]
local data_dir = vim.fn.stdpath('data')
local config_dir = vim.fn.stdpath('config')
local setup = require('utils.plugins').setup

-- [ Bootstrap Vim-Plug ]
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd(
        'silent !curl -fLo '
        .. data_dir
        .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    )
    vim.o.runtimepath = vim.o.runtimepath
    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
            vim.cmd('PlugInstall --sync | source ' .. config_dir .. '/init.lua')
            vim.notify('Restarting Neovim is recommended')
        end,
    })
end

-- [ Plugins ]
local Plug = vim.fn['plug#']

vim.loader.enable()

vim.call('plug#begin')

-- Dependencies
Plug('nvim-lua/plenary.nvim')  -- [+]
Plug('sindrets/diffview.nvim') -- [+]

-- UI
Plug('goolord/alpha-nvim')      -- [+]
Plug('sainnhe/everforest')      -- [+]
Plug('morhetz/gruvbox')         -- [+]
Plug('rebelot/heirline.nvim')   -- [+]
Plug('nvim-tree/nvim-tree.lua') -- [+]
Plug('folke/which-key.nvim')    -- [+]
Plug('j-hui/fidget.nvim')       -- [+]

-- Editor
Plug('nvim-treesitter/nvim-treesitter')                                          -- [+]
Plug('windwp/nvim-autopairs')                                                    -- [+]
Plug('windwp/nvim-ts-autotag')                                                   -- [+]
Plug('saghen/blink.cmp', { ['tag'] = 'v1.*', ['do'] = 'cargo build --release' }) -- [+]
Plug('rafamadriz/friendly-snippets')                                             -- [+]
Plug('nvim-mini/mini.surround')                                                  -- [+]
Plug('nvim-mini/mini.comment')                                                   -- [+]
Plug('ibhagwan/fzf-lua')                                                         -- [+]
Plug('folke/flash.nvim')                                                         -- [+]
Plug('stevearc/conform.nvim')                                                    -- [+]
Plug('mluders/comfy-line-numbers.nvim')                                          -- [+]

-- LSP
Plug('mason-org/mason-lspconfig.nvim') -- [+]
Plug('mason-org/mason.nvim')           -- [+]
Plug('neovim/nvim-lspconfig')          -- [+]

-- Git
Plug('lewis6991/gitsigns.nvim') -- [+]
Plug('NeogitOrg/neogit')        -- [+]

-- Development
Plug('folke/lazydev.nvim', { ['for'] = 'lua' }) -- [+]

vim.call('plug#end')

-- [ Setup all the plugins configurations ]

-- UI
setup('plugins.alpha-nvim')
setup('plugins.heirline')
setup('plugins.nvim-tree-lua')
setup('plugins.fidget')
setup('plugins.which-key')

-- Editor
setup('plugins.nvim-treesitter')
setup('plugins.blink-cmp')
setup('plugins.fzf-lua')
setup('plugins.nvim-autopairs')
setup('plugins.nvim-ts-autotag')
setup('plugins.mini-surround')
setup('plugins.mini-comment')
setup('plugins.flash-nvim')
setup('plugins.conform-nvim')
setup('plugins.comfy-line-numbers-nvim')

-- LSP
setup('plugins.mason')
setup('plugins.mason-lspconfig')

-- Git
setup('plugins.gitsigns-nvim')
setup('plugins.neogit')

-- Development
setup('plugins.lazydev')

-- [ Setup and load theme ]
setup('plugins.themes')
pcall(vim.cmd, 'colo gruvbox')

-- [ Setup all the basic options and keymaps ]
require('core.options')
require('core.keymaps')

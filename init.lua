-- [ Setup Map Leader ]
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- [ Bootstrap Vim-Plug ]
local data_dir = vim.fn.stdpath('data')
local config_dir = vim.fn.stdpath('config')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd(
        'silent !curl -fLo '
        .. data_dir
        .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    )
    vim.o.runtimepath = vim.o.runtimepath
    print(vim.fn.stdpath('config'))
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source ' .. config_dir .. '/init.lua')
end

-- [ Plugins ]
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()

vim.call('plug#begin')

-- Dependencies
Plug('nvim-lua/plenary.nvim')  -- [+]
Plug('sindrets/diffview.nvim') -- [+]

-- UI
Plug('goolord/alpha-nvim')                      -- [+]
Plug('sainnhe/everforest')                      -- [+]
Plug('morhetz/gruvbox')                         -- [+]
Plug('rebelot/heirline.nvim')                   -- [+]
Plug('stevearc/oil.nvim')                       -- [+]
Plug('folke/which-key.nvim')                    -- [+]
Plug('j-hui/fidget.nvim')                       -- [+]
-- Editor
Plug('nvim-treesitter/nvim-treesitter')         -- [+]
Plug('windwp/nvim-autopairs')                   -- [+]
Plug('windwp/nvim-ts-autotag')                  -- [+]
Plug('saghen/blink.cmp', { ['tag'] = '1.*' })   -- [+]
Plug('rafamadriz/friendly-snippets')            -- [+]
Plug('nvim-mini/mini.surround')                 -- [+]
Plug('nvim-mini/mini.comment')                  -- [+]
Plug('ibhagwan/fzf-lua')                        -- [+]
Plug('folke/flash.nvim')                        -- [+]
Plug('stevearc/conform.nvim')                   -- [+]
-- LSP
Plug('mason-org/mason-lspconfig.nvim')          -- [+]
Plug('mason-org/mason.nvim')                    -- [+]
Plug('neovim/nvim-lspconfig')                   -- [+]
Plug('folke/lazydev.nvim', { ['for'] = 'lua' }) -- [+]
-- Git
Plug('lewis6991/gitsigns.nvim')                 -- [+]
Plug('NeogitOrg/neogit')                        -- [+]

vim.call('plug#end')

-- [ Setup all the plugins configurations ]

-- UI
require('plugins.alpha-nvim')
require('plugins.heirline')
require('plugins.oil')
require('plugins.fidget')
require('plugins.which-key')

-- Editor
require('plugins.nvim-treesitter')
require('plugins.blink-cmp')
require('plugins.fzf-lua')
require('plugins.nvim-autopairs')
require('plugins.nvim-ts-autotag')
require('plugins.mini-surround')
require('plugins.mini-comment')
require('plugins.flash-nvim')
require('plugins.conform-nvim')

-- LSP
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.lazydev')

-- Git
require('plugins.gitsigns-nvim')
require('plugins.neogit')

-- [ Setup and load theme ]
require('plugins.themes')
vim.cmd('colo gruvbox')

-- [ Setup all the basic options and keymaps ]
require('core.options')
require('core.keymaps')

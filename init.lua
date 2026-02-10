-- [ Mapleader and Basic Globals ]
vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local data_dir = vim.fn.stdpath('data')
local setup = require('utils.plugins').setup
local theme = require('utils.themes')

-- [ Bootstrap Lazy.nvim ]
local install_path = data_dir .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(install_path) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		install_path,
	})
end

vim.opt.rtp:prepend(install_path)

-- [ Plugins & Setup ]
require('lazy').setup({

	-- Dependencies
	{
		'nvim-lua/plenary.nvim',
		lazy = true,
	},
	{
		'sindrets/diffview.nvim',
		cmd = { 'DiffviewOpen', 'DiffviewClose' },
		dependencies = 'nvim-lua/plenary.nvim',
	},

	-- UI
	{
		'goolord/alpha-nvim',
		event = 'VimEnter',
		config = function() setup('plugins.alpha-nvim') end,
	},
	{ 'sainnhe/everforest', event = 'VimEnter', lazy = true },
	{ 'morhetz/gruvbox', event = 'VimEnter', lazy = true },
	{ 'rose-pine/neovim', event = 'VimEnter', lazy = true },
	{ 'vague-theme/vague.nvim', event = 'VimEnter', lazy = true },
	{
		'rebelot/heirline.nvim',
		event = 'BufWinEnter',
		config = function() setup('plugins.heirline') end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
		config = function() setup('plugins.nvim-tree-lua') end,
		keys = {
			{ '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Open side explorer' },
		},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		config = function() setup('plugins.which-key') end,
	},
	{
		'j-hui/fidget.nvim',
		event = 'LspAttach',
		config = function() setup('plugins.fidget') end,
	},

	-- Editor
	{
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		config = function() setup('plugins.nvim-treesitter') end,
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function() setup('plugins.nvim-autopairs') end,
	},
	{
		'windwp/nvim-ts-autotag',
		event = 'InsertEnter',
		config = function() setup('plugins.nvim-ts-autotag') end,
	},
	{
		'saghen/blink.cmp',
		version = 'v1.*',
		build = 'cargo build --release',
		config = function() setup('plugins.blink-cmp') end,
	},
	{
		'rafamadriz/friendly-snippets',
		event = 'InsertEnter',
		config = function() setup('plugins.friendly-snippets') end,
	},
	{
		'nvim-mini/mini.surround',
		event = 'BufRead',
		config = function() setup('plugins.mini-surround') end,
	},
	{
		'nvim-mini/mini.comment',
		event = 'BufRead',
		config = function() setup('plugins.mini-comment') end,
	},
	{
		'ibhagwan/fzf-lua',
		cmd = 'FzfLua',
		config = function() setup('plugins.fzf-lua') end,
		keys = {
			{ '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
			{ '<leader>fG', '<cmd>FzfLua git_files<cr>', desc = 'Find Git files' },
			{ '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Live Grep' },
			{ '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
			{ '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help tags' },
			{ '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
			{ '<leader>fc', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
			{ '<C-p>', '<cmd>FzfLua files<cr>', desc = 'Quick find files' },
		},
	},
	{
		'folke/flash.nvim',
		keys = {
			{ '<leader>s', function() require('flash').jump() end, desc = 'Flash', mode = { 'n', 'x', 'o' } },
			{
				'<leader>S',
				function() require('flash').treesitter() end,
				desc = 'Flash Treesitter',
				mode = { 'n', 'x', 'o' },
			},
			{ 'r', function() require('flash').remote() end, desc = 'Remote Flash', mode = { 'o' } },
			{
				'R',
				function() require('flash').treesitter_search() end,
				desc = 'Treesitter Search',
				mode = { 'o', 'x' },
			},
			{ '<c-s>', function() require('flash').toggle() end, desc = 'Toggle Flash Search', mode = { 'c' } },
		},
	},
	{
		'stevearc/conform.nvim',
		event = 'BufWritePre',
		config = function() setup('plugins.conform-nvim') end,
	},
	{
		'mluders/comfy-line-numbers.nvim',
		event = 'BufWinEnter',
		config = function() setup('plugins.comfy-line-numbers-nvim') end,
	},

	-- LSP
	{
		'mason-org/mason.nvim',
		config = function() setup('plugins.mason') end,
	},
	{
		'mason-org/mason-lspconfig.nvim',
		config = function() setup('plugins.mason-lspconfig') end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function() setup('plugins.nvim-lspconfig') end,
	},

	-- Git
	{
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function() setup('plugins.gitsigns-nvim') end,
	},
	{
		'NeogitOrg/neogit',
		cmd = 'Neogit',
		config = function() setup('plugins.neogit') end,
		keys = {
			{ '<leader>g', '<cmd>Neogit<cr>', 'Open Neogit' },
		},
	},

	-- Development
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		config = function() setup('plugins.lazydev') end,
	},
}, {
	-- Lazy UI
	ui = {
		icons = {
			cmd = '</>',
			config = '*',
			event = '~',
			ft = '#',
			init = '-',
			import = '+',
			keys = '>',
			lazy = 'L',
			loaded = 'OK',
			not_loaded = 'NO',
			debug = 'D',
			favorite = '[*]',
			plugin = '[D]',
			runtime = 'R ',
			require = 'REQ ',
			source = 'SO ',
			start = '[S] ',
			task = '[+] ',
			list = {
				'.',
				'->',
				'[*]',
				'‒',
			},
		},
		compact = false,
		wrap = true,
	},
})

-- [ Setup and load theme ]
setup('plugins.themes')
theme.setup({
	theme = 'vague', -- Default if not valid, fallback (everforest)
	black = true,
})

-- [ Setup all the basic options and keymaps ]
require('core.options')
require('core.keymaps')

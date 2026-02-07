return {
    -- Syntax Highlighter
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'lua',
                'typescript',
                'javascript',
                'tsx',
                'jsx',
            },
            auto_install = true,
        },
    },

    -- Code Completion
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = { 'rafamadriz/friendly-snippets', 'folke/lazydev.nvim' },
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono',
            },
            signature = { enabled = true },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },

                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
            },
        },
    },

    -- Fuzzy finder
    {
        'ibhagwan/fzf-lua',
        opts = {
            fzf_opts = { ['--layout'] = 'reverse' }, -- classic top-down feel
            winopts = {
                height = 0.85,
                width = 0.85,
                preview = { hidden = 'nohidden', vertical = 'down:45%', title = ' Preview ' },
                border = 'single',
            },
        },
        keys = {
            { '<leader>ff', '<cmd>FzfLua files<cr>',     desc = 'Find files' },
            { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Live grep' },
            { '<leader>fb', '<cmd>FzfLua buffers<cr>',   desc = 'Buffers' },
            { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help tags' },
            { '<leader>fr', '<cmd>FzfLua oldfiles<cr>',  desc = 'Recent files' },
            { '<leader>fc', '<cmd>FzfLua commands<cr>',  desc = 'Commands' },
            { '<C-p>',      '<cmd>FzfLua files<cr>',     desc = 'Quick find files' },
        },
    },

    -- Formatter
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = 'fallback',
            },
        },
    },

    -- Auto pairs
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {},
    },

    -- Git Signs
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
}

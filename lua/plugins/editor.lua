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
            fzf_opts = { ['--layout'] = 'reverse' },
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
            formatters_by_ft = {
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 5000,
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
        opts = {
            aliases = {
                ['jsx'] = 'html',
                ['tsx'] = 'html',
            },
        },
    },

    -- Flash Nvim
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            { '<leader>s', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end,   desc = 'Flash' },
            {
                '<leader>S',
                mode = { 'n', 'x', 'o' },
                function() require('flash').treesitter() end,
                desc = 'Flash Treesitter',
            },
            { 'r',         mode = 'o',               function() require('flash').remote() end, desc = 'Remote Flash' },
            {
                'R',
                mode = { 'o', 'x' },
                function() require('flash').treesitter_search() end,
                desc = 'Treesitter Search',
            },
            { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
        },
    },

    -- Mini
    {
        'nvim-mini/mini.surround',
        opts = {
            mappings = {
                add = 'sa',
                delete = 'sd',
                find = 'sf',
                find_left = 'sF',
                highlight = 'sh',
                replace = 'sr',

                suffix_last = 'l',
                suffix_next = 'n',
            },
        },
    },
    {
        'nvim-mini/mini.comment',
        opts = {
            mappings = {
                comment = '<leader>/',
                comment_line = '<leader>/',
                comment_visual = '<leader>/',
                textobject = '<leader>/',
            },
        },
    },
}

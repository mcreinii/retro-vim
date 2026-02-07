return {
    -- Everforest colorscheme
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- Pick your variant: 'soft', 'medium' (default), 'hard'
            vim.g.everforest_background = 'hard' -- or 'soft' / 'hard'

            -- Enable italics (great for comments / keywords if your terminal supports)
            vim.g.everforest_enable_italic = true

            -- UI improvements
            vim.g.everforest_transparent_background = 0 -- 0 = opaque, 1 = semi, 2 = full transparent
            vim.g.everforest_dim_inactive_windows = 0 -- dim non-focused windows
            vim.g.everforest_disable_italic_comment = 0 -- if italics look bad on your font

            -- Better diagnostics / git signs integration
            vim.g.everforest_diagnostic_text_highlight = 1
            vim.g.everforest_diagnostic_line_highlight = 0
            vim.g.everforest_diagnostic_virtual_text = 'grey'

            vim.cmd([[colo everforest]])
        end,
    },

    -- Explorer
    {
        'stevearc/oil.nvim',
        lazy = false,            -- or event = 'VeryLazy' if you prefer
        opts = {
            default_file_explorer = true, -- replaces netrw
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            float = {
                padding = 2,
                max_width = 60,
                max_height = 0.8,
            },
            keymaps = {
                ['g?'] = 'actions.show_help',
                ['<CR>'] = 'actions.select',
                ['-'] = 'actions.parent',
                ['_'] = 'actions.open_cwd',
            },
        },
        keys = {
            { '-',         '<CMD>Oil<CR>',         desc = 'Open parent directory' },
            { '<leader>e', '<CMD>Oil --float<CR>', desc = 'Oil float explorer' },
        },
    },

    -- Statusline
    {
        'rebelot/heirline.nvim',
        opts = function()
            local nvim_modes = {
                init = function(self) self.mode = vim.fn.mode(1) end,
                static = {
                    mode_names = {
                        -- Normal & friends
                        n = '[ NORMAL ]',
                        no = '[ OP-PENDING ]',
                        nov = '[ OP-PENDING (char) ]',
                        noV = '[ OP-PENDING (line) ]',
                        ['no\22'] = '[ OP-PENDING (block) ]',
                        niI = '[ NORMAL (insert) ]',
                        niR = '[ NORMAL (replace) ]',
                        niV = '[ NORMAL (virtual-replace) ]',
                        nt = '[ TERMINAL-NORMAL ]',

                        -- Visual modes
                        v = '[ VISUAL ]',
                        vs = '[ VISUAL (select) ]',
                        V = '[ VISUAL-LINE ]',
                        Vs = '[ VISUAL-LINE (select) ]',
                        ['\22'] = '[ VISUAL-BLOCK ]',
                        ['\22s'] = '[ VISUAL-BLOCK (select) ]',

                        -- Select modes
                        s = '[ SELECT ]',
                        S = '[ SELECT-LINE ]',
                        ['\19'] = '[ SELECT-BLOCK ]',

                        -- Insert & replace
                        i = '[ INSERT ]',
                        ic = '[ INSERT (compl-generic) ]',
                        ix = '[ INSERT (compl-menu) ]',

                        -- Replace modes
                        R = '[ REPLACE ]',
                        Rc = '[ REPLACE (compl-generic) ]',
                        Rx = '[ REPLACE (compl-menu) ]',
                        Rv = '[ VIRTUAL-REPLACE ]',
                        Rvc = '[ VIRTUAL-REPLACE (compl-generic) ]',
                        Rvx = '[ VIRTUAL-REPLACE (compl-menu) ]',

                        -- Command-line & others
                        c = '[ COMMAND ]',
                        cv = '[ EX-MODE ]',
                        r = '[ HIT-ENTER ]',
                        rm = '[ --MORE-- ]',
                        ['r?'] = '[ CONFIRM ]',
                        ['!'] = '[ SHELL ]',
                        t = '[ TERMINAL ]',
                    },
                    mode_colors = {
                        -- Normal & operator-pending
                        n = 'red',
                        no = 'red',
                        nov = 'red',
                        noV = 'red',
                        ['no\22'] = 'red',
                        niI = 'red',
                        niR = 'red',
                        niV = 'red',
                        nt = 'red',

                        -- Visual (bright & noticeable – retro cyan/magenta feel)
                        v = 'cyan',
                        vs = 'cyan',
                        V = 'cyan',
                        Vs = 'cyan',
                        ['\22'] = 'cyan',
                        ['\22s'] = 'cyan',

                        -- Select (more subdued purple – classic retro accent)
                        s = 'magenta',
                        S = 'magenta',
                        ['\19'] = 'magenta',

                        -- Insert (classic green = safe/editing)
                        i = 'green',
                        ic = 'green',
                        ix = 'green',

                        -- Replace (orange = danger/change)
                        R = 'orange',
                        Rc = 'orange',
                        Rx = 'orange',
                        Rv = 'orange',
                        Rvc = 'orange',
                        Rvx = 'orange',

                        -- Command-line & special (yellow/orange tones)
                        c = 'yellow',
                        cv = 'yellow',
                        r = 'yellow',
                        rm = 'yellow',
                        ['r?'] = 'yellow',
                        ['!'] = 'red',
                        t = 'blue', -- terminal often gets blue in retro themes
                    },
                },
                provider = function(self) return ' ' .. self.mode_names[self.mode] .. ' ' end,
                hl = function(self) return { fg = self.mode_colors[self.mode] } end,
                update = {
                    'ModeChanged',
                    pattern = '*:*',
                    callback = vim.schedule_wrap(function() vim.cmd('redrawstatus') end),
                },
            }

            local statusline = {
                nvim_modes,
            }

            return {
                statusline = statusline,
            }
        end,
    },
}

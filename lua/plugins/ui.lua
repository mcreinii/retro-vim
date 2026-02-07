return {
    -- Everforest colorscheme
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = 'hard'

            vim.g.everforest_enable_italic = true

            vim.g.everforest_transparent_background = 0
            vim.g.everforest_dim_inactive_windows = 0
            vim.g.everforest_disable_italic_comment = 0

            vim.g.everforest_diagnostic_text_highlight = 1
            vim.g.everforest_diagnostic_line_highlight = 0
            vim.g.everforest_diagnostic_virtual_text = 'grey'

            vim.cmd([[colo everforest]])
        end,
    },

    -- Gruvbox
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.g.gruvbox_contrast_dark = 'hard'
            vim.cmd([[colo gruvbox]])
        end,
    },

    -- Explorer
    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            default_file_explorer = true,
            view_options = {
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
            local conditions = require('heirline.conditions')

            local nvim_modes = {
                init = function(self) self.mode = vim.fn.mode(1) end,
                static = {
                    mode_names = {
                        n = '[ NORMAL ]',
                        no = '[ OP-PENDING ]',
                        nov = '[ OP-PENDING (char) ]',
                        noV = '[ OP-PENDING (line) ]',
                        ['no\22'] = '[ OP-PENDING (block) ]',
                        niI = '[ NORMAL (insert) ]',
                        niR = '[ NORMAL (replace) ]',
                        niV = '[ NORMAL (virtual-replace) ]',
                        nt = '[ TERMINAL-NORMAL ]',

                        v = '[ VISUAL ]',
                        vs = '[ VISUAL (select) ]',
                        V = '[ VISUAL-LINE ]',
                        Vs = '[ VISUAL-LINE (select) ]',
                        ['\22'] = '[ VISUAL-BLOCK ]',
                        ['\22s'] = '[ VISUAL-BLOCK (select) ]',

                        s = '[ SELECT ]',
                        S = '[ SELECT-LINE ]',
                        ['\19'] = '[ SELECT-BLOCK ]',

                        i = '[ INSERT ]',
                        ic = '[ INSERT (compl-generic) ]',
                        ix = '[ INSERT (compl-menu) ]',

                        R = '[ REPLACE ]',
                        Rc = '[ REPLACE (compl-generic) ]',
                        Rx = '[ REPLACE (compl-menu) ]',
                        Rv = '[ VIRTUAL-REPLACE ]',
                        Rvc = '[ VIRTUAL-REPLACE (compl-generic) ]',
                        Rvx = '[ VIRTUAL-REPLACE (compl-menu) ]',

                        c = '[ COMMAND ]',
                        cv = '[ EX-MODE ]',
                        r = '[ HIT-ENTER ]',
                        rm = '[ --MORE-- ]',
                        ['r?'] = '[ CONFIRM ]',
                        ['!'] = '[ SHELL ]',
                        t = '[ TERMINAL ]',
                    },
                    mode_colors = {
                        n = 'red',
                        no = 'red',
                        nov = 'red',
                        noV = 'red',
                        ['no\22'] = 'red',
                        niI = 'red',
                        niR = 'red',
                        niV = 'red',
                        nt = 'red',

                        v = 'cyan',
                        vs = 'cyan',
                        V = 'cyan',
                        Vs = 'cyan',
                        ['\22'] = 'cyan',
                        ['\22s'] = 'cyan',

                        s = 'magenta',
                        S = 'magenta',
                        ['\19'] = 'magenta',

                        i = 'green',
                        ic = 'green',
                        ix = 'green',

                        R = 'orange',
                        Rc = 'orange',
                        Rx = 'orange',
                        Rv = 'orange',
                        Rvc = 'orange',
                        Rvx = 'orange',

                        c = 'yellow',
                        cv = 'yellow',
                        r = 'yellow',
                        rm = 'yellow',
                        ['r?'] = 'yellow',
                        ['!'] = 'red',
                        t = 'blue',
                    },
                },
                provider = function(self) return self.mode_names[self.mode] end,
                hl = function(self) return { fg = self.mode_colors[self.mode] } end,
                update = {
                    'ModeChanged',
                    pattern = '*:*',
                    callback = vim.schedule_wrap(function() vim.cmd('redrawstatus') end),
                },
            }

            local filename = {
                provider = function()
                    local fname = vim.fn.expand('%:~:.')
                    if fname == '' then fname = '' end
                    return fname
                end,
                hl = { fg = 'gray' },
                flexible = 2,
                { provider = '%<' },
            }

            local git_diff = {
                condition = conditions.is_git_repo(),

                init = function(self) self.status_dict = vim.b.gitsigns_status_dict or {} end,

                hl = { fg = 'gray' },

                {
                    provider = function(self)
                        local head = self.status_dict.head or '?'
                        return 'GIT:' .. head
                    end,
                    hl = { bold = true },
                },

                {
                    provider = function(self)
                        local n = self.status_dict.added or 0
                        return n > 0 and ('[+]%d'):format(n) or ''
                    end,
                    hl = { fg = 'green' },
                },

                {
                    provider = function(self)
                        local n = self.status_dict.changed or 0
                        return n > 0 and ('[~]%d'):format(n) or ''
                    end,
                    hl = { fg = 'orange' },
                },

                {
                    provider = function(self)
                        local n = self.status_dict.removed or 0
                        return n > 0 and ('[-]%d'):format(n) or ''
                    end,
                    hl = { fg = 'red' },
                },

                { provider = '%<' },
            }

            local lsp_status = {
                static = {},
                provider = function(self)
                    self.clients = {}
                    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                        if client.name ~= 'null-ls' and client.name ~= 'copilot' then
                            table.insert(self.clients, client.name)
                        end
                    end
                end,

                hl = { fg = 'gray' },
                {
                    flexible = 3,
                    {
                        provider = function(self)
                            if #self.clients == 0 then return 'LSP:INACTIVE' end
                            return 'LSP:ACTIVE'
                        end,
                    },
                },
                update = {
                    'LspAttach',
                    'BufEnter',
                    'BufLeave',
                },
            }

            local diagnostics = {
                condition = conditions.has_diagnostics(),

                init = function(self)
                    local c = vim.diagnostic.count(0) or {}
                    self.errors = c[vim.diagnostic.severity.ERROR] or 0
                    self.warnings = c[vim.diagnostic.severity.WARN] or 0
                    self.info = c[vim.diagnostic.severity.INFO] or 0
                    self.hints = c[vim.diagnostic.severity.HINT] or 0
                end,

                update = { 'DiagnosticChanged', 'BufEnter' },

                hl = { fg = 'gray' },

                provider = function(self)
                    local parts = {}

                    if (self.warnings or 0) > 0 then table.insert(parts, 'WARN:' .. self.warnings) end

                    if (self.errors or 0) > 0 then table.insert(parts, 'ERROR:' .. self.errors) end

                    if (self.info or 0) > 0 then table.insert(parts, 'INFO:' .. self.info) end

                    if (self.hints or 0) > 0 then table.insert(parts, 'HINT:' .. self.hints) end

                    return table.concat(parts, ' ')
                end,
            }

            local statusline = {
                { provider = ' ' },
                nvim_modes,
                { provider = ' ' },
                filename,
                { provider = ' ' },
                git_diff,
                { provider = '%=' },
                diagnostics,
                { provider = ' ' },
                lsp_status,
            }

            return {
                statusline = statusline,
            }
        end,
    },

    -- Whichkey
    {
        'folke/which-key.nvim',
        opts = {
            icons = {
                mappings = false,
                breadcrumb = '',
                separator = ' ',
                group = '',
            },
        },
    },

    -- LSP Notifier
    {
        'j-hui/fidget.nvim',
        event = 'LspAttach',
        opts = {
            progress = {
                ignore_empty_message = true,
                display = {
                    render = 'minimal',
                    done_icon = '[!]',
                    done_ttl = 3,
                },
            },
            notification = {
                override_vim_notify = true,
                view = {
                    stack_upwards = false,
                },
            },
            window = {
                blend = 0,
                relative = 'editor',
                anchor = 'se',
                row = -2,
                col = -4,
                border = 'none',
            },
        },
    },
}

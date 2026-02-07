return {
    -- Mason LSP Config
    {
        'mason-org/mason-lspconfig.nvim',
        lazy = false,
        opts = {},
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'neovim/nvim-lspconfig',
        },
        keys = {
            { 'gd',         vim.lsp.buf.definition,     desc = 'Go to definition' },
            { 'gD',         vim.lsp.buf.declaration,    desc = 'Go to declaration' },
            { 'gi',         vim.lsp.buf.implementation, desc = 'Go to implementation' },
            { 'gr',         vim.lsp.buf.references,     desc = 'References' },
            { 'K',          vim.lsp.buf.hover,          desc = 'Hover' },
            { '<C-k>',      vim.lsp.buf.signature_help, desc = 'Signature help' },
            { '<leader>ca', vim.lsp.buf.code_action,    desc = 'Code action' },
            { '<leader>rn', vim.lsp.buf.rename,         desc = 'Rename' },
            { '<leader>dl', vim.diagnostic.open_float,  desc = 'Line diagnostics' },
            { '[d',         vim.diagnostic.goto_prev,   desc = 'Prev diagnostic' },
            { ']d',         vim.diagnostic.goto_next,   desc = 'Next diagnostic' },
        },
    },

    -- LazyDev
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
}

require('mason-lspconfig').setup(opts)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
    callback = function(event)
        local bufnr = event.buf
        local opt = { buffer = bufnr, noremap = true, silent = true }

        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', opt, { desc = desc }))
        end

        map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
        map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
        map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
        map('n', 'gr', vim.lsp.buf.references, 'References')
        map('n', 'K', vim.lsp.buf.hover, 'Hover')
        map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')
        map('n', '<leader>la', vim.lsp.buf.code_action, 'Code action')
        map('n', '<leader>lr', vim.lsp.buf.rename, 'Rename')
        map('n', '<leader>ld', vim.diagnostic.open_float, 'Line diagnostics')
        map('n', '[d', vim.diagnostic.goto_prev, 'Prev diagnostic')
        map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
        map({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format, 'Format')
    end,
})

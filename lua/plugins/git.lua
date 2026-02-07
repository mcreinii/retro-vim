return {
    -- Git Signs
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },

    -- NeoGit
    {
        'NeogitOrg/neogit',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'ibhagwan/fzf-lua',
        },
        cmd = 'Neogit',
        keys = {
            { '<leader>g', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
        },
    },
}

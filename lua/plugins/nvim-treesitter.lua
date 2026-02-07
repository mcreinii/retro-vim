require('nvim-treesitter').setup({
    ensure_installed = {
        'lua',
        'typescript',
        'javascript',
        'tsx',
        'jsx',
    },
    auto_install = true,
})

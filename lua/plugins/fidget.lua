require('fidget').setup({
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
})

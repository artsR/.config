require('nvim-tree').setup({
    open_on_tab=true,
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
    },
    view = {
        adaptive_size=true,
        mappings={
            list={
                {key='u', action='dir_up'},
            },
        },
        float={
            enable=true,
        },
    },
    filters={
        custom={ 'node_modules', '.cache', '__pycache__' },
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
})


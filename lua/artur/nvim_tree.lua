require('nvim-tree').setup({
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
    },
    view = {
        adaptive_size=false,
        mappings={
            list={
                {key='u', action='dir_up'},
            },
        },
        float={
            enable=true,
        },
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


local status, configs = pcall(require, 'nvim-treesitter.configs')
if not status then return end

configs.setup {
    ensure_installed= {
        "python",
        "lua",
        "solidity",
        "json",
        "tsx",
        "css",
        "tsx"
    },
    autotag = {
        enabled=true,
    },
    sync_install=false,
    ignore_install={""}, -- List of parsers to ignore installing
    autopairs={
        enable=true,
    },
    highlight={
        enable=true, -- false will disable the whole extension
        disable={}, -- list of language that will be disabled
        additional_vim_regex_highlighting=true,
    },
    indent={
        enable=true,
        disable={"yaml"}
    },
    rainbow={
        enable=true,
        -- disable={ "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode=true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines=nil, -- Do not enable for files with more than n lines, int
        -- colors={}, -- table of hex strings
        -- termcolors={} -- table of colour name strings
    },
    rafactor={
        navigation={
            enable=true,
            keymaps={
                goto_next_usage='gr',
                goto_previous_usage='gR',
            },
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.solidity = {
      install_info = {
        url = "https://github.com/JoranHonig/tree-sitter-solidity", -- local path or git repo
        files = {"src/parser.c"},
        -- optional entries:
        branch = "master", -- default branch in case of git repo if different from master
        generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      },
      filetype = "solidity", -- if filetype does not match the parser name
}


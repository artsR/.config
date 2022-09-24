local options={
    swapfile=false,
    clipboard="unnamedplus",
    fileencoding="utf-8",
    showtabline=2,
    smartindent=true,
    smartcase=true,
    expandtab=true,
    tabstop=4,
    shiftwidth=4,

    number=true,
    relativenumber=true,

    wrap=true,

    hlsearch=false,
    ignorecase=true,
    incsearch=true,

    completeopt={"menuone","preview"},
    conceallevel=0,

    termguicolors=true,
    scrolloff=0,
    mouse="a",
    guifont="FiraCode_NFM:h10",
    syntax='on',

    -- treesitter settings for folding
    foldmethod="expr",
    foldexpr="nvim_treesitter#foldexpr()",

    shell = "powershell.exe -File D:/Source/WindowsPowerShell/neovim_powershell_profile.ps1",
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

-- Startify options
vim.g.startify_bookmarks= {
    {C = 'C:/Users/warzecha/AppData/Local/nvim'},
}
vim.g.indent_blankline_filetype_exclude = {  -- exclude indent color column
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'neo-tree',
    'Trouble',
}
vim.g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
}

-- Neovide options
if vim.g.neovide then
    vim.g.loaded=1
    vim.g.loaded_netrwPlugin=1
    vim.g.neovide_remember_window_size=true
    vim.g.neovide_input_use_logo=true
    vim.g.neovide_scroll_animation_length=0.5
    vim.g.neovide_scale=1
    vim.g.neovide_fullscreen=false
end


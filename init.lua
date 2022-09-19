require 'artur.options'
require 'artur.keymaps'
require 'artur.plugins'
require 'artur.hop'
-- require 'artur.cmp'
-- require 'artur.colorscheme'
-- require 'artur.nvim_lsp_installer'
require 'artur.lsp':load()
require 'artur.treesitter'
require 'artur.nvim_tree'
require 'artur.telescope'
require 'artur.bufferline'
require 'artur.indent_line'
require 'artur.lualine'
require 'artur.autopairs'
require 'artur.symbols_outline'

-- require('onedark').setup({
--  style = 'darker',
--  transparent = false,
--  term_colors = true,
--  ending_tildes = false,
--  toggle_style_key = "<leader>ts",
--  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
--  code_style = {
--    comments = 'italic',
--    keywords = 'none',
--    functions = 'none',
--    strings = 'none',
--    variables = 'none'
--  }
-- })

-- require('onedark').load()


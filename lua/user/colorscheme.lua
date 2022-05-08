require('onedark').setup {
  style = 'deep',
  transparent = 'false',
  term_colors = true,
  ending_tildes = false,
  toggle_style_key = '<leader>ts',
  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none',
  },
}
require('onedark').load()

local colorscheme = 'onedark'

local status_ok, _ = pcall(vim.cmd, 'colorscheme' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end


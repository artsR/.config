local options = {

  clipboard = 'unnamedplus',
  expandtab = true,
  fileencoding = 'utf-8',
	showtabline = 1,
  shiftwidth = 2,
  smartindent = true,
  smartcase = true,
	tabstop = 2,

  number = true,
  relativenumber  = true,

  wrap = true,

  hlsearch = false,
  ignorecase = true,
  incsearch = true,

  completeopt = { 'menuone', 'preview' },
  conceallevel = 0,

  termguicolors = true,
  scrolloff = 8,
  mouse = 'a',
  guifont = 'Fira Code:h12',
}

for key, value in pairs(options) do
	vim.opt[key] = value
end


local options = {
   
  encoding = 'utf-8',
  expandtab = true,
	showtabline = 1,
	tabstop = 2,
  shiftwidth = 2,
  smartindent = true,
  smartcase = true,

  number = true,
  relativenumber  = true,

  wrap = true,

  hlsearch = true,
  incsearch = true,
  ignorecase = true,

  conceallevel = 0,
  completeopt = { 'menuone', 'preview' },  

  scrolloff = 8,
  mouse = 'a',
  guifont = 'Fira/ Code:h20',
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

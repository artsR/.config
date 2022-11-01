local neovide_options = {
	neovide_cursor_vfx_mode='railgun',
	neovide_cursor_vfx_particle_density=15,
}

local options = {

	swapfile=false,
	clipboard={'unnamed', 'unnamedplus'},
	fileencoding='utf-8',

	number=true,
	relativenumber=true,

  expandtab=true,
  tabstop=4,
  shiftwidth=4,
	autoindent=true,

	-- pseudo-transparency appearance
	winblend=0,
	pumblend=5,

	-- search settings
	incsearch=true,
	hlsearch=false,
	ignorecase=true,
	smartcase=true,

	foldmethod='expr',
	foldexpr='nvim_treesitter#foldexpr()',

	termguicolors=true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

--TODO: incorporate belows items into options table
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '/node_modules/*', '__pycache__/*' }

if vim.g.neovide then
	for key, value in pairs(neovide_options) do
		vim.g[key] = value
	end
end

-- autocommands
vim.opt.expandtab = true
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	command = 'setlocal shiftwidth=2 tabstop=2'
})


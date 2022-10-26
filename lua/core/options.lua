local neovide_options = {
	neovide_cursor_vfx_mode='railgun',
	neovide_cursor_vfx_particle_density=15
}

local options = {

	swapfile=false,
	clipboard={'unnamed', 'unnamedplus'},
	fileencoding='utf-8',

	number=true,
	relativenumber=true,

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

if vim.g.neovide then
	for key, value in pairs(neovide_options) do
		vim.g[key] = value
	end
end

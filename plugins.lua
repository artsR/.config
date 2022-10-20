local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads Neovim whenever I save the plugins.lua
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so I don't error out on the first use
local status, packer = pcall(require, "packer")
if not status then
	vim.notify("Packer has not been loaded properly!")
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function() return require('packer.util').float {border="rounded"} end,
	},
}

-- Install plugins
return packer.startup(function(use)
	-- plugins here
	
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end

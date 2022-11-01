local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

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
	vim.notify("Packer has not been loaded properly!", "error")
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
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'

	use {
		'rcarriga/nvim-notify',
		config = function ()
			require('notify').setup()
			vim.notify = require('notify')
		end
	}
	use 'folke/which-key.nvim'
	-- use 'LinArcX/telescope-command-palette.nvim'

	-- Appearance
	use 'navarasu/onedark.nvim'
	use 'folke/tokyonight.nvim'
	-- use {
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup {
	-- 			flavour = "macchiato" -- mocha, macchiato, frappe, latte
	-- 		}
	-- 		vim.api.nvim_command "colorscheme catppuccin"
	-- 	end
	-- }
  -- use 'dracula/vim.git dracula'
  -- use 'fugalh/desert.vim'
  -- use 'RRethy/nvim-base16'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use {
		'nvim-lualine/lualine.nvim',  -- status line
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync=true })
		end,
	}
	-- use 'nvim-treesitter/nvim-treesitter-context'

	-- Navigation
	use 'nvim-tree/nvim-tree.lua'
	use 'phaazon/hop.nvim'
	-- use 'p00f/nvim-ts-rainbow'  -- rainbow parentheses using TreeSitter
	-- use 'folke/twilight.nvim'  -- dim inactive portions of the code using TreeSitter
	-- use 'lukas-reineke/indent-blankline.nvim'
	-- use 'anuvyklack/pretty-fold.nvim'  -- foldtext customization
	-- use 'anuvyklack/windows.nvim'  -- automatically expand width of the current window
	-- use 'preservim/tagbar'
	use 'simrat39/symbols-outline.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x'
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
	use 'nvim-telescope/telescope-file-browser.nvim'

	-- Completion
	use 'hrsh7th/nvim-cmp'  -- completion engine
	use 'hrsh7th/cmp-buffer'  -- buffer completion engine
	use 'hrsh7th/cmp-path'  -- system path completion engine
	use 'hrsh7th/cmp-nvim-lsp'  -- lsp completion engine
	-- use {
	-- 	'tzachar/cmp-tabnine',
	-- 	run = './install.sh',
	-- 	requires = 'hrsh7th/nvim-cmp'
	-- }

	-- Snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- LSP
	-- -- managing & installing lsp servers
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	-- -- configuring lsp servers
	use 'neovim/nvim-lspconfig'
	use {
		'glepnir/lspsaga.nvim',
		branch = 'main'
	}
	use 'onsails/lspkind.nvim'
	use 'jose-elias-alvarez/typescript.nvim'

	-- -- formatting & linting
	use 'jose-elias-alvarez/null-ls.nvim'
  -- use {
  --   'MunifTanjim/prettier',
  --   requires = 'jose-elias-alvarez/null-ls.nvim'
  -- }
	use 'jayp0521/mason-null-ls.nvim'

	-- Utils
	use 'tpope/vim-surround'
	use 'windwp/nvim-autopairs'
	use 'numToStr/Comment.nvim'
	use 'norcalli/nvim-colorizer.lua'  -- color highlighter

	-- Git
	-- use '/git.nvim'  -- git-fugitive substitution
	-- use 'lewis6991/gitsigns.nvim'

	-- Web Dev
	-- use 'ray-x/web-tools.nvim'  -- launch a local development server with live reload feature for static & dynamic pages, HTTP & CSS tag rename with LSP
	use 'windwp/nvim-ts-autotag'  -- use TreeSitter to autoclose and autorename XML, HTML, JSX tags

	-- Media
	-- use 'samodostal/image.nvim  -- image viewer as ASCII art

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
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

-- Autocommand that reloads Neovim whenever you save the plugins.lua
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer has not been loaded properly!")
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install plugins
return packer.startup(function(use)
	-- plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	-- colorschemes
	use "lunarvim/colorschemes"
	use "lunarvim/onedarker.nvim" -- Onehalfdark theme
	use "navarasu/onedark.nvim" -- extensive onedark theme
  use "rakr/vim-one" -- Atom one like color scheme (limited support for languages)
  use "joshdick/onedark.vim" -- Onedark theme
  use { "dracula/vim", as = "dracula" }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer (provide menu to choose server)
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-nvim-lsp" -- add LSP completion
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline opts
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- cmdline opts
  use "hrsh7th/cmp-nvim-lua" -- completion for neovim lua API
  use "onsails/lspkind-nvim" -- prettify completion popup

	use "saadparwaiz1/cmp_luasnip" -- snippet completions

	-- snippets
	use "L3MON4D3/LuaSnip" -- snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --use "ray-x/cmp-treesitter" -- treesitter highlight nodes as completion candicates

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/plenary.nvim"}
  }
  -- Telescope Extensions
  use "cljoly/telescope-repo.nvim"
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use "dhruvmanila/telescope-bookmarks.nvim"
  use "nvim-telescope/telescope-github.nvim"
  -- Trying command palette
  use { "LinArcX/telescope-command-palette.nvim" }
  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "jvgrootveld/telescope-zoxide"

  -- use "kyazdani142/nvim-web-devicons" -- tree webicons

  -- Treesitter
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
  -- }
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'
  -- git

  -- Facilities",
  -- easier navigation
  use { "phaazon/hop.nvim", as = "hop" }

	-- automatically set up you configuration after cloning packer.nvim
	-- put this at the end after all plugins
	if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

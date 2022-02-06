require('keybindings')

vim.cmd [[
    syntax enable
    colorscheme base16-onedark
]]

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.g.neovide_cursor_vfx_mode = 'railgun'

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' ..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so to not error out on the first use 
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float {border = 'rounded'}
        end,
    },
}

return require('packer').startup(function(use)
    -- plugins here
    use 'wbthomason/packer.nvim' -- Have packer manager itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of pluging

    use 'chriskempson/base16-vim'
    
    use 'mhinz/vim-startify'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('nvim-treesitter.configs').setup {
            ensure_installed = {'python', 'lua'},
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        }
        end

    }

    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end

end)


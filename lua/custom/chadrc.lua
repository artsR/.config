-- First read our docs (completely) then check the example_config repo
local M = {}

M.mappings = require "custom.mappings"

-- make sure to maintain the structure of `core\default_config.lua` here

M.ui = {
  theme = "ayu-dark",
}


M.plugins = {
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require('plugins.configs.lspconfig')
      require('custom.plugins.lspconfig')
    end
  },

  user = require('custom.plugins')

}

return M

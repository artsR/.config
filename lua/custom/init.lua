
vim.opt.swapfile=false

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- local hooks = require('core.hooks')
--
-- hooks.add('install_plugins', function(use)
-- --   use {
-- --     'windwp/nvim-ts-autotag',
-- --     after = 'nvim-treesitter',
-- --     -- event = 'InsertEnter',
-- --     config = function()
-- --       require('nvim-ts-autotag').setup {}
-- --     end,
-- --   }
-- --
--   use {
--     'nvim-telescope/telescope-file-browser',
--     after = 'telescope.nvim',
--     -- module = 'telescope',
--     requires = {
--       'nvim-tree/nvim-web-devicons',
--     },
--     config = function()
--       require('telscope').load_extension('file-browser')
--     end
--   }
--
--   use {
--     'kylechui/nvim-surround',
--     config = function()
--       require('nvim-surround').setup {}
--     end
--   }
--
--   -- use {
--   --   'Pocco81/true-zen.nvim',
--   --   config = function()
--   --     require('true-zen').setup {}
--   --   end
--   -- }
--
-- end)

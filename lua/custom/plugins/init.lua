return {

  ['phaazon/hop.nvim'] = {
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  ['kylechui/nvim-surround'] = {
    config = function ()
      require('nvim-surround').setup {}
    end
  },

  ['windwp/nvim-ts-autotag'] = {
    after = 'nvim-treesitter',
    config = require('custom.plugins.autotag'),
  },

  ['simrat39/symbols-outline.nvim'] = {
    config = require('custom.plugins.symbols')
  },

  -- ['folke/twilight.nvim'] = {
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require('twilight').setup {}
  --   end
  -- },

  -- ['Pocco81/true-zen.nvim'] = {
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require('custom.plugins.zen')
  --     -- require('true-zen').setup {}
  --   end
  -- },
}

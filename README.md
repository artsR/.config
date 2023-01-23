# List of plugins:

- 'mbbill/undotree'
  - '<leader>u', ':UndotreeToggle<CR>'
- 'kylechui/nvim-surround'
- 'phaazon/Hop.nvim'
- LSP configuration
  ```lua
  -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
  ```
- 'github/copilot.vim'
  - nodeJS
  - '<CMD>Copilot setup<CR>' to check settings

- 'rcarriga/nvim-notify'
- 'kdheepak/tabline.nvim'
- 'gen740/SmoothCursor.nvim'
- 'nyngwang/NeoZoom.lua'
- 'windwp/nvim-autopairs'
  -- treesitter.configs
  ```lua
  indent = {
    enable = true
  }
  ```
  -- configs
  ```lua
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')
  npairs.clear_rules()

  -- Expand pair only on <CR> key
  for _, bracket in pairs { { '(', ')' }, { '[', ']' }, { '{', '}' }, { "f'", "'" } } do
    npairs.add_rules {
      Rule(bracket[1], bracket[2])
        :end_wise(function() return true end)
    }
  end

  -- Arrow key on JavaScript
  Rule('%(.*%)%s*%=>', ' { }', { 'typescript', 'typescriptreact', 'javascript' })
    :use_regex(true)
    :set_end_pair_length(2),
  ```

- 'windwp/nvim-ts-autotag'
  -- treesitter.configs or just require('nvim-ts-autotag').setup {}
  ```lua
  autotag = {
    enable = true,
  }
  ```

- 'aurum77/live-server.nvim'


### Additional plugins nice to have
- 'uloco/bluloco.nvim'


# Structure of configs:
* lua
|
--* core, custom, plugins, gui

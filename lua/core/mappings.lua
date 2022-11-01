local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

keymap('n', '<C-s>', ':w<CR>', opts)
keymap('i', '<C-s>', '<ESC>:w<CR>', opts)
keymap('i', 'jk', '<ESC>', opts)
keymap('t', 'jk', '<C-\\><C-n>', opts)

keymap('n', '<leader>nh', ':nohl<CR>', opts)

-- Normal --
-- Better window navigation
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)
keymap('n', '<leader>bn', ':bn<CR>', opts)
keymap('n', '<leader>bp', ':bp<CR>', opts)

-- nvim-tree keymaps
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- hop motion configuration
keymap('n', '<leader>hs', '<CMD>HopPatternMW<CR>', opts)
keymap('n', '<leader>hf', '<CMD>HopChar1CurrentLine<CR>', opts)
keymap('n', '<leader>hc', '<CMD>HopWordCurrentLine<CR>', opts)
keymap('n', '<leader>hw', '<CMD>HopWord<CR>', opts)
keymap('n', '<leader>hl', '<CMD>HopLineStart<CR>', opts)
keymap('n', '<leader>hm', '<CMD>HopWordMW<CR>', opts)

-- telescope
keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
keymap('n', '<leader>fs', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fc', '<CMD>Telescope grep_string<CR>', opts)
keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opts)


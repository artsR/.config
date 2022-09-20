local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maploclleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- ## Search
keymap('n', '<leader>ss', '/', opts)

-- ## Better window navigation
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)
keymap('n', '<leader>bn', ':bn', opts)
keymap('n', '<leader>bp', ':bp', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Navigate buffers
-- keymap('n', '<S-l>', ':bNext<CR>', opts)
-- keymap('n', '<S-h>', ':bPrevious<CR>', opts)

-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

keymap('n', '<C-s>', ':w<CR>', opts)

-- Insert --
-- Press jk fast to enter
keymap('i', 'jk', '<Esc>', opts)
keymap('i', '<C-s>', '<Esc>:w<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Nvim-Tree --
keymap('n', '<leader>nt', '<CMD>NvimTreeToggle<CR>', opts)
keymap('n', '<leader>nf', '<CMD>NvimTreeFocus<CR>', opts)

-- Startify
keymap('n', '<leader>S', '<CMD>Startify<CR>', opts)

-- Hop -- easier navigation with hop
-- place this in one of your configuration file(s)
-- keymap('n', '<leader>f', '<CMD>HopWord<CR>', opts) interferes with Telescope
keymap('n', '<leader>hw', '<CMD>HopWord<CR>', opts)
keymap('n', '<leader>hl', '<CMD>HopLineStart<CR>', opts)
keymap('n', '<leader>hc', '<CMD>HopWordCurrentLine<CR>', opts)
keymap('n', '<leader>hmw', '<CMD>HopWordMW<CR>', opts)
keymap('n', '<leader>hh', '<CMD>HopPatternMW<CR>', opts)

-- Terminal --
-- Better terminal navigation
-- keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
-- keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
-- keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
-- keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

-- Telescope --
keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', opts)
keymap('n', '<leader>fb', '<CMD>Telescope file_browser<CR>', opts)
keymap('n', '<leader>fd', '<CMD>Telescope fd<CR>', opts)

-- Treesitter --
keymap('n', '<leader>tr', '<CMD>TSHighlightCapturesUnderCursor<CR>', opts)


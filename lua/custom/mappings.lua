local M = {}

M.general = {
  i = {
    ['jk'] = { "<ESC>", "", opts = { silent = true } },
    ['C-s'] = { '<Esc>:w<CR>', 'Save file' },
  },

  n = {
    ['C-s'] = { ':w<CR>', 'Save file' },
    ['<C-d>'] = { "<C-d>zz", "", opts = { silent = true } },
    ['<C-u>'] = { "<C-u>zz", "", opts = { silent = true } },
    ['n'] = { 'nzzzv', 'go to [n]ext searched frase and center' },
    ['N'] = { 'Nzzzv', 'go to previous searched frase and center' },
    ['<leader>bb'] = { '<CMD> Telescope file-browser <CR>', 'File [BB]rowser'}

  },

  v = {
    ['C-s'] = { '<Esc>:w<CR>', 'Save file' },
    ['>'] = { '>gv', '' },
    ['<'] = { '<gv', '' },
    -- ['J'] = { ":m '>+1<CR>gv=gv", '' },
    -- ['K'] = { ":m '<-2<CR>gv=gv", '' },
  },

  x = {
    ['<leader>p'] = { '"_dP', ''},
  }

}

M.hop = {
  n = {
    ['<leader>hw'] = { '<CMD>HopWord<CR>', '[H]op to [W]ord' },
    ['<leader>hl'] = { '<CMD>HopLineStart<CR>', '[H]op to [L]ine' },
    ['<leader>hc'] = { '<CMD>HopWordCurrentLine<CR>', '[H]op to word in [C]urrent Line' },
    ['<leader>hf'] = { '<CMD>HopWord<CR>', '[H]op to [F]ind 2 chars' },
    ['<leader>hmw'] = { '<CMD>HopWord<CR>', '[H]op to word [M]ulti[W]indows' },
    ['<leader>hh'] = { '<CMD>HopWord<CR>', '[H]op to Pattern MultiWindows' },
    ['<leader>ha'] = { '<CMD>HopWord<CR>', '[H]op [A]nywhere' },
  },
}

M.symbols = {
  n = {
    ['<leader>st'] = { '<CMD>SymbolsOutline<CR>', '[S]ymbols [O]utline' },
  },

}

-- M.truezen = {
--   n = {
--     ['<leader>zn'] = { '<CMD>TZ[N]arrow<CR>', '' },
--     ['<leader>zf'] = { '<CMD>TZ[F]ocus<CR>', '' },
--     ['<leader>zm'] = { '<CMD>TZ[M]inimalist<CR>', '' },
--     ['<leader>za'] = { '<CMD>TZ[A]taraxis<CR>', '' },
--   },
--
--   v = {
--     ['<leader>zn'] = { '<CMD>\'<,\'>TZ[N]arrow<CR>', '' },
--   }
-- }


return M

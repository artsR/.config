local M = {}

M.general = {
  n = {
    ['<C-d>'] = { "<C-d>zz", "", opts = { silent = true } },
    ['<C-u>'] = { "<C-u>zz", "", opts = { silent = true } },
  },
  i = {
    ['jk'] = { "<ESC>", "", opts = { silent = true } },
  },
}

return M

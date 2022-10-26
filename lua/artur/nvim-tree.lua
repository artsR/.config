local status, nvimtree = pcall(require, 'nvim-tree')
if not status then return end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()


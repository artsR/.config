local status, telescope = pcall(require, 'telescope')
if not status then return end

local status_actions, actions = pcall(require, 'telescope.actions')
if not status_actions then return end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				['<C-h>'] = 'which_key',
			}
		}
	}
})

-- telescope.load_extension('fzf')


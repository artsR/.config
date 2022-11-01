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
	},
	-- extensions = {
	-- 	file_browser = {
	-- 		hijack_netrw = true,  -- disables netrw; use telescope-file-browser in its place
	-- 	},
	-- }
})

telescope.load_extension('notify')
telescope.load_extension('fzf')
-- telescope.load_extension('file_browser')


local status, lualine = pcall(require, 'lualine')
if not status then return end


lualine.setup({
	options = {
		globalstatus = false,
		theme = 'onedark',
		disabled_filetypes = {
			statusline = {'packer', 'NvimTree'},
		},
    		section_separators = { left = '', right = '' },
	}
})


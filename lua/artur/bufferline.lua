local status, buffertabs = pcall(require, 'bufferline')
if not status then return end

buffertabs.setup({
	options = {
		numbers = function(opts) return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal)) end,
    -- separator_style = 'slant',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true,
      }
    },
	},
})

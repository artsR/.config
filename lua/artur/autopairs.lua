local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then return end

autopairs.setup({
	check_ts = true,
	ts_config = {
 		lua = { 'string' },
		javascript = { 'template_string' },
		java = false, -- don't check treesitter on java
	}
})

-- import nvim-autopairs completion functionality safely
local status_autopairs_cmp, autopairs_cmp = pcall(require, 'nvim-autopairs.autopairs.completion.cmp')
if not status_autopairs_cmp then return end

-- import nvim-cmp plugin safely (completions plugin)
local status_cmp, cmp = pcall(require, 'cmp')
if not status_cmp then return end

-- make autopairs and completions work together
cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done())


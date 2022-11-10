local status_cmp, cmp = pcall(require, 'cmp')
if not status_cmp then return end

local status_luasnip, luasnip = pcall(require, 'luasnip')
if not status_luasnip then return end

local status_lspkind, lspkind = pcall(require, 'lspkind')
if not status_lspkind then return end

-- load friendly-snippets
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = {'menu','menuone','noselect'}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}), -- show completion suggestions
		['<C-e>'] = cmp.mapping.abort(), -- close completion window
		['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- lsp snippets
		{ name = 'luasnip' }, -- snippets
		{ name = 'buffer' }, -- text within current buffer
    { name = 'cmp-nvim-lsp-signature-help' },
    { name = 'cmp-nvim-lua' },
		{ name = 'path' }, -- file system paths
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		})
	},
})


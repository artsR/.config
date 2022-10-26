local status_mason, mason = pcall(require, 'mason')
if not status_mason then return end

local status_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_mason_lspconfig then return end

local status_mason_null_ls, mason_null_ls = pcall(require, 'mason-null-ls')
if not status_mason_null_ls then return end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		'tsserver',
		'html',
		'cssls',
		'sumneko_lua',
		'pyright',
	}
})

mason_null_ls.setup({
	ensure_installed = {
		'prettier',
		'stylua',
		'eslint_d',
		'flake8',
		'black',
	}
})

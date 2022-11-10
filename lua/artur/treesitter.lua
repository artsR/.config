local status, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status then return end

treesitter_configs.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		'json',
		'javascript',
		'typescript',
		'tsx',
		'html',
		'css',
		'bash',
		'lua',
		'vim',
		'python',
		'solidity',
		'qmljs',
		'dockerfile',
		'gitignore',
		'regex',
		'yaml',
		'toml',
	},
	auto_install = true,
})

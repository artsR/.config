local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_command([[augroup Format]])
			vim.api.nvim_command([[autocmd! * <buffer>]])
			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.lsp.Format()]])
			vim.api.nvim_command([[augroup END]])
		end
	end,
	sources = {
		formatting.stylua,
		-- formatting.prettierd,
		diagnostics.eslint_d,
		-- diagnostics.flake8,
		-- diagnostics.mypy,
		diagnostics.hadolint, -- Dockerfile linter that helps build best practice Docker images
		diagnostics.mlint, -- linter for Matlab
		diagnostics.qmllint, -- verifies validity of QML , warns about some QML anti-patterns
		diagnostics.shellcheck, --Shell script static analysis tool
		diagnostics.solhint, -- linter for Solidity; provides security and style guide validation
	},
})

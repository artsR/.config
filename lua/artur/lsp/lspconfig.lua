local status_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not status_lspconfig then return end

local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_nvim_lsp then return end

local status_typescript_lsp, typescript_lsp = pcall(require, 'typescript')
if not status_typescript_lsp then return end


local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true }

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", ":CodeActionMenu<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmp>Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

	if client.name == 'tsserver' then
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", "<cmd>TypescriptRenameFile<CR>", opts)
	end
end

-- enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['html'].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach
	}
})

typescript_lsp.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach
	}
})

lspconfig['cssls'].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach
	}
})

lspconfig['pyright'].setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach
	}
})

lspconfig['sumneko_lua'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize 'vim' global
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
		},
	},
})


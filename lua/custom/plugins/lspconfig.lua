local on_attach = require('plugins.configs.lspconfig')
local capabilities = require('plugins.configs.lspconfig')

local lspconfig = require('lspconfig')
-- local servers = { 'html', 'cssls' }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- lspconfig.sumneko_lua.setup {
--  settings = {
--    Lua = {
--      diagnostics = {
--        globals = { 'vim' }
--      }
--    }
--  },
--  on_attach = on_attach,
--  capabilities = capabilities,
-- }

lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
      },
    },
  },
 on_attach = on_attach,
 capabilities = capabilities,
}
